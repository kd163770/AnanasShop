/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import entity.*;
import jakarta.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author Admin
 */
public class DeleteCookiesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
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
        String masp = request.getParameter("masp");
        String size = request.getParameter("size");
        Cart cart = new Cart(txt, lst);
        try {
            int isize = Integer.parseInt(size);
            cart.removeItem(masp, isize);
            out.print(isize);
        } catch (NumberFormatException e) {

        }

        txt = "";
        List<Item> listItem = cart.getItems();
        for (Item i : listItem) {
            if (txt.isEmpty() || txt.equals("")) {
                txt = i.getShoe().getId() + ":" + i.getSize() + ":" + i.getQuantity();
            } else {
                txt = txt + "/" + i.getShoe().getId() + ":" + i.getSize() + ":" + i.getQuantity();
            }
        }

        int n;
        if (listItem != null) {
            n = listItem.size();
        } else {
            n = 0;
        }
        Cookie cookie = new Cookie("cart", txt);
        cookie.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(cookie);
        response.sendRedirect("giohang");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] arr = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
                if(o.getName().equals("quantity")){
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        response.sendRedirect("giohang");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
