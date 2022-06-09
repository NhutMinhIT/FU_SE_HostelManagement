/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.HostelDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author avillX
 */
public class HostelDAO {
    private final static String ALLHOSTEL = "Select * from dbo.Hostel WHERE user_id = ?";
    private final static String UPDATE = "UPDATE dbo.Hostel SET hostelname = ?, address = ?, phone = ? WHERE hostel_id = ?";
    private static final String DELETE = "DELETE dbo.Hostel WHERE hostel_id = ?";



public boolean updateHostel(HostelDTO p) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, p.getHostelname());
                ptm.setString(2, p.getAddress());
                ptm.setString(3, p.getPhone());
                ptm.setString(4, p.getHostelID());
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

    public boolean deleteHostel(String HostelID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, HostelID);
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
