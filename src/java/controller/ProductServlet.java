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
public class ProductServlet extends HttpServlet {
   
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
       String masp = request.getParameter("masp");
       ShoeDAO sd = new ShoeDAO();
       Shoe shoe = sd.searchProduct(masp);
       List<Shoe> lst = sd.relateProduct(masp, String.valueOf(shoe.getLoai_giay()));
       request.setAttribute("shoe", shoe);
       request.setAttribute("lst", lst);
       request.getRequestDispatcher("product.jsp").forward(request, response);
//       out.print(shoe.getLoai_giay());
    } 

}
