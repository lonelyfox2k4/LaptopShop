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
import model.TopUser;
import model.User;

/**
 *
 * @author admin
 */
public class User_DAO extends DBContext {

    public List<User> getUserAll() {
        List<User> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[pass]\n"
                + "      ,[role]\n"
                + "      ,[phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users]\n";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("pass"), rs.getInt("role"), rs.getString("phone"), rs.getString("img"));
                u.setId(rs.getInt("id"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getUserByRole(int role) {
        List<User> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[pass]\n"
                + "      ,[role]\n"
                + "      ,[phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users]\n"
                + " Where role = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, role);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("pass"), rs.getInt("role"), rs.getString("phone"), rs.getString("img"));
                u.setId(rs.getInt("id"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserByEmail(String email) {
        String spl = "SELECT [id]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[pass]\n"
                + "      ,[role]\n"
                + "      ,[phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users]\n"
                + "  where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("pass"), rs.getInt("role"), rs.getString("phone"), rs.getString("img"));
                u.setId(rs.getInt("id"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> getUserByEmailAll(String key) {
        List<User> list = new ArrayList<>();
        String spl = "SELECT [id]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[pass]\n"
                + "      ,[role]\n"
                + "      ,[phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users]\n"
                + "  where 1 = 1 and role = 1 and email like ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            String s = "%" + key + "%";
            st.setString(1, s);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("pass"), rs.getInt("role"), rs.getString("phone"), rs.getString("img"));
                u.setId(rs.getInt("id"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public User getUserByID(int id) {
        String spl = "SELECT [id]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[email]\n"
                + "      ,[pass]\n"
                + "      ,[role]\n"
                + "      ,[phone]\n"
                + "      ,[img]\n"
                + "  FROM [dbo].[Users]\n"
                + "  where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("first_name"), rs.getString("last_name"), rs.getString("email"), rs.getString("pass"), rs.getInt("role"), rs.getString("phone"), rs.getString("img"));
                u.setId(rs.getInt("id"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertUser(User u) {
        String spl = "INSERT INTO [dbo].[Users]\n"
                + "           ([first_name]\n"
                + "           ,[last_name]\n"
                + "           ,[email]\n"
                + "           ,[pass]\n"
                + "           ,[role]\n"
                + "           ,[phone]\n"
                + "           ,[img])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, u.getFirst_name());
            st.setString(2, u.getLast_name());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPass());
            st.setInt(5, 1);
            st.setString(6, u.getPhone());
            st.setString(7, u.getImg());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePassword(String email, String changepass) {
        String spl = "UPDATE [dbo].[Users]\n"
                + "   SET [pass] = ?\n"
                + " WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, changepass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeImg(String email, String img) {
        String spl = "UPDATE [dbo].[Users]\n"
                + "   SET [img] = ?\n"
                + " WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, img);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeUser(User u) {
        String spl = "UPDATE [dbo].[Users]\n"
                + "   SET [first_name] = ?\n"
                + "      ,[last_name] = ?\n"
                + "      ,[pass] = ?\n"
                + "      ,[role] = ?\n"
                + "      ,[phone] = ?\n"
                + "      ,[img] = ?\n"
                + " WHERE email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, u.getFirst_name());
            st.setString(2, u.getLast_name());
            st.setString(3, u.getPass());
            st.setInt(4, u.getRole());
            st.setString(5, u.getPhone());
            st.setString(6, u.getImg());
            st.setString(7, u.getEmail());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<TopUser> getAllShopping_cartTop6() {
        List<TopUser> list = new ArrayList<>();
        String spl = "select top 6 u.id as uid, sum(total_prices) as totalmoney\n"
                + "from Shopping_cart as s\n"
                + "join Users as u on s.user_id = u.id\n"
                + "where s.staus_order = N'Hoàn thành'\n"
                + "group by u.id\n"
                + "order by sum(total_prices) desc";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = getUserByID(rs.getInt("uid"));
                TopUser s = new TopUser(u.getId() ,u.getFullname(), u.getImg(), rs.getInt("totalmoney"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
