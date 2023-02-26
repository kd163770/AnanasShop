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
public class LoaiGiayDAO extends DBContext{
    public List<LoaiGiay> loaiGiay(){
        List<LoaiGiay> lst = new ArrayList();
        String sql = "Select * from loai_giay";
        try{
             PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
             while (rs.next()) {
                LoaiGiay d = new LoaiGiay();
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
