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
public class RoomDAO {
    private static final String GETHOSTEL = "SELECT * FROM dbo.Hostel where user_id = ? AND status Not IN ('DISABLED')";
    private static final String GETROOM = "SELECT * FROM dbo.[Room] where hostel_id = ? AND status Not IN ('DISABLED') ORDER BY room_number";

    private static final String GETAHOSTEL = "SELECT * FROM dbo.[Hostel] where hostel_id = ?";
    private static final String GETAROOM = "SELECT * FROM dbo.[Room] where room_id = ?";

    private static final String ADDROOM = "INSERT INTO dbo.[Room](hostel_id, room_number, price, description, status) VALUES(?,?,?,?,?)";
    private static final String ADDHOSTEL = "INSERT INTO dbo.[Hostel](hostel_name, address, phone,status, user_id, ward_id) VALUES(?,?,?,'ACTIVE',?,?)";

    private static final String UPDATEROOM = "UPDATE dbo.[Room] SET hostel_id = ?, room_number = ?, price = ?, description = ?, status = ? where room_id = ?";
    private static final String UPDATEHOSTEL = "UPDATE dbo.[Hostel] SET hostel_name = ?, address = ?, phone = ?, ward_id = ? where hostel_id =?"; 

    private static final String DELETEROOM = "UPDATE dbo.[Room] SET status ='DISABLED' WHERE room_id = ?";
    private static final String DELETEHOSTEL = "UPDATE dbo.[Hostel] SET status ='DISABLED' WHERE hostel_id = ?";

    private static final String COUNT_HOSTEL = "SELECT COUNT(hostel_id) + 1 FROM dbo.[Hostel]";
    private static final String COUNT_ROOM = "SELECT COUNT(room_id) + 1 FROM dbo.[Room]";

    public List<HostelDTO> GetListHostel(String userID) throws SQLException {
        List<HostelDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETHOSTEL);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String HostelID = rs.getString("hostel_id");
                    String HostelName = rs.getString("hostel_name");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String wardID = rs.getString("ward_id");
                    list.add(new HostelDTO(HostelID,HostelName,address,phone,userID,wardID));
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
        return list;
    }

    public List<RoomDTO> GetListRoom(List<HostelDTO> HostelList) throws SQLException {
        List<RoomDTO> list = new ArrayList<>();

        for( HostelDTO i: HostelList){
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;

            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETROOM);
                    ptm.setString(1, i.getHostelID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String RoomID = rs.getString("room_id");
                        String roomNumber = rs.getString("room_number");
                        Double price = rs.getDouble("price");
                        String description = rs.getString("description");
                        String status = rs.getString("status");
                        list.add(new RoomDTO(RoomID,i.getHostelID(),roomNumber,price,description,status));
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

    public HostelDTO GetAHostel(String HostelID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETAHOSTEL);
                ptm.setString(1, HostelID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String HostelName = rs.getString("hostel_name");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String userID = rs.getString("user_id");                   
                    String wardID = rs.getString("ward_id");
                    return new HostelDTO(HostelID,HostelName,address,phone,userID,wardID);
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

    public RoomDTO GetARoom(String RoomID) throws SQLException {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETAROOM);
                    ptm.setString(1, RoomID);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String HostelID = rs.getString("hostel_id");
                        String roomNumber = rs.getString("room_number");
                        Double price = rs.getDouble("price");
                        String description = rs.getString("description");
                        String status = rs.getString("status");
                        return new RoomDTO(RoomID,HostelID,roomNumber,price,description,status);
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
    public boolean DeleteHostel(String HostelID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETEHOSTEL);
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
    public boolean DeleteRoom(String RoomID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETEROOM);
                ptm.setString(1, RoomID);
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

    public boolean UpdateRoom(RoomDTO Room) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEROOM);
                ptm.setString(1, Room.getHostelID());
                ptm.setString(2, Room.getRoomnumber());
                ptm.setDouble(3, Room.getPrice());
                ptm.setString(4, Room.getDescription());
                ptm.setString(5, Room.getStatus());
                ptm.setString(6, Room.getRoomID());
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
    public boolean UpdateHostel(HostelDTO Hostel) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEHOSTEL);
                ptm.setString(1, Hostel.getHostelname());
                ptm.setString(2, Hostel.getAddress());
                ptm.setString(3, Hostel.getPhone());
                ptm.setString(4, Hostel.getHostelID());
                ptm.setString(5, Hostel.getWardID());
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
    public boolean AddRoom(RoomDTO room) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDROOM);
                ptm.setString(1, room.getHostelID());
                ptm.setString(2, room.getRoomnumber());
                ptm.setDouble(3, room.getPrice());
                ptm.setString(4, room.getDescription());
                ptm.setString(5, room.getStatus());
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
    public boolean AddHostel(HostelDTO h) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDHOSTEL);
                ptm.setString(1, h.getHostelname());
                ptm.setString(2, h.getAddress());
                ptm.setString(3, h.getPhone());
                ptm.setString(4, h.getUserID());
                ptm.setString(5, h.getWardID());
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

    public int CountHostel(){     
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;  
        try{
            String query = COUNT_HOSTEL;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){}
        return 0;
    }

    public int CountRoom(){     
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;  
        try{
            String query = COUNT_ROOM;
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        }catch(Exception e){}
        return 0;
    }


    public static void main(String[] args) throws SQLException {
    try{
        List<CustomerDTO> Cus = new ArrayList<>();
        List <ContractDTO> Contract = new ArrayList<>();
        List<RoomDTO> room = new ArrayList<>();
        RoomDAO dao = new RoomDAO();
        CustomerDAO Cusdao = new CustomerDAO();
        ContractDAO Contractdao = new ContractDAO();

        RoomDTO d = dao.GetARoom("1");
        HostelDTO h = dao.GetAHostel(d.getHostelID());

        System.out.println(d.getRoomnumber());
        System.out.println(h.getHostelname());
    }catch(Exception ex){}
//        List<HostelDTO> list = dao.GetListHostel("1");
//        room = dao.GetListRoom(list);
//        Contract = Contractdao.GetListContract(room);
//        Cus = Cusdao.GetListCustomer(Contract);
//
//        for(ContractDTO w : Contract){
//            System.out.println(w.getContractID());
//        }
//        for(CustomerDTO w : Cus){
//            System.out.println(w.getFullname());
//        }
//        ProductSize list = dao.getProductAllSize("1");
////        for(Product o :list){
//            System.out.println(list);
        }
        
    }

