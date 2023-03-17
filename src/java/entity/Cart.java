/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import entity.Shoe;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    //lay so luong cua san pham
    public int getQuantityById(String id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(String id) {
        for (Item i : items) {
            if (i.getShoe().getId().equals(id)) {
                return i;
            }
        }
        return null;
    }

    //
    public Item getItem(String id, int size) {
        for (Item i : items) {
            if (i.getShoe().getId().equals(id) && size == i.getSize()) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        //cap nhat lai so luong
        if (getItem(t.getShoe().getId(), t.getSize()) != null) {
            Item m = getItemById(t.getShoe().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(String id, int size) {
        if (getItemById(id) != null) {
            items.remove(getItem(id, size));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * (i.getShoe().getPrice() - i.getShoe().getPrice() / 100 * i.getShoe().getSale_price()));
        }
        return t;
    }

    //lấy ra giày trong list
    private Shoe getProductById(String id, List<Shoe> list) {
        for (Shoe i : list) {
            if (i.getId().equals(id)) {
                return i;
            }
        }
        return null;
    }
    
    
    //lấy ra tổng giá sale của đơn
    public double getSaleMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * (i.getShoe().getPrice() / 100 * i.getShoe().getSale_price()));
        }
        return t;
    }

    public double getRealMoney() {
        double t = 0;
        for (Item i : items) {
            t += (i.getQuantity() * (i.getShoe().getPrice()));
        }
        return t;
    }

    //chuyen txt sang cart
    public Cart(String txt, List<Shoe> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    String id = n[0];
                    int size = Integer.parseInt(n[1]);
                    int quantity = Integer.parseInt(n[2]);
                    Shoe p = getProductById(id, list);
                    Item t = new Item(p, p.getPrice(), quantity, size);
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {
        }
    }
}
