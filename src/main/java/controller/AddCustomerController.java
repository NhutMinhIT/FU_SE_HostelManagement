/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ContractDAO;
import dao.CustomerDAO;
import dao.RoomDAO;
import dao.ServiceDAO;
import dto.ContractDTO;
import dto.CustomerDTO;
import dto.HostelDTO;
import dto.RoomDTO;
import dto.ServiceDetailDTO;
import dto.ServiceTypeDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author avillX
 */
@WebServlet(name = "AddCustomerController", urlPatterns = {"/AddCustomerController"})
@MultipartConfig
public class AddCustomerController extends HttpServlet {

    private static final String ERROR = "View/AddNewCustomer.jsp";
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
            UserDTO us =  (UserDTO) ss.getAttribute("LOGIN_USER");
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

            request.setAttribute("Room",room);
            request.setAttribute("CusList",CusList);   
            request.setAttribute("ServiceTypeList",ServiceList);
            request.setAttribute("HostelList",HostelList);
            request.setAttribute("ServiceDetailList",ServiceDetailList);         

        } catch (Exception e) {
            log("Error at AddCustomerController(doGet):"+e.toString());
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
            UserDTO us =  (UserDTO) ss.getAttribute("LOGIN_USER");

            String fullname = request.getParameter("fullname");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String customerID = request.getParameter("customerID");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String roomID = request.getParameter("roomID");
            String signed_date = request.getParameter("signed_date");

            String[] checked_DetailIDs = request.getParameterValues("choose");


        } catch (Exception e) {
            log("Error at AddCustomerController(doPost):"+e.toString());
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
