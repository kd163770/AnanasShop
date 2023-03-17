/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CustomerDAO;

/**
 *
 * @author Admin
 */
public class UpdateAccountStatusServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        CustomerDAO cd = new CustomerDAO();
        String idex = request.getParameter("index");
        String orderby = request.getParameter("orderby");
        String order = request.getParameter("order");
        String gender = request.getParameter("gender");
        String status = request.getParameter("status");
        String userid = request.getParameter("id");
        String updatestatus = request.getParameter("updatestatus");
        int usint = Integer.parseInt(updatestatus);
        cd.updateStatus(userid, usint);
        response.sendRedirect("adminaccount?index="+idex+"&orderby="+orderby+"&order="+order+"&status="+status+"&gender=" + gender);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
