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
public class Shoe {
    private String id, name;
    double price;
    double sale_price;
    int smallest_size;
    int largest_size;
    int kieu_dang;
    int loai_giay;
    String mau_sac;
    String gioi_tinh;
    Date ngay_ra_mat;

    public Shoe() {
    }

    public Shoe(String id, String name, double price, double sale_price, int smallest_size, int largest_size, int kieu_dang, int loai_giay, String gioi_tinh, String mau_sac) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sale_price = sale_price;
        this.smallest_size = smallest_size;
        this.largest_size = largest_size;
        this.kieu_dang = kieu_dang;
        this.loai_giay = loai_giay;
        this.gioi_tinh = gioi_tinh;
        this.mau_sac = mau_sac;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale_price() {
        return sale_price;
    }

    public void setSale_price(double sale_price) {
        this.sale_price = sale_price;
    }

    public int getSmallest_size() {
        return smallest_size;
    }

    public void setSmallest_size(int smallest_size) {
        this.smallest_size = smallest_size;
    }

    public int getLargest_size() {
        return largest_size;
    }

    public void setLargest_size(int largest_size) {
        this.largest_size = largest_size;
    }

    public int getKieu_dang() {
        return kieu_dang;
    }

    public void setKieu_dang(int kieu_dang) {
        this.kieu_dang = kieu_dang;
    }

    public int getLoai_giay() {
        return loai_giay;
    }

    public void setLoai_giay(int loai_giay) {
        this.loai_giay = loai_giay;
    }

    public String getGioi_tinh() {
        return gioi_tinh;
    }

    public void setGioi_tinh(String gioi_tinh) {
        this.gioi_tinh = gioi_tinh;
    }

    public String getMau_sac() {
        return mau_sac;
    }

    public void setMau_sac(String mau_sac) {
        this.mau_sac = mau_sac;
    }

    public Date getNgay_ra_mat() {
        return ngay_ra_mat;
    }

    public void setNgay_ra_mat(Date ngay_ra_mat) {
        this.ngay_ra_mat = ngay_ra_mat;
    }
    

    

   
    
}
