package controller.admin;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

/**
 *
 * @author Admin
 */
public class AdminProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int vaitro = (Integer) session.getAttribute("vaitro");
        if (session.getAttribute("name") == null) {
            response.sendRedirect("login.jsp");
        } else if (vaitro == 2) {
            response.sendRedirect("index.jsp");
        } else {
            LoaiGiayDAO lgdao = new LoaiGiayDAO();
            KieuDangDAO kddao = new KieuDangDAO();
            ShoeDAO shoedao = new ShoeDAO();
            
            String idex_lg = request.getParameter("loai_giay");
            String idex_kd = request.getParameter("kieu_dang");

            String sortlg = request.getParameter("sortlg");
            String sortkd = request.getParameter("sortkd");

            String error = request.getParameter("err");
            if (sortlg == null) {
                sortlg = "id";
            }
            if (sortkd == null) {
                sortkd = "id";
            }
            
            //tinh index loaigiay va kieu dang
            int index_lg, index_kd;
            if (idex_lg == null) {
                index_lg = 1;
            } else {
                index_lg = Integer.parseInt(idex_lg);
            }

            if (idex_kd == null) {
                index_kd = 1;
            } else {
                index_kd = Integer.parseInt(idex_kd);
            }

            int count_lg = lgdao.countLoaiGiay();
            int size_lg = 4;
            int endPage_lg = count_lg / size_lg;
            if (count_lg % size_lg != 0) {
                endPage_lg++;
            }

            int count_kd = kddao.countKieuDang();
            int size_kd = 4;
            int endPage_kd = count_kd / size_kd;
            if (count_kd % size_kd != 0) {
                endPage_kd++;
            }

            List<LoaiGiay> lst1 = lgdao.searcLloaiGiay(sortlg, index_lg);
            for (LoaiGiay loaiGiay : lst1) {
                loaiGiay.setQuantity(lgdao.countQuantity(loaiGiay.getId()));
            }
            List<KieuDang> lst2 = kddao.searchKieuGiay(sortkd, index_kd);
            for (KieuDang kieuDang : lst2) {
                kieuDang.setQuantity(kddao.countQuantity(kieuDang.getId()));
            }
            request.setAttribute("endpage_lg", endPage_lg);
            request.setAttribute("endpage_kd", endPage_kd);

            request.setAttribute("lst1", lst1);
            request.setAttribute("lst2", lst2);

            request.setAttribute("index_lg", index_lg);
            request.setAttribute("index_kd", index_kd);

            request.setAttribute("sortlg", sortlg);
            request.setAttribute("sortkd", sortkd);

            request.setAttribute("countkd", count_kd);
            request.setAttribute("countlg", count_lg);
            request.setAttribute("countshoe", shoedao.countShoe());
            if (error != null) {
                request.setAttribute("err", error);
            }
            request.getRequestDispatcher("adminproduct.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
