/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.Cart;
import entity.Item;
import entity.Shoe;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.ShoeDAO;

/**
 *
 * @author Admin
 */
public class ChangeSizeInCartServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String masp = request.getParameter("masp");
        String quantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        String oldsize = request.getParameter("oldsize");
        
        ShoeDAO sd = new ShoeDAO();
        List<Shoe> lst = sd.listShoe(null);
        try {
            int isize = Integer.parseInt(size);
            int ioldsize = Integer.parseInt(oldsize);
            int iquantity = Integer.parseInt(quantity);
            int totalquantity = sd.soLuong(masp, size);
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }
            
            Cart cart = new Cart(txt, lst);
            List<Item> listItem = cart.getItems();
            cart.removeItem(masp, ioldsize);
            Shoe shoe = sd.searchProduct(masp);
            cart.addItem(new Item(shoe, shoe.getPrice(), iquantity, isize));
            if (cart.getItem(masp, isize).getQuantity() > totalquantity) {
                cart.getItem(masp, isize).setQuantity(totalquantity);
            }
            txt = "";
            for (Item i : listItem) {
                if (txt.isEmpty() || txt.equals("")) {
                    txt = i.getShoe().getId() + ":" + i.getSize() + ":" + i.getQuantity();
                } else {
                    txt = txt + "/" + i.getShoe().getId() + ":" + i.getSize() + ":" + i.getQuantity();
                }
            }
            Cookie cookie = new Cookie("cart", txt);
            cookie.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(cookie);
            response.sendRedirect("giohang");
            
        } catch (NumberFormatException e) {
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
