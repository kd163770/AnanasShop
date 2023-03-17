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
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class AdminShoeServlet extends HttpServlet {

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
            LoaiGiayDAO lgdao = new LoaiGiayDAO();
            List<LoaiGiay> lg = lgdao.loaiGiay();

            KieuDangDAO kddao = new KieuDangDAO();
            List<KieuDang> kd = kddao.kieuGiay();
            ShoeDAO shoedao = new ShoeDAO();
            String idex = request.getParameter("index");
            String orderby = request.getParameter("orderby");
            String order = request.getParameter("order");
            if (orderby == null) {
                orderby = "masp";
            }
            if (order == null) {
                order = "asc";
            }
            String loaigiay = request.getParameter("loaigiay");
            String kieudang = request.getParameter("kieudang");
            String gender = request.getParameter("gender");
            int lgint;
            if (loaigiay == null || loaigiay.equals("")) {
                lgint = 0;
            } else {
                lgint = Integer.parseInt(loaigiay);
            }
            int kdint;
            if (kieudang == null || kieudang.equals("")) {
                kdint = 0;
            } else {
                kdint = Integer.parseInt(kieudang);
            }
            if (gender == null) {
                gender = "";
            }
            int index;
            if (idex == null) {
                index = 1;
            } else {
                index = Integer.parseInt(idex);
            }
            int count = shoedao.countShoes(lgint, kdint, gender);
            int size = 10;
            int endPage = count / size;
            if (count % size != 0) {
                endPage++;
            }
            //int index, String orderby, String order, int loaigiay, int kieudang, String gender
            List<Shoe> lst = shoedao.listAdminShoe(index, orderby, order, lgint, kdint, gender);
            request.setAttribute("endpage", endPage);
            request.setAttribute("index", index);
            request.setAttribute("lglist", lg);
            request.setAttribute("kdlist", kd);
            request.setAttribute("lst", lst);
            request.setAttribute("orderby", orderby);
            request.setAttribute("order", order);
            request.setAttribute("loaigiay", loaigiay);
            request.setAttribute("kieudang", kieudang);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("adminshoe.jsp").forward(request, response);
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
