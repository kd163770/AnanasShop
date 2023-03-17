/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Order;
import entity.Shoe;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

    public void insertOrder(Order o) {
        String sql = "Insert into Orders(ID_NGUOI_DUNG, Ten_Nguoi_Nhan, Ngay_Dat_Hang, Phuong_Thuc_Thanh_Toan, Dia_Chi, So_Dien_Thoai, Don_Gia, Trang_Thai)"
                + "values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, o.getUserId());
            st.setString(2, o.getCustomer());
            st.setDate(3, o.getOrderDate());
            st.setInt(4, o.getPurchase_method());
            st.setString(5, o.getAddress());
            st.setString(6, o.getPhonenumber());
            st.setDouble(7, o.getPrice());
            st.setInt(8, 1);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getLasId() {
        String sql = "Select Top(1) id from orders order by id desc";
        int id = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public List<Order> getOrders(String userId, int status) {
        List<Order> orders = new ArrayList();
        String sql = "Select * from orders where ID_NGUOI_DUNG = ?";
        if (status != 0) {
            sql = sql + " and Trang_Thai = " + status;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setUserId(rs.getString("ID_NGUOI_DUNG"));
                o.setCustomer(rs.getString("Ten_Nguoi_Nhan"));
                o.setOrderDate(rs.getDate("Ngay_Dat_Hang"));
                o.setShipDate(rs.getDate("Ngay_Giao_Hang"));
                o.setReceiveDate(rs.getDate("Ngay_Nhan_Hang"));
                o.setPurchase_method(rs.getInt("Phuong_Thuc_Thanh_Toan"));
                o.setAddress(rs.getString("Dia_Chi"));
                o.setPhonenumber(rs.getString("So_Dien_Thoai"));
                o.setPrice(rs.getDouble("Don_Gia"));
                o.setStatus(rs.getInt("Trang_Thai"));
                orders.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
    public Order getOrder(int id) {
        Order o = new Order();
        String sql = "Select * from orders where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                o.setId(rs.getInt("ID"));
                o.setUserId(rs.getString("ID_NGUOI_DUNG"));
                o.setCustomer(rs.getString("Ten_Nguoi_Nhan"));
                o.setOrderDate(rs.getDate("Ngay_Dat_Hang"));
                o.setShipDate(rs.getDate("Ngay_Giao_Hang"));
                o.setReceiveDate(rs.getDate("Ngay_Nhan_Hang"));
                o.setPurchase_method(rs.getInt("Phuong_Thuc_Thanh_Toan"));
                o.setAddress(rs.getString("Dia_Chi"));
                o.setPhonenumber(rs.getString("So_Dien_Thoai"));
                o.setPrice(rs.getDouble("Don_Gia"));
                o.setStatus(rs.getInt("Trang_Thai"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList();
        String sql = "Select * from orders";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setUserId(rs.getString("ID_NGUOI_DUNG"));
                o.setCustomer(rs.getString("Ten_Nguoi_Nhan"));
                o.setOrderDate(rs.getDate("Ngay_Dat_Hang"));
                o.setShipDate(rs.getDate("Ngay_Giao_Hang"));
                o.setReceiveDate(rs.getDate("Ngay_Nhan_Hang"));
                o.setPurchase_method(rs.getInt("Phuong_Thuc_Thanh_Toan"));
                o.setAddress(rs.getString("Dia_Chi"));
                o.setPhonenumber(rs.getString("So_Dien_Thoai"));
                o.setPrice(rs.getDouble("Don_Gia"));
                o.setStatus(rs.getInt("Trang_Thai"));
                orders.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public void updateStatus(int orderid) {
        String sql = "update orders set Trang_Thai = 4 where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderid);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Order> listTenOrder(int index, String orderby, String order, int month, int year, int status) {
        List<Order> lst = new ArrayList();
        String sqls = "(select ROW_NUMBER() over (order by " + orderby + " " + order + ") as r, * from orders where 1=1";
        if (year != 0) {
            sqls = sqls + " and YEAR(ngay_dat_hang) = " + year;
        }
        if (month != 0) {
            sqls = sqls + " and MONTH(ngay_dat_hang) = " + month;
        }
       if (status != 0) {
            sqls = sqls + " and trang_thai = " + status;
        }
        String sql = "select * from \n"
                + sqls + ")as x \n"
                + "where r between ?*10-9 and ?*10";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index);
            st.setInt(2, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("ID"));
                o.setUserId(rs.getString("ID_NGUOI_DUNG"));
                o.setCustomer(rs.getString("Ten_Nguoi_Nhan"));
                o.setOrderDate(rs.getDate("Ngay_Dat_Hang"));
                o.setShipDate(rs.getDate("Ngay_Giao_Hang"));
                o.setReceiveDate(rs.getDate("Ngay_Nhan_Hang"));
                o.setPurchase_method(rs.getInt("Phuong_Thuc_Thanh_Toan"));
                o.setAddress(rs.getString("Dia_Chi"));
                o.setPhonenumber(rs.getString("So_Dien_Thoai"));
                o.setPrice(rs.getDouble("Don_Gia"));
                o.setStatus(rs.getInt("Trang_Thai"));
                lst.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public int countOrder(int month, int year) {
        String sql = "Select COUNT(*) from Orders where 1 = 1";
        if(month != 0){
            sql = sql + " and MONTH(ngay_dat_hang) = " + month;
        }
        if(year != 0){
            sql = sql + " and YEAR(ngay_dat_hang) = " + year;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public double sumPrice(int year, int month) {
        String sql = "select sum(don_gia) from orders where trang_thai <> 4";
        if(month != 0){
            sql = sql + " and MONTH(ngay_dat_hang) = " + month;
        }
        if(year != 0){
            sql = sql + " and YEAR(ngay_dat_hang) = " + year;
        }
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
    
    public int countOrders(int status, int month, int year) {
        String sql = "Select COUNT(*) from orders where 1=1";
        if(status != 0){
            sql = sql + " and status = " + status;
        }
        if(month != 0){
            sql = sql + " and MONTH(ngay_dat_hang) = " + month;
        }
        if(year != 0){
            sql = sql + " and YEAR(ngay_dat_hang) = " + year;
        }
        
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
    
    public void updateStatus(int id, int status){
        String sql = "Update orders set trang_thai = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateDate(int id, Date date, int status){
        String xdate = "";
        if(status == 2){
            xdate = "ngay_giao_hang";
        }
        if(status == 3){
            xdate = "ngay_nhan_hang";
        }
        String sql = "Update orders set "+xdate+" = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDate(1, date);
            st.setInt(2, id);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
