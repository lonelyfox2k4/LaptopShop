/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CELESTIALS
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    private Item getItemByID(int id) {
        for (Item item : items) {
            if (item.getProduct().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemByID(id).getQuantity();
    }

    public void appItem(Item i) {
        if (getItemByID(i.getProduct().getId()) != null) {
            Item i1 = getItemByID(i.getProduct().getId());
            i1.setQuantity(i.getQuantity() + i1.getQuantity());
        } else {
            items.add(i);
        }
    }

    public void removeItem(int id) {
        if (getItemByID(id) != null) {
            items.remove(getItemByID(id));
        }
    }

    public int getTotalMoney() {
        int t = 0;
        for (Item item : items) {
            t += item.getPrice() * item.getQuantity();
        }
        return t;
    }

    private Product getProductById(int id, List<Product> list) {
        for (Product product : list) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    int price = Integer.parseInt(n[2]);
                    Product p = getProductById(id, list);
                    Item i1;
                    i1 = new Item(p, quantity, price);
                    appItem(i1);
                }
            }
        } catch (NumberFormatException e) {
        }

    }

}
