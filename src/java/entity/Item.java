/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.Shoe;

/**
 *
 * @author Admin
 */
public class Item {
    private Shoe shoe;
    private double price;
    private int quantity;
    private int size;

    public Item() {
    }

    public Item(Shoe shoe, double price, int quantity, int size) {
        this.shoe = shoe;
        this.price = price;
        this.quantity = quantity;
        this.size = size;
    }

    public Shoe getShoe() {
        return shoe;
    }

    public void setShoe(Shoe shoe) {
        this.shoe = shoe;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
    
    
}
