/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import entity.*;
import model.*;

/**
 *
 * @author Admin
 */
public class ProcessCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String masp = request.getParameter("masp");
        String quantity = request.getParameter("quantity");
        String size = request.getParameter("size");

        ShoeDAO sd = new ShoeDAO();
        List<Shoe> lst = sd.listShoe(null);
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        Cart cart = new Cart(txt, lst);
        try {
            int isize = Integer.parseInt(size);
            int iquantity = Integer.parseInt(quantity);
            int totalquantity = sd.soLuong(masp, size);
            if (iquantity > totalquantity) {
                response.sendRedirect("giohang");
            } else {
                List<Item> listItem = cart.getItems();
                cart.getItem(masp, isize).setQuantity(iquantity);
                txt = "";
                for (Item i : listItem) {
                    if (txt.isEmpty() || txt.equals("")) {
                        txt = i.getShoe().getId() + ":" + i.getSize() + ":" + i.getQuantity();
                    } else {
                        txt = txt + "/" + i.getShoe().getId() + ":" + i.getSize() + ":" + i.getQuantity();
                    }
                }
                Cookie cookie = new Cookie("cart", txt);
                cookie.setMaxAge(2 * 24 * 60 * 60);
                response.addCookie(cookie);
                response.sendRedirect("giohang");
            }
        } catch (NumberFormatException e) {
            out.print("vlluon");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
