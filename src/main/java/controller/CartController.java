/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.BillDAO;
import dao.ContractDAO;
import dao.CustomerDAO;
import dao.RoomDAO;
import dto.BillDTO;
import dto.BillDetailDTO;
import dto.ContractDTO;
import dto.CustomerDTO;
import dto.HostelDTO;
import dto.RoomDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private static final String ERROR = "View/ManagerActivitie1.jsp";
    private static final String SUCCESS = "MainController?action=CartPage";

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
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");
            RoomDAO dao = new RoomDAO();
            CustomerDAO Cusdao = new CustomerDAO();
            ContractDAO Cdao = new ContractDAO();
            BillDAO Bdao = new BillDAO();

            List<HostelDTO> HostelList = dao.GetListHostel(us.getUserID());
            List<RoomDTO> RoomList = dao.GetListRoom(HostelList);
            List<ContractDTO> ContractList = Cdao.GetListContract(RoomList);
            List<CustomerDTO> CusList = Cusdao.GetListCustomer(ContractList);

            List<BillDTO> BillList_COMPLETE = Bdao.GetListBill_COMPLETE(CusList);
            List<BillDTO> BillList_PROCESS = Bdao.GetListBill_PROCESS(CusList);

            request.setAttribute("HostelList", HostelList);
            request.setAttribute("RoomList", RoomList);
            request.setAttribute("ContractList", ContractList);
            request.setAttribute("CusList", CusList);
            request.setAttribute("CompleteList", BillList_COMPLETE);
            request.setAttribute("ProcessList", BillList_PROCESS);

        } catch (Exception e) {
            log("Error at RoomPageController:" + e.toString());
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
        processRequest(request, response);
        
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
