/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import java.util.*;

/**
 *
 * @author Admin
 */
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String xName = request.getParameter("search");
        ShoeDAO sd = new ShoeDAO();
        if (xName.equals("")) {
            request.getRequestDispatcher("index.jsp").include(request, response);
        } else {
            List<Shoe> lst = sd.searchShoe(xName.trim());
            request.setAttribute("lst", lst);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        }
    }
}
