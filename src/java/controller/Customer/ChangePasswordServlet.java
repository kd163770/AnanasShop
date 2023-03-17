/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

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
