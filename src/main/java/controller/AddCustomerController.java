/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BillDAO;
import dao.ContractDAO;
import dao.CustomerDAO;
import dao.RoomDAO;
import dao.ServiceDAO;
import dao.UserDAO;
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
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author avillX
 */
@MultipartConfig
@WebServlet(name = "AddCustomerController", urlPatterns = {"/AddCustomerController"})
public class AddCustomerController extends HttpServlet {

    private static final String ERROR = "View/AddNewCustomer.jsp";
    private static final String SUCCESS = "MainController?action=RoomPage";

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

            List<HostelDTO> HostelList = dao.GetListHostel(us.getUserID());
            List<RoomDTO> RoomList = dao.GetListRoom(HostelList);
            List<ContractDTO> ContractList = Cdao.GetListContract(RoomList);
            List<CustomerDTO> CusList = Cusdao.GetListCustomer(ContractList);
            List<ServiceTypeDTO> ServiceList = SerDAO.GetListService();
            List<ServiceDetailDTO> ServiceDetailList = SerDAO.GetListServiceDetail(HostelList);

            RoomDTO room = dao.GetARoom(request.getParameter("RoomID"));
            HostelDTO hostel = dao.GetAHostel(room.getHostelID());
            request.setAttribute("Room", room);
            request.setAttribute("CusList", CusList);
            request.setAttribute("ServiceTypeList", ServiceList);
            request.setAttribute("Hostel", hostel);
            request.setAttribute("HostelList", HostelList);
            request.setAttribute("ServiceDetailList", ServiceDetailList);

        } catch (Exception e) {
            log("Error at AddCustomerController(doGet):" + e.toString());
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
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");
            CustomerDAO Cusdao = new CustomerDAO();
            ContractDAO Ctdao = new ContractDAO();
            RoomDAO dao = new RoomDAO();
            UserDAO user = new UserDAO();

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

            if (Cusdao.GetACustomer(customerID) != null) {
                request.setAttribute("ERROR", "CMND/CCCD [" + Cusdao.GetACustomer(customerID).getCustomerID() + "] đã được đăng ký !");
            } else {
                boolean AddCus = Cusdao.AddCustomer(new CustomerDTO(customerID, "1", fullname, email, gender, Date.valueOf(dob), phone, "ACTIVE", address, wardID));
                boolean AddContract = Ctdao.AddContract(new ContractDTO("", customerID, roomID, Date.valueOf(signed_date), Date.valueOf(due_date), "ACTIVE", description));
               

////                Part part = request.getPart("contract");
////                String realPath = request.getServletContext().getRealPath("assets/img/contract");
////                String filename = customerID;
////                if (!Files.exists(Paths.get(realPath))) {
////                    Files.createDirectories(Paths.get(realPath));
////                }
//                part.write(realPath + "/" + filename);
                RoomDTO room = dao.GetARoom(roomID);
                room.setStatus("RENTING");
                boolean UpdateRoom = dao.UpdateRoom(room);

                //Service----------------------------------------------------------------
                String[] checked_DetailIDs = request.getParameterValues("chooseDetail");
                List<BillDetailDTO> BillDetail_list = new ArrayList<>();
                if (checked_DetailIDs.length > 0) {
                    for (int i = 0; i < checked_DetailIDs.length; i++) {
                        ServiceDetailDTO current = Sdao.GetAServiceDetail(Integer.valueOf(checked_DetailIDs[i]));
                        int number = 1;
                        if (current.getServiceID() == 1 || current.getServiceID() == 2) {
                            number = 0;
                        }
                        BillDetail_list.add(new BillDetailDTO(i, current, number, current.getUnit_price() * number));
                    }
                }
                Date nullDate = null;
                Bdao.AddBill(new BillDTO(0, customerID, 0.0, Date.valueOf(signed_date), nullDate, nullDate, "PROCESS", BillDetail_list));
                BillDTO currentBill = Bdao.Get_A_ProcessBill(customerID);
                for (BillDetailDTO dList : BillDetail_list) {
                    Bdao.AddBillDetail(dList, currentBill.getBillID());
                }
                //-------------------------------------------------------------------------
                if (AddCus) {
                    url = SUCCESS;
                }
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
