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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.KieuDangDAO;
import model.LoaiGiayDAO;
import model.ShoeDAO;
import model.SoLuongDAO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UpdateShoeServlet", urlPatterns = {"/updateshoe"})
public class UpdateShoeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String masp = request.getParameter("masp");
//        out.print(masp);
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String smallest_size = request.getParameter("smallest_size");
        String biggest_size = request.getParameter("biggest_size");
        String color = request.getParameter("color");
        String price = request.getParameter("price");
        String sale = request.getParameter("sale");
        String loaigiay = request.getParameter("loaigiay");
        String kieudang = request.getParameter("kieudang");
        
//        LoaiGiayDAO lgdao = new LoaiGiayDAO();
//        List<LoaiGiay> lg = lgdao.loaiGiay();
//        KieuDangDAO kddao = new KieuDangDAO();
//        List<KieuDang> kd = kddao.kieuGiay();

        if (name == null || name.trim().equals("") || gender == null || gender.trim().equals("") || color == null || color.trim().equals("")
                || smallest_size == null || smallest_size.trim().equals("") || biggest_size == null || biggest_size.trim().equals("") || price == null || price.trim().equals("")
                || sale == null || sale.trim().equals("")) {
               response.sendRedirect("productdetails?masp="+masp+"&err=1");
        } else {
            ShoeDAO sd = new ShoeDAO();
            SoLuongDAO sl = new SoLuongDAO();
            double pricedob = Double.parseDouble(price);
            int smallsize = Integer.parseInt(smallest_size);
            int bigsize = Integer.parseInt(biggest_size);
            double sales = Double.parseDouble(sale);
            int lgint = Integer.parseInt(loaigiay);
            int kdint = Integer.parseInt(kieudang);
            
            sd.updateProduct(name, bigsize, smallsize, pricedob, sales, lgint, kdint, gender, masp, color);
            sl.deleteSoLuong(masp, smallsize, bigsize);
            String oldbigsize = request.getParameter("old_biggest_size");
            String oldsmallsize = request.getParameter("old_smallest_size");
            int obsizeint = Integer.parseInt(oldbigsize);
            int ossizeint = Integer.parseInt(oldsmallsize);
            if(ossizeint > smallsize){
                for (int i = smallsize; i < ossizeint; i++) {
                    sl.insertSoLuong(masp, i, 0);
                }
            }
            if(obsizeint < bigsize){
                for (int i = obsizeint+1; i <= bigsize; i++) {
                     sl.insertSoLuong(masp, i, 0);
                }
            }
            response.sendRedirect("productdetails?masp="+masp+"&err=2");

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
