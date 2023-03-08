/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Shoe;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.*;

/**
 *
 * @author Admin
 */
public class ShoeDAO extends DBContext {

    public List<Shoe> listShoe(String gt) {
        List<Shoe> s = new ArrayList();
        String sql;
        if (gt != null && !gt.isEmpty()) {
            sql = "Select * from san_pham where gioi_tinh = ? or gioi_tinh='UNISEX'";
        } else {
            sql = "Select * from san_pham";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (gt != null && !gt.isEmpty()) {
                st.setString(1, gt);

            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                s.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public List<Shoe> listSaleShoe(String gt) {
        List<Shoe> s = new ArrayList();
        String sql = "";
        if (gt != null && !gt.isEmpty()) {
            sql = "Select * from san_pham where (gioi_tinh = ? or gioi_tinh='UNISEX') and gia_sale <> 0";
        } else {
            sql = "Select * from san_pham where gia_sale <> 0";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, gt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                s.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public List<Shoe> allInBlack() {
        List<Shoe> lst = new ArrayList();
        String sql = "Select * from san_pham where mau_sac like '%Black%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public List<Shoe> searchShoe(String xName) {
        List<Shoe> shoe = new ArrayList();
        String sql = "Select * from san_pham where name like '%" + xName.trim() + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                shoe.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shoe;
    }

    public Shoe searchProduct(String masp) {
        Shoe d = new Shoe();
        String sql = "Select * from san_pham where MASP = '" + masp + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return d;
    }

    public List<Shoe> phanLoai(String xKieuDang, String xLoaiGiay, String xGia, String xGioiTinh) {
        List<Shoe> shoe = new ArrayList();
        String sql = "Select * from san_pham where 1=1";

        if (xKieuDang.equals("") == false) {
            sql = sql + " AND kieu_dang = " + xKieuDang;
        }
        if (xLoaiGiay.equals("") == false) {
            sql = sql + " AND loai_giay = " + xLoaiGiay;
        }

        if (xGia.equals("") == false) {
            if (xGia.equals("1")) {
                sql = sql + " AND gia_tien >= 600000";
            }
            if (xGia.equals("2")) {
                sql = sql + " AND gia_tien >= 500000 And gia_tien <=599000";
            }
            if (xGia.equals("3")) {
                sql = sql + " AND gia_tien >= 400000 And gia_tien <=499000";
            }
        }

        if (xGioiTinh.equals("") == false) {
            if (xGioiTinh.equals("nam")) {
                sql = sql + " AND gioi_tinh not in ('NU')";
            }
            if (xGioiTinh.equals("nu")) {
                sql = sql + " AND gioi_tinh not in ('NAM')";
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
//             st.setString(1, xKieuDang);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                shoe.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return shoe;
    }

    public List<Shoe> relateProduct(String masp, String xLoaiGiay) {
        List<Shoe> shoe = new ArrayList();
        String sql = "Select TOP(4) * from san_pham where MASP <> ?  and loai_giay = ? order by ngay_ra_mat desc";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            st.setString(2, xLoaiGiay);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                shoe.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return shoe;
    }

    public List<Shoe> newArrivals(String gt) {
        List<Shoe> shoe = new ArrayList();
        String sql = "Select TOP(9) * from san_pham where gioi_tinh = ? or gioi_tinh = 'UNISEX' order by ngay_ra_mat desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, gt);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setSmallest_size(rs.getInt("smallest_size"));
                d.setLargest_size(rs.getInt("biggest_size"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setLoai_giay(rs.getInt("loai_giay"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                shoe.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return shoe;
    }

    public int soLuong(String masp, String size_giay) {
        int soluong = 0;
        String sql = "Select * from so_luong where MASP = '" + masp + "' and size_giay = '" + size_giay + "'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//             st.setString(1, masp);
//             st.setString(2, size_giay);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                soluong = rs.getInt("so_luong");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return soluong;
    }
    
    public void updateQuantity(String masp, int size, int quantity){
        String sql = "Update so_luong set so_luong = ? where masp = ? and size_giay = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setString(2, masp);
            st.setInt(3, size);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        ShoeDAO sh = new ShoeDAO();
        List<Shoe> s = sh.listShoe(null);

    }
}
