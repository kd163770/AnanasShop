/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.KieuDang;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.*;

/**
 *
 * @author Admin
 */
public class KieuDangDAO extends DBContext {
    
    
    //list danh sach kieu giay ben trang menu
    public List<KieuDang> kieuGiay() {
        List<KieuDang> lst = new ArrayList();
        String sql = "Select * from kieu_dang";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                KieuDang d = new KieuDang();
                d.setId(rs.getInt("ID"));
                d.setName(rs.getString("name"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public List<KieuDang> searchKieuGiay(String sortkd, int index) {
        List<KieuDang> lst = new ArrayList();
        String sql = "select * from \n"
                + "(select ROW_NUMBER() over (order by "+sortkd+" asc) as r, * from kieu_dang) as x \n"
                + "where r between ?*4-3 and ?*4";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, index);
            st.setInt(2, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                KieuDang d = new KieuDang();
                d.setId(rs.getInt("ID"));
                d.setName(rs.getString("name"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }
    
      public int countKieuDang() {
        String sql = "Select COUNT(*) from kieu_dang";
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
      
      public int countQuantity(int id){
          String sql = "Select COUNT(*) from san_pham where kieu_dang = ?";
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
      
      public void updateKieuDang(int id, String name){
         String sql = "Update kieu_dang set name = ? where id = ?";
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
    
    public KieuDang searchByName(String name)
    {
        KieuDang lg = new KieuDang();
        String sql = "Select * from kieu_dang where name = ?";
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
    
    public void insertKieuDang(String name){
        String sql = "Insert into kieu_dang(name) values (?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deletehByName(int id)
    {
        String sql = "Delete kieu_dang where id = ?";
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
