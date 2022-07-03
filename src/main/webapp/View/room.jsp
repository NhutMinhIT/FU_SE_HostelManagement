
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>MoonHostel</title>
        <link rel="icon" type="image/png" href="../assets/img/logo.png" sizes="16x16">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/styletable.css" rel="stylesheet" />
    </head>

    <body class="sb-nav-fixed jumbotron">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">
            <h1 class="m-4 col-md-4 text-info"><i class="fa fa-house fa-beat"></i> Quản Lí Phòng</h1>
            <div style="margin-left: auto">
                <a href="View/addNewHostel.jsp">
                    <button type="button"  class="btn btn-success m-2"><i class="fa fa-bank"></i> Thêm Nhà Trọ</button>
                </a>
            </div>

            <main class="container-fluid">
                <ul class=" col-12 nav nav-tabs mb-4">

                    <li class="nav-item">
                        <a class="nav-link active" href="#moon" role="tab" data-toggle="tab">Moon Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#bae1" role="tab" data-toggle="tab">Bae Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#tri" role="tab" data-toggle="tab">Tri Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#hung" role="tab" data-toggle="tab">Hùng Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#minh" role="tab" data-toggle="tab">Minh Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#mai" role="tab" data-toggle="tab">Mai Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#hau" role="tab" data-toggle="tab">Hậu Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#duong" role="tab" data-toggle="tab">Dương Hostel</a>
                    </li>
                </ul>
                <div class="tab-content ">                       
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade show active" id="moon">

                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >
                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             
                            </div>
                            <div class="container-fluid">  
                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td>2</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <div role="tabpanel" class="tab-pane fade show" id="bae1">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>5</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div role="tabpanel" class="tab-pane fade show" id="tri">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>6</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade show" id="hung">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>7</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade show" id="minh">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>8</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade show" id="mai">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>9</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade show" id="hau">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>5</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>10</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade show" id="duong">
                            <div class="breadcrumb mb-4 " style="margin-left: 75%;" >
                                <div class="row" >

                                    <a href="${pageContext.request.contextPath}/MainController?action=AddRoom&HostelID=${Hos.hostelID}" >
                                        <button type="button"  class="btn btn-success"><i class="fa fa-add"></i> Thêm Phòng</button>
                                    </a>
                                </div>
                                <div class="row " style="margin-left: 10px">
                                    <a href="${pageContext.request.contextPath}/MainController?action=DeleteHostel&HostelID=${Hos.hostelID}">
                                        <button type="button" Onclick="return ConfirmDelete();" class="btn btn-danger"><i class="fa fa-remove"></i> Xóa Nhà Trọ</button>
                                    </a>
                                </div>                             

                            </div>
                            <div class="container-fluid">  

                                <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                       placeholder="Filter This Table...">
                                <table class="_table table_sort">
                                    <thead>
                                        <tr>
                                            <th style="width: 7%">Phòng</th>
                                            <th style="width: 15%">Người Thuê</th>
                                            <th style="width: 8%">Số Điện Thoại</th> 
                                            <th style="width: 10%">Email</th>                                     
                                            <th style="width: 17%">Ngày Thuê</th>
                                            <th style="width: 17%">Giá (VND)</th>
                                            <th style="width: 7%">Trạng Thái</th>
                                            <th style="width: 19%">Chức Năng</th>
                                        </tr>
                                    </thead>
                                    <tbody id="table_filter">
                                        <tr>
                                            <td>12</td>
                                            <td>Nhựt Trí</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>EMPTY</td>
                                            <td>                                                    
                                                <a href="${pageContext.request.contextPath}/MainController?action=AddCustomer&RoomID=${R.roomID}">
                                                    <button class="btn btn-warning" title="Add"><i class="fa fa-add fa-beat"></i> Thêm Khách</button>
                                                </a> 
                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>Nhựt Minh</td>
                                            <td>123456789</td>
                                            <td>minhnnse150140@fpt.edu.vn</td>
                                            <td>
                                                <input name="DOB" type="text" value="22/06/2022" disabled="disabled">
                                            </td>
                                            <td>
                                                <input type="text" name="price" value="3000000" disabled="disabled">
                                            </td>
                                            <td>RENTING</td>
                                            <td>                                                    

                                                <a href="${pageContext.request.contextPath}/MainController?action=UpdateRoom&RoomID=${R.roomID}">
                                                    <button class="btn btn-primary" title="Edit"><i class="fa fa-edit"></i></button>
                                                </a>
                                                <a href="${pageContext.request.contextPath}/MainController?action=DeleteRoom&RoomID=${R.roomID}">                                                                                        
                                                    <button Onclick="return ConfirmDelete();" class="btn btn-danger" title="Remove"><i class="fa fa-remove"></i></button>                
                                                </a>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>

            </main>


            <footer class="py-4 bg-light mt-5">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted ">Copyright &copy; by MoonHostel</div>
                    </div>
                </div>
            </footer>
        </div>

        <script>
            function ConfirmDelete()
            {
                var x = confirm("Are you sure you want to delete?");
                if (x)
                    return true;
                else
                    return false;
            }
        </script>    
        <script type="text/javascript">
            function myFunction() {
                var n1 = document.getElementById('n1').value;
                var n2 = document.getElementById('n2').value;
                var result = 0;
                result = parseInt(n1) - parseInt(n2);
                document.getElementById('result').value = result;

            }
            function checkNumber() {
                var x = document.getElementById('n1').value;
                if (isNaN(x)) {
                    document.getElementById('n1').style.borderColor = "red";
                } else {
                    document.getElementById('n1').style.borderColor = "green";
                }
            }
        </script> 
        <script type="text/javascript">
            let table_sort_elements = document.querySelectorAll('.table_sort');
            if (table_sort_elements)
            {
                table_sort_elements = Array.isArray(table_sort_elements) ? table_sort_elements : Object.values(table_sort_elements);
                table_sort_elements.forEach(table_sort_element => {
                    let thead_cells = table_sort_element.querySelectorAll('thead>tr>*');
                    if (thead_cells)
                    {
                        thead_cells = Array.from(thead_cells);

                        thead_cells.forEach((thead_cell, index) => {
                            thead_cell.addEventListener('click', function () {
                                this.classList.toggle('asc');
                                sortTableByColumn(table_sort_element, index, !this.classList.contains('asc'));
                            });
                        });
                    }
                });
            }


            function sortTableByColumn(table, column, desc = false)
            {
                let tbody = table.querySelector('tbody'),
                        rows = tbody.querySelectorAll('tr');

                rows = rows.isArray ? rows : Object.values(rows);

                function compare(a, b) {
                    // console.log(a.children[column], b.children[column]);
                    let aText = a.children[column].innerText.trim(),
                            bText = b.children[column].innerText.trim();

                    return (aText < bText) ? -1 : 1;
                }

                rows.sort(compare);

                if (desc)
                    rows.reverse();

                tbody.innerHTML = '';

                let i = 0;
                while (i < rows.length) {
                    tbody.appendChild(rows[i]);
                    i++;
            }
            }




            /* <a href="https://freetoolssite.com/how-to-create-a-popup-in-html-css-and-javascript/">html table filter javaScript</a> code start */
            function filter_table(This, table_id)
            {
                let recordLists = document.querySelectorAll(`#${table_id}>*`);
                if (recordLists)
                {
                    hide_tr(recordLists);
                    recordLists.forEach(recordList => {
                        let str = recordList.innerText.toLowerCase(),
                                value = This.value.toLowerCase();

                        if (str.indexOf(value) >= 0)
                        {
                            recordList.style.display = '';
                        }
                    });
                }
            }


            function hide_tr(recordLists) {
                recordLists.forEach(recordList => {
                    recordList.style.display = 'none';
                });
            }
            /* <a href="https://freetoolssite.com/css-text-animation-using-html-css-and-javascript/">html table filter javaScript</a> code end */
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>

        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    </body>

</html>