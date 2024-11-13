/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author admin
 */
public class ListCart {
    private List<Cart> carts;

    public ListCart() {
    }
    
    public ListCart(List<Cart> carts) {
        this.carts = carts;
    }

    public List<Cart> getCarts() {
        return carts;
    }
    
    public void setCarts(List<Cart> carts) {
        this.carts = carts;
    }
    public int getTotal(){
        int price = 0;
        for (Cart cart : carts) {
            price += cart.getTotalMoney();
        }
        return price;
    }
}
