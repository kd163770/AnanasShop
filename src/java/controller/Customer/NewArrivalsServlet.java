/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Customer;

import entity.KieuDang;
import entity.LoaiGiay;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.KieuDangDAO;
import model.LoaiGiayDAO;
import model.ShoeDAO;

/**
 *
 * @author Admin
 */
public class NewArrivalsServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ShoeDAO u = new ShoeDAO();
        KieuDangDAO l = new KieuDangDAO();
        LoaiGiayDAO g = new LoaiGiayDAO();
        String gt = request.getParameter("gioitinh");
        List<Shoe> lst = u.newArrivals(gt);
        List<KieuDang> kd = l.kieuGiay();
        List<LoaiGiay> lg = g.loaiGiay();
        request.setAttribute("lst", lst);
        request.setAttribute("listkd", kd);
        request.setAttribute("listlg", lg);
        request.setAttribute("gioitinh", gt);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    } 


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
