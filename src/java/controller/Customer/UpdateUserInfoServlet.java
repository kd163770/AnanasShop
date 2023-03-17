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
public class UpdateUserInfoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String sdt = request.getParameter("phonenumber");
        String gender = request.getParameter("gender");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
         CustomerDAO cd = new CustomerDAO();
        cd.updateInformation(username, name, email, sdt, gender, birthday, address);
        HttpSession session = request.getSession();
        Customer c;
       
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
//            out.print(c.getGioi_tinh());
        request.getRequestDispatcher("userprofile.jsp").forward(request, response);
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
