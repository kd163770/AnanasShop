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
import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ShoeDAO extends DBContext {

    
    //list danh sach giay voi gioi tinh
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
    
    public int countShoe() {
        String sql = "Select COUNT(*) from san_pham";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

     
    public List<Shoe> listSaleShoe(String gt) {
        List<Shoe> s = new ArrayList();
        String sql = "Select * from san_pham where gia_sale <> 0";
        if (gt.equals("")== false) {
            sql = sql + " and (gioi_tinh = '"+gt+"' or gioi_tinh='UNISEX')";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, gt);
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
                d.setKieu_dang(rs.getInt("kieu_dang"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                d.setNgay_ra_mat(rs.getDate("ngay_ra_mat"));
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

    
    public int countShoes(int loaigiay, int kieudang, String gender) {
        String sql = "Select COUNT(*) from san_pham where 1=1";
        if(loaigiay != 0){
            sql = sql + " and loai_giay = " + loaigiay;
        }
        if(kieudang != 0){
            sql = sql + " and kieu_dang = " + kieudang;
        }
        if(gender.equals("") == false && gender.equals("null") == false){
            sql = sql + " and gioi_tinh = '" + gender + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getInt(1));
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return 0;
    }
    //, 
    public List<Shoe> listAdminShoe(int index, String orderby, String order, int loaigiay, int kieudang, String gender) {
        List<Shoe> lst = new ArrayList();
        String sqls = "(select ROW_NUMBER() over (order by "+ orderby +" "+ order+") as r, * from san_pham where 1=1";
        if(loaigiay != 0){
            sqls = sqls + " and loai_giay = " + loaigiay;
        }
        if(kieudang != 0){
            sqls = sqls + " and kieu_dang = " + kieudang;
        }
        if(gender.equals("") == false && gender.equals("null") == false){
            sqls = sqls + " and gioi_tinh = '" + gender + "'";
        }
        String sql = "select * from \n"
                + sqls +")as x \n"
                + "where r between ?*10-9 and ?*10";  
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index);
            st.setInt(2, index);
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
                d.setKieu_dang(rs.getInt("kieu_dang"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                d.setMau_sac(rs.getString("mau_sac"));
                d.setNgay_ra_mat(rs.getDate("ngay_ra_mat"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (int i = 0; i < lst.size(); i++) {
            System.out.println(lst.get(i).getId());
        }
        System.out.println(sql);
        return lst;
    }
    
    public void insertProduct(String masp, String name, int price, int sale, String gender, String color, Date ngay_ra_mat, int loaigiay, int kieudang, int smallest_size, int biggest_size){
        String sql = "insert into san_pham(MASP, name, smallest_size, biggest_size, gia_tien, gia_sale, kieu_dang, loai_giay, gioi_tinh, mau_sac, ngay_ra_mat)\n" +
"values	(?,?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            st.setString(2, name);
            st.setInt(3, smallest_size);
            st.setInt(4, biggest_size);
            st.setInt(5, price);
            st.setInt(6, sale);
            st.setInt(7, kieudang);
            st.setInt(8, loaigiay);
            st.setString(9, gender);
            st.setString(10, color);
            st.setDate(11, ngay_ra_mat);
            
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateProduct(String name, int bigsize, int smallsize, double gia_tien, double giasale, int loaigiay, int kieudang, String gioitinh, String masp, String color){
        String sql = "update san_pham set name = ?, smallest_size = ?, biggest_size = ?, gia_tien = ?, gia_sale = ?, kieu_dang = ?, loai_giay = ?, gioi_tinh = ?, mau_sac = ?\n" +
        "where masp = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, smallsize);
            st.setInt(3, bigsize);
            st.setDouble(4, gia_tien);
            st.setDouble(5, giasale);
            st.setInt(6, kieudang);
            st.setInt(7, loaigiay);
            st.setString(8, gioitinh);
            st.setString(9, color);
            st.setString(10, masp);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        ShoeDAO shoedao = new ShoeDAO();
        shoedao.listAdminShoe(1, "masp", "asc", 1, 0, "");
    }
}
