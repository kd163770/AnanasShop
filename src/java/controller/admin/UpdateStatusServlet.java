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
import java.sql.Date;
import java.text.SimpleDateFormat;
import model.OrderDAO;

/**
 *
 * @author Admin
 */
public class UpdateStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String idex = request.getParameter("index");
        String orderby = request.getParameter("orderby");
        String order = request.getParameter("order");
        String status = request.getParameter("status");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String update = request.getParameter("update");
        String id = request.getParameter("id");
        int updateint = Integer.parseInt(update);
        int idint = Integer.parseInt(id);

        Date date = new Date(System.currentTimeMillis());
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String currentDay = dateFormat.format(date);
        
        OrderDAO odao = new OrderDAO();
        odao.updateDate(idint, date, updateint);
        odao.updateStatus(idint, updateint);
        response.sendRedirect("adminorder?index=" + idex + "&orderby=" + orderby + "&order=" + order + "&status=" + status + "&year=" + year + "&month=" + month);
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
