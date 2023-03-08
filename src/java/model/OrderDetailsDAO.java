/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.*;
import entity.OrderDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailsDAO extends DBContext{
    public void insertOrderDetails(int orderId, String masp, int size, int so_luong, double don_gia, double giam_gia){
        String sql = "insert into [Order Details](id, masp, size, so_luong, don_gia, giam_gia) values(?,?,?,?,?,?)";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderId);
            st.setString(2, masp);
            st.setInt(3, size);
            st.setInt(4, so_luong);
            st.setDouble(5, don_gia);
            st.setDouble(6, giam_gia);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<OrderDetails> getOrderDetails(int id){
        String sql = "select * from [Order_Details] where id = ?";
        List<OrderDetails> orders = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetails od = new OrderDetails();
                od.setOrderId(rs.getInt("id"));
                od.setMasp(rs.getString("masp"));
                od.setSize(rs.getInt("size"));
                od.setQuantity(rs.getInt("So_Luong"));
                od.setPrice(rs.getDouble("Don_Gia"));
                od.setSale(rs.getDouble("Giam_Gia"));
                orders.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}
