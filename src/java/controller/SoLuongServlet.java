/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import entity.Shoe;
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
public class SoLuongServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String size = request.getParameter("size");
        String masp = request.getParameter("masp");
  
        ShoeDAO s = new ShoeDAO();
        Shoe shoe  = s.searchProduct(masp);
        int soluong = s.soLuong(masp, size);
        request.setAttribute("size", size);
        request.setAttribute("shoe", shoe);
         List<Shoe> lst = s.relateProduct(masp, String.valueOf(shoe.getLoai_giay()));
        request.setAttribute("soluong", soluong);
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }


}
