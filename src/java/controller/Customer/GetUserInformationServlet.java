/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CustomerDAO;

/**
 *
 * @author Admin
 */
public class GetUserInformationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
            HttpSession session = request.getSession();
            Customer c;
            CustomerDAO cd = new CustomerDAO();
            String id = (String) session.getAttribute("name");
            c = cd.searchUser(id);
            request.setAttribute("id", c.getUsername());
            request.setAttribute("password", c.getPassword());
            request.setAttribute("birthday", c.getNgay_sinh());
            request.setAttribute("email", c.getEmail());
            request.setAttribute("phonenumber", c.getSdt());
            request.setAttribute("name", c.getHo_ten());
            request.setAttribute("gender", c.getGioi_tinh());
            request.setAttribute("address", c.getDia_chi());
            request.getRequestDispatcher("userprofile.jsp").forward(request, response);
        }

        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
