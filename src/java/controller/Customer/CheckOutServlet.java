/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.Cart;
import entity.Customer;
import entity.Item;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.CustomerDAO;
import model.ShoeDAO;

/**
 *
 * @author Admin
 */
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if (session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
        } else {
            ShoeDAO sd = new ShoeDAO();
            List<Shoe> lst = sd.listShoe(null);
            Cookie[] arr = request.getCookies();
            CustomerDAO cd = new CustomerDAO();
            Customer cus = cd.searchUser((String) session.getAttribute("name"));
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            
            //chua co san pham nao trong gio hang
            if (txt.equals("")) {
                String err = "Bạn chưa có sản phẩm nào trong giỏ hàng";
                request.setAttribute("salemoney", "0");
                request.setAttribute("realmoney", "0");
                request.setAttribute("totalmoney", "0");
                request.setAttribute("cus", cus);
                request.setAttribute("err", err);
                request.getRequestDispatcher("giohang.jsp").forward(request, response);
            } else {
                Cart cart = new Cart(txt, lst);
                List<Item> listItem = cart.getItems();
                double realMoney = cart.getRealMoney();
                double saleMoney = cart.getSaleMoney();
                double totalMoney = cart.getTotalMoney();
                request.setAttribute("lst", listItem);
                request.setAttribute("cus", cus);
                request.setAttribute("salemoney", saleMoney);
                request.setAttribute("realmoney", realMoney);
                request.setAttribute("totalmoney", totalMoney);
                request.getRequestDispatcher("thanhtoan.jsp").forward(request, response);
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
