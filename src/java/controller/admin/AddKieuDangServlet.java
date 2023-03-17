/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import entity.KieuDang;
import entity.LoaiGiay;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.KieuDangDAO;
import model.LoaiGiayDAO;

/**
 *
 * @author Admin
 */
public class AddKieuDangServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        KieuDangDAO kddao = new KieuDangDAO();
        KieuDang kd = kddao.searchByName(name.trim());
        if (kd != null) {
            response.sendRedirect("adminproduct?err=Loai giay nay da ton tai!");
        } else {
            kddao.insertKieuDang(name);
            response.sendRedirect("adminproduct");
        }
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
