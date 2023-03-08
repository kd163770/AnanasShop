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
public class Order {
    int id;
    String userId;
    String customer;
    Date orderDate;
    Date shipDate;
    Date receiveDate;
    int purchase_method;
    String address;
    String phonenumber;
    String email;
    double price;
    int status;
    
    public Order() {
    }

    public Order(int id, String userId, String customer, Date orderDate, Date shipDate, Date receiveDate, int purchase_method, String address, String phonenumber, String email, double price) {
        this.id = id;
        this.userId = userId;
        this.customer = customer;
        this.orderDate = orderDate;
        this.purchase_method = purchase_method;
        this.address = address;
        this.phonenumber = phonenumber;
        this.email = email;
        this.price = price;
        this.shipDate = shipDate;
        this.receiveDate = receiveDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getPurchase_method() {
        return purchase_method;
    }

    public void setPurchase_method(int purchase_method) {
        this.purchase_method = purchase_method;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getShipDate() {
        return shipDate;
    }

    public void setShipDate(Date shipDate) {
        this.shipDate = shipDate;
    }

    public Date getReceiveDate() {
        return receiveDate;
    }

    public void setReceiveDate(Date receiveDate) {
        this.receiveDate = receiveDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
