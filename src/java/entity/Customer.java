/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Customer {
    private String username;
    private String password;
    private Date ngay_sinh;
    private String sdt;
    private String ho_ten;
    private String gioi_tinh;
    private String email;
    private int vai_tro;
    private String dia_chi;
    public Customer() {
    }

    public Customer(String username, String password, Date ngay_sinh, String sdt, String ho_ten, String gioi_tinh, String email,String dia_chi, int vai_tro) {
        this.username = username;
        this.password = password;
        this.ngay_sinh = ngay_sinh;
        this.sdt = sdt;
        this.ho_ten = ho_ten;
        this.gioi_tinh = gioi_tinh;
        this.email = email;
        this.vai_tro = vai_tro;
        this.dia_chi = dia_chi;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getNgay_sinh() {
        return ngay_sinh;
    }

    public void setNgay_sinh(Date ngay_sinh) {
        this.ngay_sinh = ngay_sinh;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getHo_ten() {
        return ho_ten;
    }

    public void setHo_ten(String ho_ten) {
        this.ho_ten = ho_ten;
    }

    public String getGioi_tinh() {
        return gioi_tinh;
    }

    public void setGioi_tinh(String gioi_tinh) {
        this.gioi_tinh = gioi_tinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getVai_tro() {
        return vai_tro;
    }

    public void setVai_tro(int vai_tro) {
        this.vai_tro = vai_tro;
    }

    public String getDia_chi() {
        return dia_chi;
    }

    public void setDia_chi(String dia_chi) {
        this.dia_chi = dia_chi;
    }

    
    
}
