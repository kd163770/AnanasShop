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
public class EditKieuDangServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        String newname = request.getParameter("newname");
        KieuDangDAO kddao = new KieuDangDAO();
        KieuDang kd = kddao.searchByName(newname.trim());
        if (kd != null) {
            response.sendRedirect("adminproduct?err=Ten nay da ton tai!");
        } else {
            kddao.updateKieuDang(id, newname);
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
