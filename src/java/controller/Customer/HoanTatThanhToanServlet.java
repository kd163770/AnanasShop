/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("name");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phonenumber = request.getParameter("phonenumber");
        String typeofpurchase = request.getParameter("typeopurchase");
        int purchasemethod = Integer.parseInt(typeofpurchase);
        Date orderdate = new Date(System.currentTimeMillis());
        if (name == null || name.equals("") || email == null || email.equals("")
                || phonenumber == null || phonenumber.equals("")) {
            String err = "Vui lòng nhập đầy đủ thông tin!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("giohang").forward(request, response);
        } else {
            ShoeDAO sd = new ShoeDAO();
            List<Shoe> lst = sd.listShoe(null);
            Cookie[] arr = request.getCookies();

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
            }
            if (arr != null) {
                for (Cookie c : arr) {
                    if (c.getName().equals("cart")) {
                        c.setMaxAge(0);
                        response.addCookie(c);
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
