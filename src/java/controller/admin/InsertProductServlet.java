/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import entity.KieuDang;
import entity.LoaiGiay;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import model.KieuDangDAO;
import model.LoaiGiayDAO;
import model.ShoeDAO;
import model.SoLuongDAO;

/**
 *
 * @author Admin
 */
public class InsertProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoaiGiayDAO lgdao = new LoaiGiayDAO();
        List<LoaiGiay> lg = lgdao.loaiGiay();
        KieuDangDAO kddao = new KieuDangDAO();
        List<KieuDang> kd = kddao.kieuGiay();
        request.setAttribute("lglist", lg);
        request.setAttribute("kdlist", kd);
        request.getRequestDispatcher("insertproduct.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String masp = request.getParameter("masp");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String smallest_size = request.getParameter("smallest_size");
        String biggest_size = request.getParameter("biggest_size");
        String color = request.getParameter("color");
        String price = request.getParameter("price");
        String sale = request.getParameter("sale");
        String loaigiay = request.getParameter("loaigiay");
        String kieudang = request.getParameter("kieudang");
        Date ngay_ra_mat = new Date(System.currentTimeMillis());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = dateFormat.format(ngay_ra_mat);
        LoaiGiayDAO lgdao = new LoaiGiayDAO();
        List<LoaiGiay> lg = lgdao.loaiGiay();
        KieuDangDAO kddao = new KieuDangDAO();
        List<KieuDang> kd = kddao.kieuGiay();

        if (masp == null || masp.equals("") || name == null || name.equals("") || gender == null || gender.equals("") || color == null || color.equals("")
                || smallest_size == null || smallest_size.equals("") || biggest_size == null || biggest_size.equals("") || price == null || price.equals("")
                || sale == null || sale.equals("")) {
            request.setAttribute("err", "Vui lòng nhập đầy đủ thông tin");
            request.setAttribute("masp", masp);
            request.setAttribute("name", name);
            request.setAttribute("smallest_size", smallest_size);
            request.setAttribute("biggest_size", biggest_size);
            request.setAttribute("price", price);
            request.setAttribute("sale", sale);
            request.setAttribute("loaigiay", loaigiay);
            request.setAttribute("kieudang", kieudang.trim());
            request.setAttribute("gender", gender);
            request.setAttribute("color", color);
            request.setAttribute("lglist", lg);
            request.setAttribute("kdlist", kd);
            request.getRequestDispatcher("insertproduct.jsp").forward(request, response);
        } else {
            ShoeDAO sd = new ShoeDAO();
            SoLuongDAO sl = new SoLuongDAO();
            Shoe shoe = sd.searchProduct(masp.trim());
            if (shoe.getId() != null) {
                request.setAttribute("err", "sản phẩm này đã tồn tại");
                request.setAttribute("masp", masp.trim());
                request.setAttribute("name", name.trim());
                request.setAttribute("smallest_size", smallest_size.trim());
                request.setAttribute("biggest_size", biggest_size.trim());
                request.setAttribute("price", price.trim());
                request.setAttribute("sale", sale.trim());
                request.setAttribute("loaigiay", loaigiay.trim());
                request.setAttribute("kieudang", kieudang.trim());
                request.setAttribute("gender", gender.trim());
                request.setAttribute("color", color.trim());
                request.setAttribute("lglist", lg);
                request.setAttribute("kdlist", kd);
                request.getRequestDispatcher("insertproduct.jsp").forward(request, response);
            } else {
                int priceint = Integer.parseInt(price);
                if(priceint == 3) priceint = priceint *4;
                int smallsize = Integer.parseInt(smallest_size);
                int bigsize = Integer.parseInt(biggest_size);
                int sales = Integer.parseInt(sale);
                int lgint = Integer.parseInt(loaigiay);
                int kdint = Integer.parseInt(kieudang);
                sd.insertProduct(masp, name, priceint, sales, gender, color, ngay_ra_mat, lgint, kdint, smallsize, bigsize);
                for (int i = smallsize; i <= bigsize; i++) {
                    sl.insertSoLuong(masp, i, 0);
                }
                request.setAttribute("lglist", lg);
                request.setAttribute("kdlist", kd);
                request.setAttribute("err", "Thêm Thành CÔNG");
                request.getRequestDispatcher("insertproduct.jsp").forward(request, response);

            }

        }
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
