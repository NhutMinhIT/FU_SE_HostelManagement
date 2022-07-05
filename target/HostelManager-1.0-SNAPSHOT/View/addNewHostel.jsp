
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MoonHostel</title>
        <link rel="icon" type="image/png" href="../assets/img/logo.png" sizes="16x16">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

    </head>
    <body class="sb-nav-fixed">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">
            <main class="container-fluid" style="font-size: 17px">
                <div class="container-fluid px-4">
                    <div class="card mt-4">
                        <div class="card-header">
                            <h1 class="text-info"><i class="fa-solid fa-house-chimney-medical fa-beat"></i> Thêm Nhà Trọ</h1>

                        </div>
                        <div class="card-body">

                            <form action="${pageContext.request.contextPath}/MainController" method="POST">
                                <div class="row">
                                    <div class="form-group row col-md-6 mt-2">
                                        <label  class="col-sm-4 col-form-label">Tên nhà</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="hostelname" class="form-control" placeholder="Nhập tên nhà">
                                        </div>
                                    </div>
                                    
                                        <div class="form-group row col-md-6 mt-2">
                                            <label  class="col-sm-4 col-form-label">Thành Phố</label>
                                            <div class="col-sm-8">
                                                <select id="city"  name="city"   style="padding:6px 0; border-radius: 3px; width: 50%" >
                                                    <option value="0">Chọn Thành phố</option>
                                                    <%
                                                        try {
                                                            String query = "Select * from dbo.City";
                                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                                                            Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HostelDB", "sas", "123456");
                                                            Statement stm = conn.createStatement();
                                                            ResultSet rs = stm.executeQuery(query);
                                                            while (rs.next()) {
                                                    %>
                                                    <option value="<%=rs.getString("city_id")%>"

                                                            <%
                                                                if (request.getParameter("city") != null) {
                                                                    if (rs.getString("city_id") == request.getParameter("city")) {
                                                                        out.print("selected");
                                                                    }
                                                                }

                                                            %>

                                                            ><%=rs.getString("city_name")%></option>
                                                    <%
                                                            }

                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    %>
                                                </select>  
                                            </div>
                                        </div>
                                </div>     

                                <div class="row">
                                    <div class="form-group row col-md-6 mt-2">
                                        <label  class="col-sm-4 col-form-label">Quận/Huyện</label>
                                        <div class="col-sm-8">
                                            <select id="select-state1"  name="district"  style="padding:6px 0; border-radius: 3px; width: 50%" >
                                                <option value="0">Chọn Quận/Huyện</option>
                                                <%
                                                    try {
                                                        String query = "Select * from dbo.District where city_id=?";
                                                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
                                                        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=HostelDB", "sas", "123456");
                                                        PreparedStatement pstm = con.prepareStatement(query);
                                                        pstm.setString(1, request.getParameter("city"));
                                                        ResultSet rs = pstm.executeQuery();
                                                        while (rs.next()) {
                                                %>
                                                <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                                <%
                                                        }

                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </select>  
                                        </div>
                                    </div>
                                    <div class="form-group row col-md-6 mt-2">
                                        <label  class="col-sm-4 col-form-label">Phường Xã</label>
                                        <div class="col-sm-8">
                                            <select id="select-state1"  name="ward"  placeholder="Chọn Quận/Huyện..." style="padding:6px 0; border-radius: 3px; width: 50%" >
                                                <option></option>
                                            </select>  
                                        </div>
                                    </div>
                                </div> 
                            
                            <div class="row">
                                <div class="form-group row col-md-12 mt-2">
                                    <label  class="col-sm-2 col-form-label">Địa chỉ cụ thể</label>
                                    <div class="col-sm-8">
                                        <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ cụ thể">
                                    </div>
                                </div>                                 
                            </div>

                            <div class="mt-3 text-center">
                                <a href="${pageContext.request.contextPath}/MainController?action=RoomPage">
                                    <button class="btn btn-warning" type="button" id="cancelButton"><i class="fa fa-mail-reply"></i> Trở Về</button>
                                </a>
                                <button class="btn btn-success" onchange="this.form.submit()" type="submit" name="action" id="sumbitButton" value="AddHostel"><i class="fa fa-check"></i> Lưu</button>
                            </div>
                            </form>



                        </div>

                    </div>
                </div>




            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted ">Copyright &copy; by MoonHostel</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>    
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

</body>

</html>
