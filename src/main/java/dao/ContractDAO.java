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
    
    public List<ContractDTO> GetListContract(List<RoomDTO> roomList) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        for( RoomDTO i: roomList){
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
                        list.add(new ContractDTO(contractID,customerID,i.getRoomID(),signed_date,due_date,status,description));
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
