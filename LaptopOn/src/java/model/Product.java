/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author CELESTIALS
 */
public class Product {

    int id;
    private String name;
    private Integer prices;
    private Product_category product_category;
    private String describe;
    private String img;
    private Integer sale;
    private int nsx;

    public Product() {
        sale = 0;
    }

    public Product(int id, String name, Integer prices, Product_category product_category, String describe, String img, Integer sale, int nsx) {
        this.id = id;
        this.name = name;
        this.prices = prices;
        this.product_category = product_category;
        this.describe = describe;
        this.img = img;
        this.sale = sale;
        this.nsx = nsx;
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

    public Integer getPrices() {
        return prices;
    }

    public void setPrices(Integer prices) {
        this.prices = prices;
    }

    public Product_category getProduct_category() {
        return product_category;
    }

    public void setProduct_category(Product_category product_category) {
        this.product_category = product_category;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getSale() {
        return sale;
    }

    public void setSale(Integer sale) {
        this.sale = sale;
    }

    public int getNsx() {
        return nsx;
    }

    public void setNsx(int nsx) {
        this.nsx = nsx;
    }

}
