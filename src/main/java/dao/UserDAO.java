/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author avillX
 */
public class UserDAO {
<<<<<<< HEAD
    private final static String LOGIN = "SELECT * FROM dbo.User WHERE username=? AND password=? AND status='APPROVED'";
    private final static String APPROVED_USER = "UPDATE dbo.User SET status = ? where user_id = ?";
    private final static String ADDNEW_USER = "INSERT INTO dbo.User (username,password,email,fullname,phone,status,isAdmin) value(?,?,?,?,?,?,?)";
    private final static String GET_LIST_USER = "SELECT * FROM dbo.User";


    public static UserDTO checkLogin(String username, String password) throws SQLException {
=======
    private final static String LOGIN = "SELECT * FROM dbo.[User] WHERE email=? AND password=? AND status='APPROVED'";
    private final static String APPROVED_USER = "UPDATE dbo.[User] SET status = ? where user_id = ?";


public UserDTO checkLogin(String email, String password) throws SQLException {
>>>>>>> a3f2a3d29e3b22d42af25d0ea1a30266b88ad67b
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, email);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("user_id");
                    String fullName = rs.getString("fullName");                   
                    String phone = rs.getString("phone");
<<<<<<< HEAD
                    String status = rs.getString("status");
                    String roleID = rs.getString("isAdmin");
                    user = new UserDTO(userID, username, password, fullName, email, phone, status, roleID);
=======
                    String roleID = rs.getString("Role");
                    user = new UserDTO(userID, password, fullName, email, phone, "APPROVED", roleID);
>>>>>>> a3f2a3d29e3b22d42af25d0ea1a30266b88ad67b
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public static boolean Approved_User(String userID, String newStatus) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPROVED_USER);
                ptm.setString(1, newStatus);
                ptm.setString(2, userID);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public static ArrayList<UserDTO> getUserList() throws SQLException{
        ArrayList<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_USER);
                ResultSet rs = ptm.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        String userID = rs.getString("user_id");
                        String userName = rs.getString("username");
                        String password = rs.getString("password");
                        String email = rs.getString("email");
                        String fullName = rs.getString("fullName");  
                        String phone = rs.getString("phone");
                        String status = rs.getString("status");
                        String roleID = rs.getString("isAdmin");
                        UserDTO user = new UserDTO(userID, userName, password, fullName, email, phone, status, roleID);
                        list.add(user);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public static boolean addNewUser(String username, String password, String email, String fullname, String phone, String roleID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_USER);
                ptm.setString(1, username);
                ptm.setString(2, password);
                ptm.setString(3, email);
                ptm.setString(4, fullname);
                ptm.setString(5, phone);
                ptm.setString(6, "REJECT");
                ptm.setString(7, roleID);
                check = ptm.executeUpdate()>0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
}
