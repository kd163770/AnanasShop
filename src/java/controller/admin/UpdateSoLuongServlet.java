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
import model.SoLuongDAO;

/**
 *
 * @author Admin
 */
public class UpdateSoLuongServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String masp = request.getParameter("maspupdate");
        String size = request.getParameter("sizeupdate");
        String soluong = request.getParameter("updatesoluong");

        int sizes = Integer.parseInt(size);
        int soluongs = Integer.parseInt(soluong);
        SoLuongDAO sl = new SoLuongDAO();
        sl.updateSoLuong(masp, sizes, soluongs);
        response.sendRedirect("productdetails?err1=1&masp="+masp);
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
