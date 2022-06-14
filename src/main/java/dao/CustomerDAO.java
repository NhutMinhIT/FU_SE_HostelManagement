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
    private final static String GETALLCUSTOMER = "SELECT * FROM dbo.[Customer] WHERE customer_id = ?";
    
    public List<CustomerDTO> GetListCustomer(List<ContractDTO> ContractList) throws SQLException {
        List<CustomerDTO> list = new ArrayList<>();
        for( ContractDTO i: ContractList){
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
                        Date dob = rs.getDate("dob");
                        String phone = rs.getString("phone");
                        String status = rs.getString("status");
                        String address = rs.getString("address");
                        list.add(new CustomerDTO(i.getCustomerID(),password,fullname,email,dob,phone,status,address));
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

}
