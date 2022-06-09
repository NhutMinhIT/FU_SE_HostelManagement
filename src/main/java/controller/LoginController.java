package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "View/login.jsp";
    private static final String ADMIN_PAGE = "MainController?action=AdminPage";
    private static final String AD = "AD";
    private static final String USER_PAGE = "/View/index.jsp";
    private static final String US = "US";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(email, password);
            
                if (loginUser != null) {
                    HttpSession session = request.getSession();
                    String roleID = loginUser.getRoleID();
<<<<<<< HEAD
                    if (null == roleID) {
                        request.setAttribute("ERROR", "Your role is not support!");
                    } else switch (roleID) {
                    case AD:
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = ADMIN_PAGE;
                        break;
                    case US:
                        if(loginUser.getStatus().equals("APROVED")){
                            session.setAttribute("LOGIN_USER", loginUser);
                            url = USER_PAGE;
                        }
                        break;
                    default:
=======
                    if (AD.equals(roleID.trim())) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = ADMIN_PAGE;
                    } else if (US.equals(roleID.trim())) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = USER_PAGE;
                    } else {
>>>>>>> a3f2a3d29e3b22d42af25d0ea1a30266b88ad67b
                        request.setAttribute("ERROR", "Your role is not support!");
                        break;
                }
                } else {
                    request.setAttribute("ERROR", "Incorrect userID or Password!");
                }

            
        } catch (SQLException e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
