/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.BillDTO;
import dto.BillDetailDTO;
import dto.ContractDTO;
import dto.CustomerDTO;
import dto.HostelDTO;
import dto.RoomDTO;
import dto.ServiceDetailDTO;
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
public class BillDAO {
    private static final String GETBILLBYSTATUS_LIST = "SELECT * FROM dbo.[Bill] WHERE customer_id = ? AND status = ?";
    private static final String GETBILL_LASTEST_COMPLETE = "SELECT TOP (1) * FROM dbo.Bill WHERE customer_id = ? AND status = 'COMPLETE' ORDER BY bill_id DESC ";
    private static final String GETBILL_LASTEST_PROCESS = "SELECT TOP (1) * FROM dbo.Bill WHERE customer_id = ? AND status = 'PROCESS' ORDER BY bill_id DESC ";

    private static final String GETCURRENTBILLDETAIL_ELEMENT = "SELECT TOP (1) * FROM dbo.[BillDetail] WHERE bill_id = ? AND detail_id = ? ORDER BY billd_id DESC ";
    private static final String GETBILLDETAIL_LIST = "SELECT * FROM dbo.[BillDetail] WHERE bill_id = ?";

    private static final String ADDBILL = "INSERT INTO dbo.[Bill]([customer_id],[total],[start_date],[end_date],[created],[status]) VALUES(?,?,?,?,?,'PROCESSING')";
    private static final String ADDBILLDETAIL = "INSERT INTO dbo.[BillDetail]([bill_id],[detail_id],[qty],[total],[description]) VALUES(?,?,?,?,?)";

    private static final String UPDATEBILL = "UPDATE dbo.[Bill] SET customer_id = ?, total = ?, start_date = ?, end_date = ?, created = ?, status = ? where bill_id = ?";
    private static final String UPDATEBILLDETAIL = "UPDATE dbo.[BillDetail] SET bill_id = ?, detail_id = ?, qty = ?, total = ?, description = ? where billd_id = ?";



    public BillDTO Get_A_ProcessBill(String CustomerID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETBILL_LASTEST_PROCESS);
                ptm.setString(1, CustomerID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String BillID = rs.getString("bill_id");
                    Date start = rs.getDate("start_date");
                    Date end = rs.getDate("end_date");
                    Date created = rs.getDate("created");
                    String status = rs.getString("status");
                    Double total = 0.0;
                    List<BillDetailDTO> DetailList = this.GetListBillDetail(BillID);
                    for (BillDetailDTO dList : DetailList){
                        total += dList.getTotal();
                    }
                    return new BillDTO(BillID,CustomerID,total,start,end,created,status,DetailList);
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
    public List<BillDetailDTO> GetListBillDetail(String BillID) throws SQLException {
        List<BillDetailDTO> list = new ArrayList<>();
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;

            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETBILLDETAIL_LIST);
                    ptm.setString(1, BillID);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        String BillDetailID = rs.getString("billd_id");
                        ServiceDAO dao = new ServiceDAO();
                        ServiceDetailDTO DetailID = dao.GetAServiceDetail(rs.getInt("detail_id"));
                        int qty = rs.getInt("qty");
                        Double total = DetailID.getUnit_price() * qty ;
                        String description = rs.getString("description");
                        list.add(new BillDetailDTO(BillDetailID,DetailID,qty,total,description));
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

    public boolean AddBill(BillDTO b) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDBILL);
                ptm.setString(1, b.getCustomerID());
                ptm.setDouble(2, b.getTotal());
                ptm.setDate(3, b.getStart_date());
                ptm.setDate(4, b.getEnd_date());
                ptm.setDate(5, b.getCreated());
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

    public boolean AddBillDetail(BillDetailDTO b, String billID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDBILLDETAIL);
                ptm.setString(1, billID);
                ptm.setInt(2, b.getService().getDetailID());
                ptm.setInt(3, b.getQty());
                ptm.setDouble(4, b.getTotal());
                ptm.setString(5, b.getDescription());
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

    public boolean UpdateBill(BillDTO b) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEBILL);
                ptm.setString(1, b.getCustomerID());
                ptm.setDouble(2, b.getTotal());
                ptm.setDate(3, b.getStart_date());
                ptm.setDate(4, b.getEnd_date());
                ptm.setDate(5, b.getCreated());
                ptm.setString(6, b.getStatus());
                ptm.setString(7, b.getBillID());
                for (BillDetailDTO dList : b.getDetails()){
                    this.UpdateBillDetail(dList, b.getBillID());
                }
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
    public boolean UpdateBillDetail(BillDetailDTO b, String billID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEBILLDETAIL);
                ptm.setString(1, billID);
                ptm.setInt(2, b.getService().getDetailID());
                ptm.setInt(3, b.getQty());
                ptm.setDouble(4, b.getTotal());
                ptm.setString(5, b.getDescription());
                ptm.setString(6, b.getBilldetailID());
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

    public static void main(String[] args) throws SQLException {
    try{
        List<BillDetailDTO> Des = new ArrayList<>();
        ServiceDAO dao = new ServiceDAO();
        BillDAO Bdao = new BillDAO();
        BillDTO b = Bdao.Get_A_ProcessBill("312469817");
        System.out.println(b.getBillID()+" "+b.getTotal());
        for (BillDetailDTO dList : b.getDetails()){
        System.out.println(dList.getBilldetailID()+"  "+dList.getQty()+" "+dList.getService().getUnit_price()+" "+dList.getTotal());
        }


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


