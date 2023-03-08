/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class OrderDetails {

    private int orderId;
    private int size;
    private int quantity;
    private Shoe shoe;
    private String masp;
    private double price;
    private double sale;

    public OrderDetails() {
    }

    public OrderDetails(int orderId, String masp, int size, int quantity,  double price, double sale, Shoe shoe) {
        this.orderId = orderId;
        this.size = size;
        this.quantity = quantity;
        this.shoe = shoe;
        this.masp = masp;
        this.price = price;
        this.sale = sale;
        
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }

    public String getMasp() {
        return masp;
    }

    public void setMasp(String masp) {
        this.masp = masp;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }
    

}
