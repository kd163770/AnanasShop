/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CustomerDAO;

/**
 *
 * @author Admin
 */
public class ChangePasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangePasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String fpassword = request.getParameter("firstpassword");
        String spassword = request.getParameter("secondpassword");
        String regex;
        CustomerDAO lg = new CustomerDAO();
        String xusername = lg.searchUserName(username);
        if (xusername.equals("")) {
            String err = "Tài khoản không tồn tại!";
            request.setAttribute("err", err);
            request.setAttribute("username", username);
            request.setAttribute("fpassword", fpassword);
            request.setAttribute("spassword", spassword);
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        } else {
            regex = "^[a-zA-Z0-9.!]{1,}$";
            if (fpassword.matches(regex) == false) {
                String err = "Mật khẩu không hợp lệ!";
                request.setAttribute("err", err);
                request.setAttribute("username", username);
                request.setAttribute("fpassword", fpassword);
                request.setAttribute("spassword", spassword);
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            }
            else if(fpassword.equals(spassword) == false){
                String err = "Mật khẩu không khớp!";
                request.setAttribute("err", err);
                request.setAttribute("username", username);
                request.setAttribute("fpassword", fpassword);
                request.setAttribute("spassword", spassword);
                request.getRequestDispatcher("changepassword.jsp").forward(request, response);
            }
            else{
                lg.changePassword(username, fpassword);
                response.sendRedirect("login.jsp");
            }
        }
    }
}
