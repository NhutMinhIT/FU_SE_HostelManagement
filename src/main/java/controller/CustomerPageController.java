/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AddressDAO;
import dao.BillDAO;
import dao.ContractDAO;
import dao.CustomerDAO;
import dao.RoomDAO;
import dao.ServiceDAO;
import dto.Address.City;
import dto.Address.District;
import dto.Address.Ward;
import dto.BillDTO;
import dto.BillDetailDTO;
import dto.ContractDTO;
import dto.CustomerDTO;
import dto.HostelDTO;
import dto.RoomDTO;
import dto.ServiceDetailDTO;
import dto.ServiceTypeDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author avillX
 */
@WebServlet(name = "CustomerPageController", urlPatterns = {"/CustomerPageController"})
public class CustomerPageController extends HttpServlet {

    private static final String ERROR = "View/editCus.jsp";
    private static final String SUCCESS = "RoomPageController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");
            RoomDAO dao = new RoomDAO();
            CustomerDAO Cusdao = new CustomerDAO();
            ContractDAO Cdao = new ContractDAO();
            ServiceDAO SerDAO = new ServiceDAO();
            AddressDAO ad = new AddressDAO();
            BillDAO Bdao = new BillDAO();

            String CusID = request.getParameter("CusID");
            RoomDTO room = dao.GetARoom(request.getParameter("roomID"));

            List<ServiceTypeDTO> ServiceTypeList = SerDAO.GetListService();
            List<RoomDTO> Room = new ArrayList<>();
            Room.add(room);

            ContractDTO Contract = Cdao.GetAContract(CusID);
            HostelDTO Hostel = dao.GetAHostel(room.getHostelID());
            List<ContractDTO> ContractList = Cdao.GetListContract(Room);
            List<CustomerDTO> RoomMate = Cusdao.GetListRoomMate(ContractList);
            CustomerDTO Customer = Cusdao.GetACustomer(CusID);
            List<HostelDTO> HostelList = dao.GetListHostel(us.getUserID());
            List<ServiceDetailDTO> ServiceDetailList = SerDAO.GetListServiceDetail(HostelList);
            BillDTO bill = Bdao.Get_A_ProcessBill(CusID);
            int length = RoomMate.size();
            if (length == 0) {
                length = 1;
            }

            Ward wardID = ad.GetAWard(Customer.getWardID());
            District DistrictID = ad.GetADistrict(wardID.getDistrictID());
            City CityID = ad.GetACity(DistrictID.getCityID());
            String ward = ", " + wardID.getWardname() + ", " + DistrictID.getDistrictname() + ", " + CityID.getCityname();

            request.setAttribute("ServiceTypeList", ServiceTypeList);
            request.setAttribute("Contract", Contract);
            request.setAttribute("Hostel", Hostel);
            request.setAttribute("Customer", Customer);
            request.setAttribute("Room", room);
            request.setAttribute("RoomMate", RoomMate);
            request.setAttribute("Bill", bill);
            request.setAttribute("ServiceDetailList", ServiceDetailList);
            request.setAttribute("length", length);
            request.setAttribute("wardID", wardID.getWardID());
            request.setAttribute("ward", ward);

        } catch (Exception e) {
            log("Error at CustomerPageController(doGet):" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");
            CustomerDAO Cusdao = new CustomerDAO();
            ContractDAO Ctdao = new ContractDAO();
            RoomDAO dao = new RoomDAO();

            ServiceDAO Sdao = new ServiceDAO();
            BillDAO Bdao = new BillDAO();

            String fullname = request.getParameter("fullname");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String customerID = request.getParameter("customerID");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String wardID = request.getParameter("wardID");

            String roomID = request.getParameter("roomID");
            String signed_date = request.getParameter("signed_date");
            String due_date = request.getParameter("due_date");
            String description = request.getParameter("description");

            for (int i = 1; i <= 4; i++) {
                String Mem_customerID = request.getParameter("customerID" + i);
                String Mem_fullname = request.getParameter("fullname" + i);
                String Mem_gender = request.getParameter("gender" + i);
                String Mem_dob = request.getParameter("dob" + i);
                String Mem_phone = request.getParameter("phone" + i);
                String Mem_address = request.getParameter("address" + i);
                if (!Mem_customerID.isEmpty()) {
                    if (Cusdao.GetACustomer(Mem_customerID) != null) {
                        request.setAttribute("ERROR", "CMND/CCCD [" + Cusdao.GetACustomer(Mem_customerID).getCustomerID() + "] đã được đăng ký !");
                    } else {
                        Cusdao.AddCustomer(new CustomerDTO(Mem_customerID, "", Mem_fullname, "", Mem_gender, Date.valueOf(Mem_dob), Mem_phone, "MEMBER", Mem_address, wardID));
                        Ctdao.AddContract(new ContractDTO("", Mem_customerID, roomID, Date.valueOf(signed_date), Date.valueOf(due_date), "MEMBER", ""));
                    }
                }
            }

            boolean AddCus = Cusdao.UpdateCustomer(new CustomerDTO(customerID, "", fullname, email, gender, Date.valueOf(dob), phone, "ACTIVE", address, wardID));
            boolean AddContract = Ctdao.UpdateContract(new ContractDTO("", customerID, roomID, Date.valueOf(signed_date), Date.valueOf(due_date), "ACTIVE", description));

            //Service----------------------------------------------------------------
            String[] checked_DetailIDs = request.getParameterValues("chooseDetail");
            List<BillDetailDTO> BillDetail_list = new ArrayList<>();
            if (checked_DetailIDs.length > 0) {
                for (int i = 0; i < checked_DetailIDs.length; i++) {
                    ServiceDetailDTO current = Sdao.GetAServiceDetail(Integer.valueOf(checked_DetailIDs[i]));
                    boolean check = Bdao.CHECK_BillDetail(Integer.valueOf(checked_DetailIDs[i]));
                    if (!check) {
                        int number = 1;
                        if (current.getServiceID() == 1 || current.getServiceID() == 2) {
                            number = 0;
                        }
                        BillDetail_list.add(new BillDetailDTO(i, current, number, current.getUnit_price() * number));
                    }
                }
            }

            BillDTO currentBill = Bdao.Get_A_ProcessBill(customerID);
            for (BillDetailDTO dList : BillDetail_list) {
                Bdao.AddBillDetail(dList, currentBill.getBillID());
            }
            //-------------------------------------------------------------------------
            if (AddCus) {
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at AddCustomerController(doPost):" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
