package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dao.AddressDAO;
import dao.RoomDAO;
import dto.Address.City;
import dto.Address.District;
import dto.Address.Ward;
import dto.HostelDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AddHostelController", urlPatterns = {"/AddHostelController"})
public class AddHostelController extends HttpServlet {

    private static final String ERROR = "View/addNewHostel.jsp";
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
        String url = ERROR;
        try {

        } catch (Exception e) {
            log("Error at AddHostelController(doGet): " + e.toString());
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
        String url = SUCCESS;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");
            AddressDAO ad = new AddressDAO();

            String hostelname = request.getParameter("hostelname");
            String wardID = request.getParameter("wardID");

            RoomDAO dao = new RoomDAO();
            int hostelID = dao.CountHostel();
            Ward wwardID = ad.GetAWard(wardID);
            District DistrictID = ad.GetADistrict(wwardID.getDistrictID());
            City CityID = ad.GetACity(DistrictID.getCityID());
            String address = request.getParameter("address") + ", " + wwardID.getWardname() + ", " + DistrictID.getDistrictname() + ", " + CityID.getCityname();
            boolean check = dao.AddHostel(new HostelDTO(String.valueOf(hostelID), hostelname, address, us.getPhone(), us.getUserID(), wardID));
            if (check) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AddHostelController(doPost): " + e.toString());
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
