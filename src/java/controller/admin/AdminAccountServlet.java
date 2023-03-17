/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import entity.Customer;
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
public class AdminAccountServlet extends HttpServlet {

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
            CustomerDAO cd = new CustomerDAO();
            String idex = request.getParameter("index");
            String orderby = request.getParameter("orderby");
            String order = request.getParameter("order");
            if (orderby == null) {
                orderby = "id";
            }
            if (order == null) {
                order = "asc";
            }

            String gender = request.getParameter("gender");
            String status = request.getParameter("status");
            int statusint;
            
            //cấm hay không cấm
            if (status == null || status.equals("")) {
                statusint = 2;
            } else {
                statusint = Integer.parseInt(status);
            }

            if (gender == null) {
                gender = "";
            }
//        
            int index;
            if (idex == null || idex.equals("")) {
                index = 1;
            } else {
                index = Integer.parseInt(idex);
            }
            int count = cd.countCustomers(statusint, gender);
            int size = 10;
            int endPage = count / size;
            if (count % size != 0) {
                endPage++;
            }
            List<Customer> lst = cd.listTenCustomer(index, orderby, order, gender, statusint);
            for (int i = 0; i < lst.size(); i++) {
                lst.get(i).setChitieu(cd.getMoney(lst.get(i).getUsername()));
            }

            request.setAttribute("endpage", endPage);
            request.setAttribute("orderby", orderby);
            request.setAttribute("order", order);
            request.setAttribute("status", status);
            request.setAttribute("gender", gender);
            request.setAttribute("index", index);

            request.setAttribute("customerlist", lst);
            request.getRequestDispatcher("adminaccount.jsp").forward(request, response);
        }
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
