/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Customer;

import entity.LoaiGiay;
import entity.KieuDang;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import entity.*;
import model.*;

/**
 *
 * @author Admin
 */
public class ListLoaiGiay extends HttpServlet {
   
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
       String loaigiay = request.getParameter("loaigiay");
      
       if(loaigiay.equals("null")) loaigiay="";
       
       ShoeDAO shoe = new ShoeDAO();
       KieuDangDAO l = new KieuDangDAO();
       LoaiGiayDAO g = new LoaiGiayDAO();
       List<KieuDang> kd = l.kieuGiay();
       List<LoaiGiay> lg = g.loaiGiay();
       List<Shoe> d = shoe.phanLoai("", loaigiay, "", "");
       request.setAttribute("kieudang", "");
       request.setAttribute("loaigiay", loaigiay);
       request.setAttribute("gia", "");
       request.setAttribute("gioitinh", "");
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


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
