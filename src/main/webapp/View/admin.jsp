<%-- 
    Document   : admin
    Created on : Jun 9, 2022, 12:01:58 AM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%= %></h1>
        <h3>User Management</h3>
        <section>
            <table cellspacing="5">
                <tr>
                    <th>USER ID</th>
                    <th>USER NAME</th>
                    <th>FULL NAME</th>
                    <th>EMAIL</th>
                    <th>PHONE</th>
                    <th>STATUS</th>
                    <th></th>
                </tr>
                <%
                    ArrayList<UserDTO> list = (ArrayList)request.getAttribute("listUsers");
                    if(list != null && list.size()>0) for (UserDTO user : list) {%>
                        <tr>
                           <th><%= user.getUserID() %></th>
                           <th><%= user.getUsername() %></th>
                           <th><%= user.getFullname() %></th>
                           <th><%= user.getEmail() %></th>
                           <th><%= user.getPhone() %></th>
                           <th><%= user.getStatus() %></th>
                           <th><button type="submit" action="CheckUsersServlet?userID=<%= user.getUserID() %>&userStatus=<%= user.getStatus() %>">LOCK/UNLOCK</button></th>
                        </tr>
                        
                    
                
                
            </table>
        </section>
    </body>
</html>
