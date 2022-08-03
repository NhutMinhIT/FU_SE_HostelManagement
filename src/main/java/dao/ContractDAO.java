/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.ContractDTO;
import dto.CustomerDTO;
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
public class ContractDAO {

    private final static String GETCONTRACT = "SELECT * FROM dbo.[Contract] WHERE room_id = ?";
    private final static String GETACONTRACT = "SELECT * FROM dbo.[Contract] WHERE customer_id = ?";
    private final static String ADDCONTRACT = "INSERT INTO dbo.[Contract](customer_id,room_id,signed_date,due_date,status,description) VALUES(?,?,?,?,?,?)";
    private final static String UPDATECONTRACT = "UPDATE dbo.[Contract] SET customer_id = ?, room_id = ?, signed_date = ?, due_date = ?, status = ?, description = ? where contract_id = ?";

    public List<ContractDTO> GetListContract(List<RoomDTO> roomList) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        for (RoomDTO i : roomList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETCONTRACT);
                    ptm.setString(1, i.getRoomID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String contractID = rs.getString("contract_id");
                        String customerID = rs.getString("customer_id");
                        Date signed_date = rs.getDate("signed_date");
                        Date due_date = rs.getDate("due_date");
                        String status = rs.getString("status");
                        String description = rs.getString("description");
                        list.add(new ContractDTO(contractID, customerID, i.getRoomID(), signed_date, due_date, status, description));
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

    public boolean UpdateContract(ContractDTO C) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATECONTRACT);
                ptm.setString(1, C.getCustomerID());
                ptm.setInt(2, Integer.parseInt(C.getRoomID()));
                ptm.setDate(3, C.getSigned_date());
                ptm.setDate(4, C.getDue_date());
                ptm.setString(5, C.getStatus());
                ptm.setString(6, C.getDescription());
                ptm.setString(7, C.getContractID());
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

    public ContractDTO GetAContract(String CustomerID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETACONTRACT);
                ptm.setString(1, CustomerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String contractID = rs.getString("contract_id");
                    String roomID = rs.getString("room_id");
                    Date signed_date = rs.getDate("signed_date");
                    Date due_date = rs.getDate("due_date");
                    String status = rs.getString("status");
                    String description = rs.getString("description");
                    return new ContractDTO(contractID, CustomerID, roomID, signed_date, due_date, status, description);
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

    public boolean AddContract(ContractDTO Ct) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDCONTRACT);
                ptm.setString(1, Ct.getCustomerID());
                ptm.setString(2, Ct.getRoomID());
                ptm.setDate(3, Ct.getSigned_date());
                ptm.setDate(4, Ct.getDue_date());
                ptm.setString(5, Ct.getStatus());
                ptm.setString(6, Ct.getDescription());
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
