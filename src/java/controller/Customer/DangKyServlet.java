/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Customer;

import entity.Customer;
import entity.ValidateInput;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.CustomerDAO;

/**
 *
 * @author Admin
 */
public class DangKyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String fpassword = request.getParameter("firstpassword");
        String spassword = request.getParameter("secondpassword");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");

        if (username == null || username.equals("") || name.equals("") || name == null || fpassword.equals("") || fpassword == null || spassword.equals("") || spassword == null || email.equals("") || email == null
                || phonenumber == null || phonenumber.equals("") || address == null || address.equals("") || birthday == null || birthday.equals("")) {
            String err = "Nhập đầy đủ thông tin";
            request.setAttribute("err", err);
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("fpassword", fpassword);
            request.setAttribute("spassword", spassword);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("address", address);
            request.setAttribute("birthday", birthday);
            request.setAttribute("gender", gender);
            request.getRequestDispatcher("dangky.jsp").forward(request, response);
        }
        CustomerDAO lg = new CustomerDAO();
        ValidateInput input = new ValidateInput();
        String xusername = lg.searchUserName(username);
        if (xusername.equals("") == false || input.inputUserName(username) == false ||  input.inputPassword(fpassword) == false
                || fpassword.trim().equals(spassword.trim()) == false || fpassword.trim().equals(spassword.trim()) == false || input.inputEmail(email) == false
                || input.inputPhoneNumber(phonenumber) == false) {
            String erruser = "";
            String erremail="";
            String errsdt = "";
            String errpw1 ="";
            String errpw2 ="";
            String errname = "";
            if (xusername.equals("") == false) {
                erruser = "Tên này đã tồn tại!";
            }
            if(input.inputUserName(username) == false){
                erruser = "Tên không hợp lệ!";
            }
            
            if (input.inputPassword(fpassword) == false) {
                errpw1 = "Password chỉ nhận chữ cái, chữ số, '.' và '!'";
            }
            if (fpassword.trim().equals(spassword.trim()) == false) {

                errpw2 = "Mật khẩu không khớp nhau!";
            }
            if (input.inputEmail(email) == false) {
                erremail = "email không hợp lệ!";
            }
            
             if (input.inputPhoneNumber(phonenumber) == false) {
                errsdt = "Số điện thoại không hợp lệ!";
            }
            request.setAttribute("erruser", erruser);
            request.setAttribute("erremail", erremail);
            request.setAttribute("errsdt", errsdt);
            request.setAttribute("errpw1", errpw1);
            request.setAttribute("errpw2", errpw2);
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("fpassword", fpassword);
            request.setAttribute("spassword", spassword);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("birthday", birthday);
            request.setAttribute("address", address);
            request.getRequestDispatcher("dangky.jsp").forward(request, response);

        }
        else {
             Date xBirthDay = Date.valueOf(birthday);
             Customer x = new Customer(username, fpassword, xBirthDay, phonenumber, name, gender, email,address, 2);
            lg.insertCustomer(x);
            response.sendRedirect("login.jsp");
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
