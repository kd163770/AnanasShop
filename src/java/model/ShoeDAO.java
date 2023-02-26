/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ShoeDAO extends DBContext{
    public List<Shoe> listShoe(String gt){
        List<Shoe> s = new ArrayList();
        String sql;
        if(gt != null && !gt.isEmpty())
        {
            sql = "Select * from san_pham where gioi_tinh = ?";  
        }
        else{
            sql = "Select * from san_pham";
        }
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            if(gt != null && !gt.isEmpty())
        {
           st.setString(1, gt);
            
        }
            
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setSale_price(rs.getDouble("gia_sale"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                s.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return s;
    }
    
    public List<Shoe> shoeSallOff(){
        List<Shoe> lst = new ArrayList();
        String sql = "Select * from san_pham where gia_sale <> 0";
        try{
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                lst.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return lst;
    }
    public List<Shoe> allInBlack(){
        List<Shoe> lst = new ArrayList();
        String sql = "Select * from san_pham where color = 'Black'";
        try{
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                lst.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return lst;
    }
    public List<Shoe> searchShoe(String xName){
        List<Shoe> shoe = new ArrayList();
        String sql = "Select * from san_pham where name like '%" + xName.trim() +"%'";
        try{
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                shoe.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return shoe;
    }
    
    public List<Shoe> phanLoai(String xKieuDang, String xLoaiGiay, String xGia){
        List<Shoe> shoe = new ArrayList();
        String sql = "Select * from san_pham where 1=1";
        
        if(xKieuDang.equals("") == false){
           sql = sql + " AND kieu_dang = "+ xKieuDang;
        }
        if(xLoaiGiay.equals("") == false){
           sql = sql + " AND loai_giay = "+ xLoaiGiay;
        }
        
        if(xGia.equals("") == false){
            if(xGia.equals("1")){
                sql = sql + " AND gia_tien >= 600000";
            }
            if(xGia.equals("2")){
                sql = sql + " AND gia_tien >= 500000 And gia_tien <=599000";
            }
            if(xGia.equals("3")){
                sql = sql + " AND gia_tien >= 400000 And gia_tien <=499000";
            }
        }
        try{
             PreparedStatement st = connection.prepareStatement(sql);
//             st.setString(1, xKieuDang);
             ResultSet rs = st.executeQuery();
             
             while (rs.next()) {
                Shoe d = new Shoe();
                d.setId(rs.getString("MASP"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getDouble("gia_tien"));
                d.setGioi_tinh(rs.getString("gioi_tinh"));
                shoe.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        System.out.println(sql);
        return shoe;
    }
    public static void main(String[] args) {
        ShoeDAO sh = new ShoeDAO();
        List<Shoe> u = sh.phanLoai("","","2");
        
    }
}
