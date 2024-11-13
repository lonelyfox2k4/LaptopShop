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
import model.CountProduct;
import model.Product;
import model.ProductTemp;
import model.Product_category;

/**
 *
 * @author admin
 */
public class Product_DAO extends DBContext {

    public Product_category getProduct_categoryById(int id) {
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Product_category]\n"
                + "Where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product_category c = new Product_category(rs.getInt("id"), rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product_category> getProduct_categoryAll() {
        List<Product_category> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Product_category]\n";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_category c = new Product_category(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getLinkKien24() {
        List<Product> list = new ArrayList<>();
        String spl = "select * from (SELECT TOP 8 * FROM Product where product_category_id = 6 ORDER BY prices asc) as a\n"
                + "UNION all\n"
                + "select * from (SELECT TOP 8 * FROM Product where product_category_id = 7 ORDER BY prices asc) as a\n"
                + "union all\n"
                + "select * from (SELECT TOP 8 * FROM Product where product_category_id = 8 ORDER BY prices asc) as a\n"
                + "order by prices desc";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteProduct(int id) {
        String spl = "DELETE FROM [dbo].[Product]\n"
                + "      WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateCategory(int id, String name) {
        String spl = "UPDATE [dbo].[Product_category]\n"
                + "   SET [name] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, name);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + ",[sale]\n"
                + ",[nsx]\n"
                + "  FROM [LaptopOn].[dbo].[Product]";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByNsx(int nsx) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where nsx = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, nsx);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getListP(int start, int end, List<Product> list) {
        List<Product> list1 = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list1.add(list.get(i));
        }
        return list1;
    }

    public List<Product_category> getProduct_categoryById(int id1, int id2) {
        List<Product_category> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [LaptopOn].[dbo].[Product_category]\n"
                + "  where id >= ? and id <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id1);
            st.setInt(2, id2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_category c = new Product_category(rs.getInt("id"), rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByFromAndTo(double from, double to) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product]\n"
                + "  where prices between ? and ?";

        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setDouble(1, from);
            st.setDouble(2, to);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCheck(int[] cid) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product]\n";
        if ((cid != null) && (cid[0] != 0)) {
            spl += " where product_category_id in(";
            for (int i = 0; i < cid.length; i++) {
                spl += cid[i] + ",";
            }
            if (spl.endsWith(",")) {
                spl = spl.substring(0, spl.length() - 1);
            }
        }
        spl += ")";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product]\n";
        if (cid != 0) {
            spl += " where product_category_id = " + cid;
        }
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getLaptop() {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + ",[sale]\n"
                + ",[nsx]\n"
                + "  FROM [LaptopOn].[dbo].[Product] where product_category_id >=1 and product_category_id <= 5";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> search(int hang, int nam,
            double price, double price2) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product] where product_category_id >=1 and product_category_id <= 5";
        if (hang != 0) {
            spl += " and product_category_id = " + hang;
        }
        if (nam != 0) {
            spl += " and nsx = " + nam;
        }
        if (price != 0) {
            spl += " and prices >=" + price;
        }
        if (price2 != 0) {
            spl += " and prices <=" + price2;
        }
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchName(int hang, String name) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product] where 1 = 1";
        if (hang != 0) {
            spl += " and product_category_id = " + hang;
        }
        if (name != null) {
            spl += " and name like '%" + name + "%'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchByKey(String key) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product] where 1=1";
        if (key != null && !key.equals("")) {
            spl += " and name like '%" + key + "%'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> searchPhukien(int hang,
            double price, double price2) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product] where product_category_id >=6 and product_category_id <= 8";
        if (hang != 0) {
            spl += " and product_category_id = " + hang;
        }
        if (price != 0) {
            spl += " and prices >=" + price;
        }
        if (price2 != 0) {
            spl += " and prices <=" + price2;
        }
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Product getProductByID(int id) {
        String spl = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Product> getTop4ProductByCid(int cid, int id) {
        List<Product> list = new ArrayList<>();
        String spl = "SELECT TOP (4) [id]\n"
                + "      ,[name]\n"
                + "      ,[product_category_id]\n"
                + "      ,[describe]\n"
                + "      ,[img]\n"
                + "      ,[prices]\n"
                + "      ,[nsx]\n"
                + ",[sale]\n"
                + "  FROM [LaptopOn].[dbo].[Product]\n";
        if (cid != 0) {
            spl += " where product_category_id = " + cid + "and id != " + id;
        }
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product c = new Product(rs.getInt("id"), rs.getString("name"), rs.getInt("prices"),
                        getProduct_categoryById(rs.getInt("product_category_id")), rs.getString("describe"), rs.getString("img"), rs.getInt("sale"), rs.getInt("nsx"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertProduct(Product u) {
        String spl = "INSERT INTO [dbo].[Product]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[product_category_id]\n"
                + "           ,[describe]\n"
                + "           ,[img]\n"
                + "           ,[prices]\n"
                + "           ,[nsx]\n"
                + "           ,[sale])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, u.getId());
            st.setString(2, u.getName());
            st.setInt(3, u.getProduct_category().getId());
            st.setString(4, u.getDescribe());
            st.setString(5, u.getImg());
            st.setInt(6, u.getPrices());
            st.setInt(7, u.getNsx());
            st.setInt(8, u.getSale());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product u) {
        String spl = "UPDATE [dbo].[Product]\n"
                + "   SET [id] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[product_category_id] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[prices] = ?\n"
                + "      ,[nsx] = ?\n"
                + "      ,[sale] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, u.getId());
            st.setString(2, u.getName());
            st.setInt(3, u.getProduct_category().getId());
            st.setString(4, u.getDescribe());
            st.setString(5, u.getImg());
            st.setInt(6, u.getPrices());
            if (u.getNsx() == 0) {
                st.setString(7, null);
            } else {
                st.setInt(7, u.getNsx());
            }
            if (u.getSale() == 0) {
                st.setString(8, null);
            } else {
                st.setInt(8, u.getSale());

            }
            st.setInt(9, u.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<ProductTemp> selectTop8Product() {
    List<ProductTemp> list = new ArrayList<>();
    String spl = "SELECT top 8 product_id,  sum(quantity) AS so_lan_xuat_hien\n" +
"                FROM Shopping_cart_item\n" +
"                GROUP BY product_id\n" +
"                ORDER BY sum(quantity) DESC;";
    try {
        PreparedStatement st = connection.prepareStatement(spl);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("product_id"); // Lấy giá trị product_id
            int quantitySum = rs.getInt("so_lan_xuat_hien"); // Lấy giá trị so_lan_xuat_hien

            // Tạo đối tượng ProductTemp và thêm vào danh sách
            ProductTemp product = new ProductTemp(id, getProductByID(id).getName(), quantitySum, getProductByID(id).getPrices());
            list.add(product);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}
}
