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
                account.setStatus(rs.getBoolean("Trang_Thai"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }
    
    //Dua ra thong tin nguoi dung
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
        String sql = "Insert into Customer(ID,password,ngay_sinh,so_dien_thoai,ho_ten,gioi_tinh,email, dia_chi,vai_tro,trang_thai) values (?,?,?,?,?,?,?,?,?,1)";
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
    
    public void updateInformation(String username, String name, String email, String phonenumber, String gender, String birthday, String address){
        String sql = "Update customer set Ngay_sinh = ?, so_dien_thoai = ?, Ho_ten=?, Gioi_tinh=?, Email=?, Dia_chi=? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, birthday);
            st.setString(2, phonenumber);
            st.setString(3, name);
            st.setString(4, gender);
            st.setString(5, email);
            st.setString(6, address);
            st.setString(7, username);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public int countCustomers(int status, String gender) {
        String sql = "Select COUNT(*) from customer where 1=1";
        if(status!= 0){
            sql = sql + " and Trang_Thai = " + status;
        }
        if(gender.equals("")){
            sql = sql + " and Gioi_Tinh = " + gender;
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
    
    public List<Customer> listTenCustomer(int index, String orderby, String order, String gender, int status) {
        List<Customer> lst = new ArrayList();
        String sqls = "(select ROW_NUMBER() over (order by " + orderby + " " + order + ") as r, * from customer where vai_tro=2";
       if (status != 2) {
            sqls = sqls + " and trang_thai = " + status;
        }
       if (gender.equals("") != true) {
            sqls = sqls + " and gioi_tinh = '" + gender +"'";
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
                Customer c = new Customer();
                c.setUsername(rs.getString("id"));
                c.setPassword(rs.getString("password"));
                c.setHo_ten(rs.getString("Ho_Ten"));
                c.setNgay_sinh(rs.getDate("Ngay_Sinh"));
                c.setGioi_tinh(rs.getString("Gioi_tinh"));
                c.setEmail(rs.getString("email"));
                c.setSdt(rs.getString("so_dien_thoai"));
                c.setDia_chi(rs.getString("Dia_chi"));
                c.setVai_tro(rs.getInt("vai_tro"));
                c.setStatus(rs.getBoolean("trang_thai"));
                lst.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }
    
    public double getMoney(String userid){
        String sql = "select sum(don_gia) from orders where ID_Nguoi_dung = ? and trang_thai <> 4 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    public void updateStatus(String id, int status){
        String sql = "Update customer set Trang_Thai = ? where ID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setString(2, id);      
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
