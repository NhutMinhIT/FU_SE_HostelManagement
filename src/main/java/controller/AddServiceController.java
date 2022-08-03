/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomDAO;
import dao.ServiceDAO;
import dto.HostelDTO;
import dto.ServiceDetailDTO;
import dto.ServiceTypeDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

/**
 *
 * @author avillX
 */
@WebServlet(name = "AddServiceController", urlPatterns = {"/AddServiceController"})
public class AddServiceController extends HttpServlet {

    private static final String ERROR = "View/addNewService.jsp";
    private static final String SUCCESS = "MainController?action=ServicePage";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
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
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");

            RoomDAO dao = new RoomDAO();
            ServiceDAO SerDAO = new ServiceDAO();

            String hostelID = request.getParameter("hostelID");
            HostelDTO hostel = dao.GetAHostel(hostelID);

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dtf.format(now);

            List<HostelDTO> HostelList = dao.GetListHostel(us.getUserID());
            List<ServiceTypeDTO> ServiceList = SerDAO.GetListService();

            request.setAttribute("CurrentDate", currentDate);
            request.setAttribute("CurrentHostel", hostel);
            request.setAttribute("HostelList", HostelList);
            request.setAttribute("ServiceTypeList", ServiceList);
        } catch (Exception e) {
            log("Error at AddServiceController(doGet): " + e.toString());
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
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession ss = request.getSession();
            UserDTO us = (UserDTO) ss.getAttribute("LOGIN_USER");
            ServiceDAO dao = new ServiceDAO();

            String detail_name = request.getParameter("detail_name");
            String calUnit = "";
            String unit_price = request.getParameter("unit_price").replaceAll(",", "");
            Double unitprice = Double.parseDouble(unit_price);
            String updated_date = request.getParameter("updated_date");
            String description = request.getParameter("description");
            String hostel_id = request.getParameter("hostel_id");
            String service_id = request.getParameter("service_id");
            if (service_id.equals("1")) {
                calUnit = "kWh";
            } else if (service_id.equals("2")) {
                calUnit = "m3";
            } else {
                calUnit = "---";
            }

            boolean check = dao.AddServiceDetail(new ServiceDetailDTO(0, detail_name, calUnit, unitprice, Date.valueOf(updated_date), description, "ACTIVE", hostel_id, Integer.valueOf(service_id)));
            if (check) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AddServiceController(doPost): " + e.toString());
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
