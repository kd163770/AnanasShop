/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class UserCartServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ShoeDAO sd = new ShoeDAO();
        OrderDAO o = new OrderDAO();
        OrderDetailsDAO od = new OrderDetailsDAO();
        String name = (String) session.getAttribute("name");
        String status = request.getParameter("status");
        int status_int = 0;
        if (status != null) {
            status_int = Integer.parseInt(status.trim());
        }
        List<Order> order = o.getOrders(name, status_int);
        List<OrderDetails> orderdetails = new ArrayList();
        for (int i = 0; i < order.size(); i++) {
            List<OrderDetails> od2 = od.getOrderDetails(order.get(i).getId());
            for (OrderDetails orderDetails : od2) {
                orderDetails.setShoe(sd.searchProduct(orderDetails.getMasp()));
                orderdetails.add(orderDetails);
            }
        }
//        out.print(orderdetails.size());
        request.setAttribute("status", status_int);
        request.setAttribute("order", order);
        request.setAttribute("orderdetails", orderdetails);
        request.getRequestDispatcher("userorder.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
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
