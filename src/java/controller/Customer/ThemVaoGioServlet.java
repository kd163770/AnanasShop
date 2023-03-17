/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.Item;
import entity.Cart;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ThemVaoGioServlet", urlPatterns = {"/themvaogiohang"})
public class ThemVaoGioServlet extends HttpServlet {

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
        String soluong = request.getParameter("soluong");
        String size = request.getParameter("size");
        String name = "KhaiDao";
        if (txt.isEmpty() || txt.equals("")) {
            txt = masp + ":" + size + ":" + soluong + ":" + name;
        } else {
            txt = txt + "/" + masp + ":" + size + ":" + soluong + ":" + name;
        }
        
        //only add item
        if (request.getParameter("type").equals("them")) {
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
            
            Cart cart = new Cart(txt, lst);
            List<Item> listItem = cart.getItems();
            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }
            ShoeDAO s = new ShoeDAO();
            Shoe shoe = s.searchProduct(masp);

            int soluong2 = s.soLuong(masp, size);

            request.setAttribute("size", size);
            request.setAttribute("shoe", shoe);
            List<Shoe> lst1 = s.relateProduct(masp, String.valueOf(shoe.getLoai_giay()));
            request.setAttribute("soluong", soluong2);
            request.setAttribute("lst", lst1);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } 
        //add item and go to giohang
        else {
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(c);
            Cart cart = new Cart(txt, lst);
            List<Item> listItem = cart.getItems();
            double realMoney = cart.getRealMoney();
            double saleMoney = cart.getSaleMoney();
            double totalMoney = cart.getTotalMoney();
            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }
            request.setAttribute("lst", listItem);
            request.setAttribute("size", n);

            //
            Double s1 = totalMoney;
            Double s2 = saleMoney;
            Double s3 = realMoney;
            String ssaleMoney = s2.toString();
            String srealmoney = s3.toString();
            String stotalmoney = s1.toString();
            request.setAttribute("salemoney", ssaleMoney);
            request.setAttribute("realmoney", srealmoney);
            request.setAttribute("totalmoney", stotalmoney);
            request.getRequestDispatcher("giohang.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
