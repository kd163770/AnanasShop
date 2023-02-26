package controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.*;
import java.util.*;

public class ListShoeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ShoeDAO u = new ShoeDAO();
        KieuDangDAO l = new KieuDangDAO();
        LoaiGiayDAO g = new LoaiGiayDAO();
        String gt = request.getParameter("type");
        List<Shoe> lst = u.listShoe(gt);
        List<KieuDang> kd = l.kieuGiay();
        List<LoaiGiay> lg = g.loaiGiay();
        request.setAttribute("lst", lst);
        request.setAttribute("listkd", kd);
        request.setAttribute("listlg", lg);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
