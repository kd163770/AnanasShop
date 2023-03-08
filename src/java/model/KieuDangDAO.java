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
public class KieuDangDAO extends DBContext{
    public List<KieuDang> kieuGiay(){
        List<KieuDang> lst = new ArrayList();
        String sql = "Select * from kieu_dang";
        try{
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {
                KieuDang d = new KieuDang();
                d.setId(rs.getInt("ID"));
                d.setName(rs.getString("name"));
                lst.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return lst;
    }
}
