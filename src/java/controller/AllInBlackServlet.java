package controller;

import entity.KieuDang;
import entity.LoaiGiay;
import entity.Shoe;
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
        KieuDangDAO l = new KieuDangDAO();
        LoaiGiayDAO g = new LoaiGiayDAO();
        List<Shoe> lst = u.allInBlack();
        List<KieuDang> kd = l.kieuGiay();
        List<LoaiGiay> lg = g.loaiGiay();
        request.setAttribute("lst", lst);
        request.setAttribute("listkd", kd);
        request.setAttribute("listlg", lg);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
