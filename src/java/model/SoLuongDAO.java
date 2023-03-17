/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import entity.SoLuong;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author Admin
 */
public class SoLuongDAO extends DBContext {

    public List<SoLuong> listSoLuong(String masp) {
        List<SoLuong> lst = new ArrayList();
        String sql = "Select * from so_luong where masp = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SoLuong d = new SoLuong();
                d.setMasp(rs.getString("masp"));
                d.setSize(rs.getInt("size_giay"));
                d.setSoluong(rs.getInt("so_luong"));
                lst.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public int countSoLuong(String masp) {
        String sql = "select sum(so_luong) from so_luong  group by masp having masp = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void insertSoLuong(String masp, int size, int soluong) {
        String sql = "insert into so_luong(MASP, size_giay, so_luong)\n"
                + "values(?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            st.setInt(2, size);
            st.setInt(3, soluong);
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public SoLuong searchSoLuong(String masp, int size) {
        SoLuong sl = new SoLuong();
        String sql = "select * from so_luong where masp = ? and size = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            st.setInt(2, size);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sl.setMasp(rs.getString("masp"));
                sl.setSize(rs.getInt("size_giay"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sl;
    }
    
    public void updateSoLuong(String masp, int size, int so_luong){
        String sql = "Update so_luong set so_luong = ? where masp = ? and size_giay = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, so_luong);
            st.setString(2, masp);
            st.setInt(3, size);   
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteSoLuong(String masp, int smallsize, int bigsize){
        String sql = "delete so_luong where masp = ? and (size_giay < ? or size_giay > ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, masp);
            st.setInt(2, smallsize);
            st.setInt(3, bigsize);   
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
