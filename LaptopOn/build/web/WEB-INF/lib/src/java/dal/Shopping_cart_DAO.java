/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Shopping_cart;
import model.Shopping_cart_item;

/**
 *
 * @author admin
 */
public class Shopping_cart_DAO extends DBContext {

    public Shopping_cart getShopping_cartById(int id) {
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + "  where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));
                return shopping_cart;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Shopping_cart getShopping_cartNew() {
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + "  order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));
                return shopping_cart;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Shopping_cart> getShopping_cartByKey(int key) {
        List<Shopping_cart> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + "  where id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, key);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));
                list.add(shopping_cart);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart> getShopping_cartByUId(int uid) {
        List<Shopping_cart> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + "  where user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));
                list.add(shopping_cart);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart> getShopping_cartAll() {
        List<Shopping_cart> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));;
                list.add(shopping_cart);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart> getShopping_cartAllNV() {
        List<Shopping_cart> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + " where staus_order != N'Hoàn thành' and staus_order != N'Hủy'\n";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));;
                list.add(shopping_cart);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart_item> getShopping_cart_ItemBySid(int shopping_cart_id) {
        List<Shopping_cart_item> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[quantity]\n"
                + "      ,[product_id]\n"
                + "      ,[price]\n"
                + "      ,[shopping_cart_id]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart_item]\n"
                + "  Where shopping_cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, shopping_cart_id);
            ResultSet rs = st.executeQuery();
            Product_DAO p = new Product_DAO();
            while (rs.next()) {
                Shopping_cart_item s = new Shopping_cart_item(rs.getInt("id"), rs.getInt("quantity"),
                        p.getProductByID(rs.getInt("product_id")), rs.getInt("price"), getShopping_cartById(rs.getInt("shopping_cart_id")));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart_item> getShopping_cart_ItemALL() {
        List<Shopping_cart_item> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[quantity]\n"
                + "      ,[product_id]\n"
                + "      ,[price]\n"
                + "      ,[shopping_cart_id]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart_item]\n";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            Product_DAO p = new Product_DAO();
            while (rs.next()) {
                Shopping_cart_item s = new Shopping_cart_item(rs.getInt("id"), rs.getInt("quantity"),
                        p.getProductByID(rs.getInt("product_id")), rs.getInt("price"), getShopping_cartById(rs.getInt("shopping_cart_id")));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Shopping_cart> getShopping_cartNvByKey(int key) {
        List<Shopping_cart> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[total_prices]\n"
                + "      ,[date]\n"
                + "      ,[user_id]\n"
                + "      ,[staus_order]\n"
                + "      ,[address]\n"
                + "      ,[phone]\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + "  where staus_order != N'Hoàn thành' and staus_order != N'Hủy' and id=? ";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, key);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_DAO u = new User_DAO();
                Shopping_cart shopping_cart = new Shopping_cart(rs.getInt("id"), rs.getInt("total_prices"), rs.getString("date"), u.getUserByID(rs.getInt("user_id")),
                        rs.getString("staus_order"), rs.getString("address"), rs.getString("phone"));
                list.add(shopping_cart);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteCart(int id) {
        String spl = "DELETE FROM [dbo].[Shopping_cart]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCart(int id, String status) {
        String spl = "UPDATE [dbo].[Shopping_cart]\n"
                + "   SET [staus_order] = N'" + status + "' \n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int getTotalPricebyMonth(int month) {
        int x = 0;
        String spl = "select sum([total_prices])\n"
                + "                from [dbo].[Shopping_cart]\n"
                + "                where [staus_order] = N'Hoàn thành' and MONTH(date) = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getTotalPricebyMonthAndYear(int month, int nam) {
        int x = 0;
        String spl = "SELECT sum(total_prices)\n"
                + "  FROM [LaptopOn].[dbo].[Shopping_cart]\n"
                + "  where [staus_order] = N'Hoàn thành' and MONTH(date) = ? ";
        try {
            if (nam != 1) {
                spl += " and year(date) = " + nam;
            }
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, month);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getNumberProductbyCid(int id) {
        int x = 0;
        String spl = "select sum(si.quantity)\n"
                + "from [dbo].[Shopping_cart_item] as si\n"
                + "join Shopping_cart as s on s.id = si.shopping_cart_id\n"
                + "join Product as p on p.id = si.product_id\n"
                + "join Product_category as pc on pc.id = p.product_category_id\n"
                + "where [staus_order] = N'Hoàn thành' and pc.id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return x;
    }

    public int getNumberProductbyCidAndNam(int id, int nam) {
        int x = 0;
        String spl = "select sum(si.quantity)\n"
                + "from [dbo].[Shopping_cart_item] as si\n"
                + "join Shopping_cart as s on s.id = si.shopping_cart_id\n"
                + "join Product as p on p.id = si.product_id\n"
                + "join Product_category as pc on pc.id = p.product_category_id\n"
                + "where [staus_order] = N'Hoàn thành' and pc.id = ? ";
        try {
            if (nam != 1) {
                spl += " and year(date) = " + nam;
            }
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
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
