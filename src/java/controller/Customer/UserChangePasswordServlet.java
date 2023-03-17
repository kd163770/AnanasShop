/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.ValidateInput;
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
public class UserChangePasswordServlet extends HttpServlet {


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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        String snewpassword = request.getParameter("snewpassword");
        CustomerDAO cd = new CustomerDAO();
        ValidateInput vi = new ValidateInput();
        String password = (String) session.getAttribute("password");
        if (password.equals(oldpassword) == false || vi.inputPassword(newpassword) == false || newpassword.trim().equals(snewpassword.trim()) == false || newpassword.trim().equals(oldpassword.trim())==true) {
            String err ="", err1="", err2="";
            if (password.equals(oldpassword) == false) {
                err = "Mật khẩu không đúng!";
            }
            if(newpassword.trim().equals(oldpassword.trim())==true){
                err1 ="Vui lòng nhập mật khẩu mới";
            }
            if (vi.inputPassword(newpassword) == false) {
                err1 = "Mật khẩu không hợp lệ!";
            }
            
            if (newpassword.trim().equals(snewpassword.trim()) == false) {
                err2 = "Mật khẩu không khớp!";
            }
            request.setAttribute("err", err);
            request.setAttribute("err1", err1);
            request.setAttribute("err2", err2);
            request.setAttribute("oldpw", oldpassword);
            request.setAttribute("newpw", newpassword);
            request.setAttribute("snewpw", snewpassword);
            request.getRequestDispatcher("userchangepassword.jsp").forward(request, response);
        }
        else{
            String username = (String)session.getAttribute("name");
            cd.changePassword(username, newpassword);
            session.removeAttribute("password");
            session.setAttribute("password", newpassword);
            String err = "Đổi mật khẩu thành công";
            request.setAttribute("err", err);
            request.getRequestDispatcher("userchangepassword.jsp").forward(request, response);
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
