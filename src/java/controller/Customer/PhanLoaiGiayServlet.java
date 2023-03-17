/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Customer;

import entity.LoaiGiay;
import entity.KieuDang;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import entity.*;
import model.*;


/**
 *
 * @author Admin
 */
public class PhanLoaiGiayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       String kieudang = request.getParameter("kieudang");
       String loaigiay = request.getParameter("loaigiay");
       String gia = request.getParameter("gia");
       String gioitinh = request.getParameter("gioitinh");
       
       if(kieudang.equals("null")) kieudang="";
       if(loaigiay.equals("null")) loaigiay="";
       if(gia.equals("null")) gia="";
       if(gioitinh.equals("null")) gioitinh="";
       
       ShoeDAO shoe = new ShoeDAO();
       KieuDangDAO l = new KieuDangDAO();
       LoaiGiayDAO g = new LoaiGiayDAO();
       List<KieuDang> kd = l.kieuGiay();
       List<LoaiGiay> lg = g.loaiGiay();
       List<Shoe> d = shoe.phanLoai(kieudang, loaigiay, gia, gioitinh);
       request.setAttribute("kieudang", kieudang);
       request.setAttribute("loaigiay", loaigiay);
       request.setAttribute("gia", gia);
       request.setAttribute("gioitinh", gioitinh);
       request.setAttribute("lst", d);
       request.setAttribute("listkd", kd);
       request.setAttribute("listlg", lg);
       request.getRequestDispatcher("menu.jsp").forward(request, response);

    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
    }

}
