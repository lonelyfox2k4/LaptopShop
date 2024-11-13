/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Shopping_cart {
    private int id;
    private int total_price;
    private String date;
    private User user;
    private String staus_order;
    private String adress;
    private String phone;

    public Shopping_cart() {
    }

    public Shopping_cart(int id, int total_price, String date, User user, String staus_order, String adress, String phone) {
        this.id = id;
        this.total_price = total_price;
        this.date = date;
        this.user = user;
        this.staus_order = staus_order;
        this.adress = adress;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getStaus_order() {
        return staus_order;
    }

    public void setStaus_order(String staus_order) {
        this.staus_order = staus_order;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    
    
}
