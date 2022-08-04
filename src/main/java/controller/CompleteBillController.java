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
import dto.BillDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "CompleteBillController", urlPatterns = {"/CompleteBillController"})
public class CompleteBillController extends HttpServlet {

    private static final String ERROR = "BillPageController";

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
        processRequest(request, response);
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
            RoomDAO dao = new RoomDAO();
            CustomerDAO Cusdao = new CustomerDAO();
            ContractDAO Cdao = new ContractDAO();
            ServiceDAO SerDAO = new ServiceDAO();
            AddressDAO ad = new AddressDAO();
            BillDAO Bdao = new BillDAO();

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dtf.format(now);

            String customerID = request.getParameter("billID");
            BillDTO B = Bdao.Get_A_ProcessBill_billid(Integer.parseInt(customerID));
            B.setStatus("COMPLETE");
            B.setEnd_date(Date.valueOf(currentDate));
            boolean b = Bdao.UpdateBill(B);

        } catch (Exception e) {
            log("Error at CustomerPageController(doGet):" + e.toString());
        } finally {
            response.sendRedirect(url);
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
