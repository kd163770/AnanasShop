/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.*;
import model.*;

/**
 *
 * @author Admin
 */
public class AdminOrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int vaitro = (Integer) session.getAttribute("vaitro");
        if (session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
        } else if (vaitro == 2) {
            response.sendRedirect("index.jsp");
        } else {
            OrderDAO odao = new OrderDAO();
            String idex = request.getParameter("index");
            String orderby = request.getParameter("orderby");
            String order = request.getParameter("order");
            if (orderby == null) {
                orderby = "id";
            }
            if (order == null) {
                order = "asc";
            }

            String status = request.getParameter("status");
            String year = request.getParameter("year");
            String month = request.getParameter("month");

            int yearint;
            int monthint;
            int statusint;
//            if (status == null) {
//                status = "";
//            }
            if (year == null || year.equals("")) {
                yearint = 0;
            } else {
                yearint = Integer.parseInt(year);
            }
            if (month == null || month.equals("")) {
                monthint = 0;
            } else {
                monthint = Integer.parseInt(month);
            }
            if (status == null || status.equals("")) {
                statusint = 0;
            } else {
                statusint = Integer.parseInt(status);
            }
            int index;
            if (idex == null || idex.equals("")) {
                index = 1;
            } else {
                index = Integer.parseInt(idex);
            }
            int count = odao.countOrders(statusint, monthint, yearint);
            int size = 10;
            int endPage = count / size;
            if (count % size != 0) {
                endPage++;
            }
            List<Order> lst = odao.listTenOrder(index, orderby, order, monthint, yearint, statusint);
            int quantity = odao.countOrder(monthint, yearint);
            double dongia = odao.sumPrice(yearint, monthint);

            request.setAttribute("endpage", endPage);
            request.setAttribute("orderby", orderby);
            request.setAttribute("order", order);
            request.setAttribute("year", yearint);
            request.setAttribute("status", status);
            request.setAttribute("month", monthint);
            request.setAttribute("index", index);
            request.setAttribute("quantity", quantity);
            request.setAttribute("dongia", dongia);
            request.setAttribute("orderlst", lst);
            request.getRequestDispatcher("adminorders.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
