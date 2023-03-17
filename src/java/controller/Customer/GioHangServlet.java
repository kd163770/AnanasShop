/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.Item;
import entity.Cart;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import jakarta.servlet.http.HttpSession;
import model.*;

/**
 *
 * @author Admin
 */
public class GioHangServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
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
        double realMoney = cart.getRealMoney();
        double saleMoney = cart.getSaleMoney();
        double totalMoney = cart.getTotalMoney();
        
        request.setAttribute("lst", listItem);
//        request.setAttribute("size", n);
        request.setAttribute("salemoney", saleMoney);
        request.setAttribute("realmoney", realMoney);
        request.setAttribute("totalmoney", totalMoney);
        request.getRequestDispatcher("giohang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
