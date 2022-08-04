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

    private static final String GETBILL_LIST = "SELECT * FROM dbo.[Bill] WHERE customer_id = ?";
    private static final String GETBILLBYSTATUS_LIST = "SELECT * FROM dbo.[Bill] WHERE customer_id = ? AND status = ?";
    private static final String GETBILL_LASTEST_COMPLETE = "SELECT TOP (1) * FROM dbo.Bill WHERE customer_id = ? AND status = 'COMPLETE' ORDER BY bill_id DESC ";
    private static final String GETBILL_LASTEST_PROCESS = "SELECT TOP (1) * FROM dbo.Bill WHERE customer_id = ? AND status = 'PROCESS' ORDER BY bill_id DESC ";
    private static final String GETBILL_LASTEST_CHECKOUT = "SELECT TOP (1) * FROM dbo.Bill WHERE customer_id = ? AND status = 'CHECKOUT' ORDER BY bill_id DESC ";
    private static final String GETBILL_LASTEST_PROCESS_BillID = "SELECT TOP (1) * FROM dbo.Bill WHERE bill_id = ? AND status = 'PROCESS' ORDER BY bill_id DESC ";

    private static final String GETCURRENTBILLDETAIL_ELEMENT = "SELECT TOP (1) * FROM dbo.[BillDetail] WHERE bill_id = ? AND detail_id = ? ORDER BY billd_id DESC ";
    private static final String GETBILLDETAIL_LIST = "SELECT * FROM dbo.[BillDetail] WHERE bill_id = ?";
    private static final String GETBILLDETAIL_SERVICEID = "SELECT * FROM dbo.[BillDetail] WHERE detail_id = ?";

    private static final String ADDBILL = "INSERT INTO dbo.[Bill]([customer_id],[total],[start_date],[end_date],[created],[status]) VALUES(?,?,?,?,?,'PROCESS')";
    private static final String ADDBILLDETAIL = "INSERT INTO dbo.[BillDetail]([bill_id],[detail_id],[qty],[total]) VALUES(?,?,?,?)";

    private static final String UPDATEBILL = "UPDATE dbo.[Bill] SET customer_id = ?, total = ?, start_date = ?, end_date = ?, created = ?, status = ? where bill_id = ?";
    private static final String UPDATEBILLDETAIL = "UPDATE dbo.[BillDetail] SET bill_id = ?, detail_id = ?, qty = ?, total = ? where billd_id = ?";

    public List<BillDTO> GetListBill(List<CustomerDTO> CusList) throws SQLException {
        List<BillDTO> list = new ArrayList<>();
        RoomDAO dao = new RoomDAO();
        ContractDAO Cdao = new ContractDAO();
        for (CustomerDTO i : CusList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETBILL_LIST);
                    ptm.setString(1, i.getCustomerID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        List<BillDetailDTO> DetailList = new ArrayList<>();
                        int BillID = rs.getInt("bill_id");
                        String customerID = rs.getString("customer_id");
                        Date start = rs.getDate("start_date");
                        Date end = rs.getDate("end_date");
                        Date created = rs.getDate("created");
                        String status = rs.getString("status");
                        ContractDTO Con = Cdao.GetAContract(customerID);
                        RoomDTO room = dao.GetARoom(Con.getRoomID());
                        DetailList = this.GetListBillDetail(BillID);
                        Double total = room.getPrice();
                        for (BillDetailDTO dList : DetailList) {
                            total += dList.getTotal();
                        }
                        list.add(new BillDTO(BillID, customerID, total, start, end, created, status, DetailList));
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

    public BillDTO Get_A_ProcessBill_billid(int BillID) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETBILL_LASTEST_PROCESS_BillID);
                ptm.setInt(1, BillID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String CustomerID = rs.getString("customer_id");
                    Date start = rs.getDate("start_date");
                    Date end = rs.getDate("end_date");
                    Date created = rs.getDate("created");
                    String status = rs.getString("status");
                    Double total = 0.0;
                    List<BillDetailDTO> DetailList = this.GetListBillDetail(BillID);
                    for (BillDetailDTO dList : DetailList) {
                        total += dList.getTotal();
                    }
                    return new BillDTO(BillID, CustomerID, total, start, end, created, status, DetailList);
                }
            }
        } catch (Exception e) {
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

    public List<BillDTO> GetListBill_COMPLETE(List<CustomerDTO> CusList) throws SQLException {
        List<BillDTO> list = new ArrayList<>();
        for (CustomerDTO i : CusList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETBILL_LASTEST_COMPLETE);
                    ptm.setString(1, i.getCustomerID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        List<BillDetailDTO> DetailList = new ArrayList<>();
                        int BillID = rs.getInt("bill_id");
                        String customerID = rs.getString("customer_id");
                        Date start = rs.getDate("start_date");
                        Date end = rs.getDate("end_date");
                        Date created = rs.getDate("created");
                        String status = rs.getString("status");

                        DetailList = this.GetListBillDetail(BillID);
                        Double total = 0.0;
                        for (BillDetailDTO dList : DetailList) {
                            total += dList.getTotal();
                        }
                        list.add(new BillDTO(BillID, customerID, total, start, end, created, status, DetailList));
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

    public List<BillDTO> GetListBill_PROCESS(List<CustomerDTO> CusList) throws SQLException {
        List<BillDTO> list = new ArrayList<>();
        for (CustomerDTO i : CusList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETBILL_LASTEST_PROCESS);
                    ptm.setString(1, i.getCustomerID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        List<BillDetailDTO> DetailList = new ArrayList<>();
                        int BillID = rs.getInt("bill_id");
                        String customerID = rs.getString("customer_id");
                        Date start = rs.getDate("start_date");
                        Date end = rs.getDate("end_date");
                        Date created = rs.getDate("created");
                        String status = rs.getString("status");

                        DetailList = this.GetListBillDetail(BillID);
                        Double total = 0.0;
                        for (BillDetailDTO dList : DetailList) {
                            total += dList.getTotal();
                        }
                        list.add(new BillDTO(BillID, customerID, total, start, end, created, status, DetailList));
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

    public List<BillDTO> GetListBill_CHECKOUT(List<CustomerDTO> CusList) throws SQLException {
        List<BillDTO> list = new ArrayList<>();
        for (CustomerDTO i : CusList) {
            Connection conn = null;
            PreparedStatement ptm = null;
            ResultSet rs = null;
            try {
                conn = DBUtils.getConnection();
                if (conn != null) {
                    ptm = conn.prepareStatement(GETBILL_LASTEST_CHECKOUT);
                    ptm.setString(1, i.getCustomerID());
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        List<BillDetailDTO> DetailList = new ArrayList<>();
                        int BillID = rs.getInt("bill_id");
                        String customerID = rs.getString("customer_id");
                        Date start = rs.getDate("start_date");
                        Date end = rs.getDate("end_date");
                        Date created = rs.getDate("created");
                        String status = rs.getString("status");

                        DetailList = this.GetListBillDetail(BillID);
                        Double total = 0.0;
                        for (BillDetailDTO dList : DetailList) {
                            total += dList.getTotal();
                        }
                        list.add(new BillDTO(BillID, customerID, total, start, end, created, status, DetailList));
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
                    int BillID = rs.getInt("bill_id");
                    Date start = rs.getDate("start_date");
                    Date end = rs.getDate("end_date");
                    Date created = rs.getDate("created");
                    String status = rs.getString("status");
                    Double total = 0.0;
                    List<BillDetailDTO> DetailList = this.GetListBillDetail(BillID);
                    for (BillDetailDTO dList : DetailList) {
                        total += dList.getTotal();
                    }
                    return new BillDTO(BillID, CustomerID, total, start, end, created, status, DetailList);
                }
            }
        } catch (Exception e) {
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

    public boolean CHECK_BillDetail(int detailid) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETBILLDETAIL_SERVICEID);
                ptm.setInt(1, detailid);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
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
        return false;
    }

    public List<BillDetailDTO> GetListBillDetail(int BillID) throws SQLException {
        List<BillDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETBILLDETAIL_LIST);
                ptm.setInt(1, BillID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int BillDetailID = rs.getInt("billd_id");
                    ServiceDAO dao = new ServiceDAO();
                    ServiceDetailDTO DetailID = dao.GetAServiceDetail(rs.getInt("detail_id"));
                    int qty = rs.getInt("qty");
                    Double total = rs.getDouble("total");
                    list.add(new BillDetailDTO(BillDetailID, DetailID, qty, total));
                }
            }
        } catch (Exception e) {
            e.getMessage();
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

    public boolean AddBillDetail(BillDetailDTO b, int billID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADDBILLDETAIL);
                ptm.setInt(1, billID);
                ptm.setInt(2, b.getService().getDetailID());
                ptm.setInt(3, b.getQty());
                ptm.setDouble(4, b.getTotal());
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
                ptm.setInt(7, b.getBillID());
                for (BillDetailDTO dList : b.getDetails()) {
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

    public boolean UpdateBillDetail(BillDetailDTO b, int billID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATEBILLDETAIL);
                ptm.setInt(1, billID);
                ptm.setInt(2, b.getService().getDetailID());
                ptm.setInt(3, b.getQty());
                ptm.setDouble(4, b.getTotal());
                ptm.setInt(5, b.getBilldetailID());
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
        try {
            RoomDAO dao = new RoomDAO();
            CustomerDAO Cusdao = new CustomerDAO();
            ContractDAO Cdao = new ContractDAO();
            BillDAO Bdao = new BillDAO();
            ServiceDAO Sdao = new ServiceDAO();

//            List<HostelDTO> HostelList = dao.GetListHostel("1");
//            List<RoomDTO> RoomList = dao.GetListRoom(HostelList);
//            List<ContractDTO> ContractList = Cdao.GetListContract(RoomList);
//            List<CustomerDTO> CusList = Cusdao.GetListCustomer(ContractList);
//            List<BillDTO> BillList = Bdao.GetListBill(CusList);
//
////            List<BillDetailDTO> list = Bdao.GetListBillDetail(3);
////            for (BillDetailDTO B : list) {
////                System.out.println(B.getBilldetailID()+", "+B.getService());
////            }
////            for (BillDetailDTO B : Bill.getDetails()) {
////                System.out.println(B.getService().getDetailname()+ ", ");
////            }
            BillDTO Bil = Bdao.Get_A_ProcessBill("312469817");
            ServiceDetailDTO current = Sdao.GetAServiceDetail(12012);
            BillDetailDTO BD = new BillDetailDTO(1, current, 0, 0.0);
            Bdao.AddBillDetail(BD, Bil.getBillID());
            Bdao.GetListBillDetail(Bil.getBillID());

            System.out.println(Bil.getBillID() + ", Price: " + Bil.getTotal());
            System.out.print("     ");
            for (BillDetailDTO BL : Bil.getDetails()) {

                System.out.print(BL.getService().getDetailID() + ", ");
            }
            System.out.println();
        } catch (Exception ex) {
        }

    }
}
