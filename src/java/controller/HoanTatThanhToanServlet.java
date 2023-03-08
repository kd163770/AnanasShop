/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class HoanTatThanhToanServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HoanTatThanhToanServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HoanTatThanhToanServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("name");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String typeofpurchase = request.getParameter("typeopurchase");
        int purchasemethod = Integer.parseInt(typeofpurchase);
        Date orderdate = new Date(System.currentTimeMillis());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDay = dateFormat.format(orderdate);
        if (name == null || name.equals("") || name.equals("") || email.equals("") || email == null
                || phonenumber == null || phonenumber.equals("")) {
            String err = "Vui lòng nhập đầy đủ thông tin!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("giohang").forward(request, response);
        } else {
            ShoeDAO sd = new ShoeDAO();
            List<Shoe> lst = sd.listShoe(null);
            Cookie[] arr = request.getCookies();
            CustomerDAO cd = new CustomerDAO();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, lst);
            List<Item> listItem = cart.getItems();
            double totalPrice = cart.getTotalMoney();
            Order o = new Order(1, userid, name, orderdate, null, null, purchasemethod, address, phonenumber, email, totalPrice);
            OrderDAO od = new OrderDAO();
            OrderDetailsDAO odd = new OrderDetailsDAO();
            od.insertOrder(o);
            for (Item item : listItem) {
                String masp = item.getShoe().getId();
                int size = item.getSize();
                int soluong = sd.soLuong(masp, String.valueOf(size));
                soluong = soluong - item.getQuantity();
                sd.updateQuantity(masp, size, soluong);
                odd.insertOrderDetails(od.getLasId(), masp, size, item.getQuantity(), item.getShoe().getPrice() * item.getQuantity(), (item.getShoe().getPrice() / 100 * item.getShoe().getSale_price()) * item.getQuantity());
                if (arr != null) {
                    for (Cookie c : arr) {
                        if (c.getName().equals("cart")) {
                            c.setMaxAge(0);
                            response.addCookie(c);
                        }
                    }
                }      
            }
            response.sendRedirect("giohang");
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
