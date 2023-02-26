package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;
import java.util.*;

public class AllInBlackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ShoeDAO u = new ShoeDAO();
        List<Shoe> lst = u.allInBlack();
        request.setAttribute("lst", lst);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
