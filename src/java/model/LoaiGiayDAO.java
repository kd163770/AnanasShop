/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.LoaiGiay;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.*;

/**
 *
 * @author Admin
 */
public class LoaiGiayDAO extends DBContext {

    public List<LoaiGiay> loaiGiay() {
        List<LoaiGiay> lst = new ArrayList();
        String sql = "Select * from loai_giay";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LoaiGiay d = new LoaiGiay();
                d.setId(rs.getInt("ID"));
                d.setName(rs.getString("name"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public List<LoaiGiay> searcLloaiGiay(String sortlg, int index) {
        List<LoaiGiay> lst = new ArrayList();
        String sql = "select * from \n"
                + "(select ROW_NUMBER() over (order by "+sortlg+" asc) as r, * from loai_giay) as x \n"
                + "where r between ?*4-3 and ?*4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index);
            st.setInt(2, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                LoaiGiay d = new LoaiGiay();
                d.setId(rs.getInt("ID"));
                d.setName(rs.getString("name"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public int countLoaiGiay() {
        String sql = "Select COUNT(*) from loai_giay";
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
    
    //soluong cua moi loai giay
    public int countQuantity(int id){
          String sql = "Select COUNT(*) from san_pham where loai_giay = ?";
          try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
      }
    
    public void inseartLoaiGiay(String name){
        String sql = "Insert into loai_giay(name) values (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateLoaiGiay(int id, String name){
         String sql = "Update loai_giay set name = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, id);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public LoaiGiay searchByName(String name)
    {
        LoaiGiay lg = new LoaiGiay();
        String sql = "Select * from loai_giay where name = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                lg.setId(rs.getInt("ID"));
                lg.setName(rs.getString("name"));
                return lg;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public void deletehByName(int id)
    {
        String sql = "Delete loai_giay where id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            st.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
