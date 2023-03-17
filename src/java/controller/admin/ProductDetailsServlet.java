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
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class ProductDetailsServlet extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        LoaiGiayDAO lgdao = new LoaiGiayDAO();
        List<LoaiGiay> lg = lgdao.loaiGiay();
        KieuDangDAO kddao = new KieuDangDAO();
        List<KieuDang> kd = kddao.kieuGiay();
        SoLuongDAO sl = new SoLuongDAO();  
        String masp = request.getParameter("masp");
        String err = request.getParameter("err");
        String err1 = request.getParameter("err1");
        if(err!=null && err.equals("1")) err = "Vui lòng nhập đầy đủ thông tin";
        if(err!=null && err.equals("2")) err = "Cập nhật thành công";
        if(err1!=null && err1.equals("1")) err1 = "Cập nhật thành công";
        List<SoLuong> sllist = sl.listSoLuong(masp);
        ShoeDAO shoedao = new ShoeDAO();
        Shoe shoe = shoedao.searchProduct(masp);
        int count = sl.countSoLuong(masp);
        
         request.setAttribute("lglist", lg);
        request.setAttribute("kdlist", kd);
        request.setAttribute("masp", shoe.getId());
        request.setAttribute("name", shoe.getName());
        request.setAttribute("smallest_size", shoe.getSmallest_size());
        request.setAttribute("biggest_size", shoe.getLargest_size());
        request.setAttribute("price", shoe.getPrice());
        request.setAttribute("sale", shoe.getSale_price());
        request.setAttribute("loaigiay", shoe.getLoai_giay());
        request.setAttribute("kieudang", shoe.getKieu_dang());
        request.setAttribute("gender", shoe.getGioi_tinh());
        request.setAttribute("color", shoe.getMau_sac());
        request.setAttribute("ngay_ra_mat", shoe.getNgay_ra_mat());
        request.setAttribute("sllst", sllist);
        request.setAttribute("sum", count);
        request.setAttribute("err", err);
        request.setAttribute("err1", err1);
//        out.print(sllist.size());
        request.getRequestDispatcher("productdetails.jsp").forward(request, response);
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
