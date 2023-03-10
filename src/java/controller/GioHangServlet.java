/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Item;
import entity.Cart;
import entity.Shoe;
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
public class GioHangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ShoeDAO sd = new ShoeDAO();
        List<Shoe> lst = sd.listShoe(null);
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
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
         session.setAttribute("soluong", n);
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        ShoeDAO sd = new ShoeDAO();
        List<Shoe> lst = sd.listShoe(null);
        Cookie[] arr = request.getCookies();
        CustomerDAO cd = new CustomerDAO();
        Customer cus = cd.searchUser((String) session.getAttribute("name"));
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        if (txt.equals("") || txt == null) {
            String err = "Bạn chưa có sản phẩm nào trong giỏ hàng";
            request.setAttribute("salemoney", "0");
            request.setAttribute("realmoney", "0");
            request.setAttribute("totalmoney", "0");
            request.setAttribute("cus", cus);
            request.setAttribute("err", err);
            request.getRequestDispatcher("giohang.jsp").forward(request, response);
        } else {
            String err = (String)request.getAttribute("err");
            if(err != null) request.setAttribute("err", err);
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
            request.setAttribute("cus", cus);
            request.setAttribute("salemoney", ssaleMoney);
            request.setAttribute("realmoney", srealmoney);
            request.setAttribute("totalmoney", stotalmoney);
            request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
