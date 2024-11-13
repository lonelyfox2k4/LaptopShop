/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author CELESTIALS
 */
public class Shopping_cart_item {
    private int id;
    private int quantity;
    private Product product;
    private int price;
    private Shopping_cart shopping_cart;

    public Shopping_cart_item() {
    }

    public Shopping_cart_item(int id, int quantity, Product product, int price, Shopping_cart shopping_cart) {
        this.id = id;
        this.quantity = quantity;
        this.product = product;
        this.price = price;
        this.shopping_cart = shopping_cart;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Shopping_cart getShopping_cart() {
        return shopping_cart;
    }

    public void setShopping_cart(Shopping_cart shopping_cart) {
        this.shopping_cart = shopping_cart;
    }
    
}
