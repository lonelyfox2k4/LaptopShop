/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class TopUser {
    private int id;
    private String name;
    private String img;
    private float total_prices;

    public TopUser() {
    }

    public TopUser(int id, String name, String img, float total_prices) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.total_prices = total_prices;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getTotal_prices() {
        return total_prices;
    }

    public void setTotal_prices(float total_prices) {
        this.total_prices = total_prices;
    }

    

    

    
}
