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
public class OrderDAO extends DBContext{
    public void insertOrder(Order o){
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
    
    public int getLasId(){
        String sql = "Select Top(1) id from orders order by id desc";
        int id = 0;
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                id = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    
    public List<Order> getOrders(String userId){
        List<Order> orders = new ArrayList();
        String sql = "Select * from orders where ID_NGUOI_DUNG = ?";
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
}
