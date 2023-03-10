/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import entity.*;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String name = (String) request.getParameter("name");
        String password = (String) request.getParameter("password");
        String remember = (String) request.getParameter("remember");
        Cookie[] arr = request.getCookies();

        CustomerDAO lg = new CustomerDAO();
        Customer account = lg.searchUser(name, password);

        if (account.getUsername() == null) {
            String err = "Vui lòng xem lại tài khoản và mật khẩu";
            request.setAttribute("err", err);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {

            String username = "";
            String passwordcookie = "";
            int status = account.getVai_tro();
            if (remember == null) {
                if (arr != null) {
                    for (Cookie o : arr) {
                        if (o.getName().equals("name")) {
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                        if (o.getName().equals("pass")) {
                            o.setMaxAge(0);
                            response.addCookie(o);
                        }
                    }
                }
            } else {
                username = name;
                passwordcookie = password;
                Cookie name_cookie = new Cookie("name", username);
                Cookie pass_cookie = new Cookie("pass", passwordcookie);
                name_cookie.setMaxAge(2 * 24 * 60 * 60);
                pass_cookie.setMaxAge(2 * 24 * 60 * 60);
                response.addCookie(name_cookie);
                response.addCookie(pass_cookie);
            }
            ShoeDAO sd = new ShoeDAO();
            List<Shoe> lst = sd.listShoe(null);
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
            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }
            session.setAttribute("name", name);
            session.setAttribute("password", password);
            session.setAttribute("status", status);
            session.setAttribute("soluong", n);
            response.sendRedirect("index.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
