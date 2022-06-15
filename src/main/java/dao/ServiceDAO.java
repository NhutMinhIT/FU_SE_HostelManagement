/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.ContractDTO;
import dto.HostelDTO;
import dto.RoomDTO;
import dto.ServiceDTO;
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
public class ServiceDAO {

    private final static String GETSERVICE = "SELECT * FROM dbo.[Service] WHERE hostel_id = ?";
    private static final String ADDSERVICE = "INSERT INTO dbo.[Service](service_id, service_name, unit_price, updated_date, description, hostel_id) VALUES(?,?,?,?,?)";

    public List<ServiceDTO> GetListService(List<HostelDTO> roomList) throws SQLException {
        List<ServiceDTO> list = new ArrayList<>();
        for( HostelDTO i: roomList){
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETSERVICE);
                    ptm.setString(1, i.getHostelID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String service_id = rs.getString("service_id");
                        String service_name = rs.getString("service_name");
                        Double unit_price = rs.getDouble("unit_price");
                        Date updated_date = rs.getDate("due_date");
                        String description = rs.getString("description");
                        list.add(new ServiceDTO(service_id,service_name,unit_price,updated_date,description,i.getHostelID()));
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
