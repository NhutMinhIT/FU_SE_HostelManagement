/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.ContractDTO;
import dto.CustomerDTO;
import dto.HostelDTO;
import dto.RoomDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author avillX
 */
public class CustomerDAO {

    private final static String GETALLCUSTOMER = "SELECT * FROM dbo.[Customer] WHERE customer_id = ? AND status != 'MEMBER' AND status !='DELETE'";
    private final static String LOGINCUSTOMER = "SELECT * FROM dbo.[Customer] WHERE email = ? AND password =?";
    private final static String GETALLROOMMATE = "SELECT * FROM dbo.[Customer] WHERE customer_id = ? AND status = 'MEMBER'";
    private static final String ADDCUSTOMER = "INSERT INTO dbo.[Customer](customer_id,password,fullname,email,gender,dob,phone,status,address,ward_id) VALUES(?,?,?,?,?,?,?,?,?,?)";
    private static final String UPDATECUSTOMER = "UPDATE dbo.[Customer] SET password = ?, fullname = ?, email = ?, gender = ?, dob = ?, phone = ?, status = ?,address = ?, ward_id = ? where customer_id = ?";

    public List<CustomerDTO> GetListCustomer(List<ContractDTO> ContractList) throws SQLException {
        List<CustomerDTO> list = new ArrayList<>();
        for (ContractDTO i : ContractList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETALLCUSTOMER);
                    ptm.setString(1, i.getCustomerID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        String email = rs.getString("email");
                        String gender = rs.getString("gender");
                        Date dob = rs.getDate("dob");
                        String phone = rs.getString("phone");
                        String status = rs.getString("status");
                        String address = rs.getString("address");
                        String wardID = rs.getString("ward_id");
                        list.add(new CustomerDTO(i.getCustomerID(), password, fullname, email, gender, dob, phone, status, address, wardID));
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
        }
        return list;
    }

    public CustomerDTO loginCus(String email, String pass) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGINCUSTOMER);
                ptm.setString(1, email);
                ptm.setString(2, pass);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String CustomerID = rs.getString("customer_id");
                    String fullname = rs.getString("fullname");
                    String gender = rs.getString("gender");
                    Date dob = rs.getDate("dob");
                    String phone = rs.getString("phone");
                    String status = rs.getString("status");
                    String address = rs.getString("address");
                    String wardID = rs.getString("ward_id");
                    return new CustomerDTO(CustomerID, pass, fullname, email, gender, dob, phone, status, address, wardID);
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

        return null;
    }

    public List<CustomerDTO> GetListRoomMate(List<ContractDTO> ContractList) throws SQLException {
        List<CustomerDTO> list = new ArrayList<>();
        for (ContractDTO i : ContractList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETALLROOMMATE);
                    ptm.setString(1, i.getCustomerID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String password = rs.getString("password");
                        String fullname = rs.getString("fullname");
                        String email = rs.getString("email");
                        String gender = rs.getString("gender");
                        Date dob = rs.getDate("dob");
                        String phone = rs.getString("phone");
                        String status = rs.getString("status");
                        String address = rs.getString("address");
                        String wardID = rs.getString("ward_id");
                        list.add(new CustomerDTO(i.getCustomerID(), password, fullname, email, gender, dob, phone, status, address, wardID));
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
        }
        return list;
    }

    public CustomerDTO GetACustomer(String CustomerID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETALLCUSTOMER);
                ptm.setString(1, CustomerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String password = rs.getString("password");
                    String fullname = rs.getString("fullname");
                    String email = rs.getString("email");
                    String gender = rs.getString("gender");
                    Date dob = rs.getDate("dob");
                    String phone = rs.getString("phone");
                    String status = rs.getString("status");
                    String address = rs.getString("address");
                    String wardID = rs.getString("ward_id");
                    return new CustomerDTO(CustomerID, password, fullname, email, gender, dob, phone, status, address, wardID);
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
        return null;
    }

    public boolean AddCustomer(CustomerDTO Cus) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDCUSTOMER);
                ptm.setString(1, Cus.getCustomerID());
                ptm.setString(2, Cus.getPassword());
                ptm.setString(3, Cus.getFullname());
                ptm.setString(4, Cus.getEmail());
                ptm.setString(5, Cus.getGender());
                ptm.setDate(6, Cus.getDob());
                ptm.setString(7, Cus.getPhone());
                ptm.setString(8, Cus.getStatus());
                ptm.setString(9, Cus.getAddress());
                ptm.setString(10, Cus.getWardID());
                check = ptm.executeUpdate() > 0 ? true : false;
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

    public boolean UpdateCustomer(CustomerDTO C) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATECUSTOMER);
                ptm.setString(1, C.getPassword());
                ptm.setString(2, C.getFullname());
                ptm.setString(3, C.getEmail());
                ptm.setString(4, C.getGender());
                ptm.setDate(5, C.getDob());
                ptm.setString(6, C.getPhone());
                ptm.setString(7, C.getStatus());
                ptm.setString(8, C.getAddress());
                ptm.setString(9, C.getWardID());
                ptm.setString(10, C.getCustomerID());
                check = ptm.executeUpdate() > 0 ? true : false;
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
