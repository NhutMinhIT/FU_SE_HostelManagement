/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomDAO;
import dto.HostelDTO;
import dto.RoomDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author avillX
 */
@WebServlet(name = "AddRoomController", urlPatterns = {"/AddRoomController"})
public class AddRoomController extends HttpServlet {

    private static final String ERROR = "View/addNewRoom.jsp";
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
            String HostelID = request.getParameter("HostelID");
            RoomDAO dao = new RoomDAO();
            HostelDTO Hostel = dao.GetAHostel(HostelID);
            request.setAttribute("Hostel", Hostel);
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
        RoomDAO dao = new RoomDAO();
        try {            
            Double price = Double.parseDouble(request.getParameter("price"));
            String hostelID = request.getParameter("hostelID");
            String roomnumber = request.getParameter("roomnumber");          
            String description = request.getParameter("description");

            boolean check = dao.AddRoom(new RoomDTO("",hostelID,roomnumber,price,description,"EMPTY"));
            if (check) {
                url = SUCCESS;
            }           
        } catch (Exception e) {
            log("Error at AddRoomController(doPost): " + e.toString());
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
