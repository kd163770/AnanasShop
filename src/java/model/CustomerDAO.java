/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.*;

/**
 *
 * @author Admin
 */
public class CustomerDAO extends DBContext {

    public Customer searchUser(String username, String password) {
        Customer account = new Customer();
        String sql = "Select * from customer where id = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                account.setUsername(rs.getString("id"));
                account.setPassword(rs.getString("password"));
                account.setVai_tro(rs.getInt("vai_tro"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }
    public Customer searchUser(String username){
        Customer c = new Customer();
        String sql = "Select * from customer where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c.setUsername(rs.getString("id"));
                c.setPassword(rs.getString("password"));
                c.setHo_ten(rs.getString("Ho_Ten"));
                c.setNgay_sinh(rs.getDate("Ngay_Sinh"));
                c.setGioi_tinh(rs.getString("Gioi_tinh"));
                c.setEmail(rs.getString("email"));
                c.setSdt(rs.getString("so_dien_thoai"));
                c.setDia_chi(rs.getString("Dia_chi"));
                c.setVai_tro(rs.getInt("vai_tro"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }
    public String searchUserName(String username) {
        String xusername = "";
        String sql = "Select * from customer where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                xusername = rs.getString("password");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return xusername;
    }

    public void changePassword(String username, String password) {
        String sql = "Update customer set password = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void insertCustomer(Customer x){
        String sql = "Insert into Customer(ID,password,ngay_sinh,so_dien_thoai,ho_ten,gioi_tinh,email, dia_chi,vai_tro) values (?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getUsername());
            st.setString(2, x.getPassword());
            st.setDate(3, x.getNgay_sinh());
            st.setString(4, x.getSdt());
            st.setString(5, x.getHo_ten());
            st.setString(6, x.getGioi_tinh());
            st.setString(7, x.getEmail());
            st.setString(8, x.getDia_chi());
            st.setInt(9, x.getVai_tro());
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateInformation(String username, String name, String email, String phonenumber, String gender, String birthday){
        String sql = "Update customer set Ngay_sinh = ?, so_dien_thoai = ?, Ho_ten=?, Gioi_tinh=?, Email=? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, birthday);
            st.setString(2, phonenumber);
            st.setString(3, name);
            st.setString(4, gender);
            st.setString(5, email);
            st.setString(6, username);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
