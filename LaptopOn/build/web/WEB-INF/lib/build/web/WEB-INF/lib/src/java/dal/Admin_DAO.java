/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.ProductTemp;
import model.Shopping_cart;
import model.Shopping_cart_item;
import model.User;

/**
 *
 * @author admin
 */
public class Admin_DAO extends DBContext {

    public int getNumberAccount() {
        int x = 0;
        String spl = "SELECT count(id)\n"
                + "  FROM [dbo].[Users]";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getNumberProduct() {
        int x = 0;
        String spl = "SELECT count(id)\n"
                + "  FROM [dbo].[Product]";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getNumberCart() {
        int x = 0;
        String spl = "SELECT count(id)\n"
                + "  FROM [dbo].[Shopping_cart]";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getNumberCartnv() {
        int x = 0;
        String spl = "SELECT count(id)\n"
                + "  FROM [dbo].[Shopping_cart]\n"
                + "  where staus_order != N'Hoàn thành' and staus_order != N'Hủy'";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }
    

}
