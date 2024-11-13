/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import model.Cart;
import model.Item;
import model.ListCart;
import model.User;

/**
 *
 * @author admin
 */
public class OrderDAO extends DBContext {

    public void addOrder(User user, Cart cart, String adress, String phone) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            String sql2 = "INSERT INTO [dbo].[Shopping_cart]\n"
                    + "           ([total_prices]\n"
                    + "           ,[date]\n"
                    + "           ,[user_id]\n"
                    + "           ,[staus_order]\n"
                    + "           ,[address]\n"
                    + "           ,[phone])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ? ,? ,?)";
            PreparedStatement st = connection.prepareStatement(sql2);
            st.setInt(1, cart.getTotalMoney());
            st.setString(2, date);
            if (user != null) {
                st.setInt(3, user.getId());
            }else{
                st.setString(3, null);
            }
            st.setString(4, "Đang liên hệ");
            st.setString(5, adress);
            st.setString(6, phone);
            st.executeUpdate();
            String sql3 = "SELECT top 1 [id]\n"
                    + "  FROM [dbo].[Shopping_cart]\n"
                    + "  order by id desc";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            ResultSet rs3 = st3.executeQuery();
            if (rs3.next()) {
                int spcid = rs3.getInt("id");
                for (Item i : cart.getItems()) {
                    String sql4 = "INSERT INTO [dbo].[Shopping_cart_item]\n"
                            + "           ([quantity]\n"
                            + "           ,[product_id]\n"
                            + "           ,[price]\n"
                            + "           ,[shopping_cart_id])\n"
                            + "     VALUES\n"
                            + "           (?, ?, ?, ?)";
                    PreparedStatement st4 = connection.prepareStatement(sql4);
                    st4.setInt(1, i.getQuantity());
                    st4.setInt(2, i.getProduct().getId());
                    st4.setInt(3, i.getPrice());
                    st4.setInt(4, spcid);
                    st4.executeUpdate();
                }
            }
        } catch (Exception e) {
        }

    }
}
