/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ContractDAO;
import dao.CustomerDAO;
import dao.RoomDAO;
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
@WebServlet(name = "UpdateHostelController", urlPatterns = {"/UpdateHostelController"})
public class UpdateHostelController extends HttpServlet {

    private static final String ERROR = "UserPageController";
    private static final String SUCCESS = "UserPageController";   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        String url = SUCCESS;
        try {
            HttpSession ss = request.getSession();
            UserDTO us =  (UserDTO) ss.getAttribute("LOGIN_USER");
            RoomDAO dao = new RoomDAO();

            String HostelID = request.getParameter("HostelID");

            HostelDTO Hostel = dao.GetAHostel(HostelID);

            request.setAttribute("Hostel",Hostel);            

        } catch (Exception e) {
            log("Error at UpdateHostelController(doGet):"+e.toString());
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
            String hostelID = request.getParameter("hostelID");
            String hostelname = request.getParameter("hostelname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String userID = request.getParameter("userID");

            RoomDAO dao = new RoomDAO();
            boolean check = dao.UpdateHostel(new HostelDTO(hostelID, hostelname, address, phone, userID));
            if (check) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at UpdateHostelController(doPost): " + e.toString());
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
