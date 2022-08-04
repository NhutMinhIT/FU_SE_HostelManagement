<%-- 
    Document   : bill
    Created on : Jul 20, 2022, 5:36:25 PM
    Author     : ASUS
--%>

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
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/logo.png" sizes="16x16">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="${pageContext.request.contextPath}/css/styletable.css" rel="stylesheet" />

    </head>
    <body>

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">

            <main class="container-fluid">
                <h1 class="mx-4 col-md-4 text-info mb-4"><i class="fas fa-money-bill fa-beat"></i> Tính tiền</h1>
                <hr>

                <ul class=" col-12 nav nav-tabs mb-4">
                    <c:forEach items="${HostelList}" var="Ho">   
                        <li class="nav-item">
                            <c:choose>
                                <c:when test="${Ho.hostelID == HostelList.get(0).hostelID}">
                                    <a class="nav-link active" href="#${Ho.hostelname}" role="tab" data-toggle="tab">${Ho.hostelname}</a>   
                                </c:when>
                                <c:otherwise>
                                    <a class="nav-link" href="#${Ho.hostelname}" role="tab" data-toggle="tab">${Ho.hostelname}</a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>
                </ul>

                <div class="tab-content mt-3">
                    <c:forEach items="${HostelList}" var="Hos">
                        <c:choose>
                            <c:when test="${Hos.hostelID == HostelList.get(0).hostelID}">
                                <div role="tabpanel" class=" tab-pane fade show active" id="${Hos.hostelname}" >   
                                </c:when>
                                <c:otherwise>
                                    <div role="tabpanel" class=" tab-pane fade show" id="${Hos.hostelname}" >
                                    </c:otherwise>
                                </c:choose>

                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a  class="nav-link active" href="#process_${Hos.hostelname}" role="tab" data-toggle="tab">Chưa thanh toán</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#complete_${Hos.hostelname}" role="tab" data-toggle="tab">Đã thanh toán</a>
                                    </li>
                                </ul>
                                <div class="tab-content">

                                    <div><h3 style="margin: 20px"></h3></div>
                                    <div role="tabpanel" class="tab-pane fade show active" id="process_${Hos.hostelname}">

                                        <div class="d-flex justify-content-center row">                                       
                                            <div class="table-responsive table-borderless">
                                                <table class="_table table_sort">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">Phòng</th>
                                                            <th style="width: 20%">Khách Thuê</th>
                                                            <th style="width: 15%">Ngày phát hành</th>
                                                            <th style="width: 15%">Ngày thanh toán</th>
                                                            <th style="width: 15%">Số Tiền</th>
                                                            <th style="width: 15%">Trạng Thái</th>
                                                            <th style="width: 20%">Hành động</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="table_filter">

                                                        <c:forEach items="${BillList}" var="B">
                                                            <c:if test="${B.status == 'PROCESS'}">

                                                                <c:forEach items="${ContractList}" var="C">
                                                                    <c:if test="${C.customerID == B.customerID}">

                                                                        <c:forEach items="${RoomList}" var="R">
                                                                            <c:if test="${R.roomID == C.roomID}">

                                                                                <c:if test="${R.hostelID == Hos.hostelID}">

                                                                                    <tr>

                                                                                        <td>${R.roomnumber}</td>

                                                                                        <c:forEach items="${CusList}" var="Cus">
                                                                                            <c:if test="${Cus.customerID == C.customerID}">
                                                                                                <td><a href="${pageContext.request.contextPath}/MainController?action=CustomerPage&CusID=${Cus.customerID}&roomID=${R.roomID}">${Cus.fullname}</a></td>


                                                                                            </c:if>
                                                                                        </c:forEach>

                                                                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${B.created}"/></td>
                                                                                        <td>---</td>
                                                                                        <td>
                                                                                            <input class="money form-control" type="text" name="unit_price"  placeholder="Giá" 
                                                                                                   value="<fmt:formatNumber type="number" maxFractionDigits="0" value="${B.total}"/>" disabled="disabled">                                   
                                                                                        </td>
                                                                                        <td class="text-warning"><strong>CHƯA THANH TOÁN</strong></td>

                                                                                        <td>
                                                                                            <button type="button" class="btn btn-primary table-elipse" data-toggle="collapse" data-target="#detail_${B.billID}" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button> 

                                                                                        </td>
                                                                                    </tr>

                                                                                    <tr id="detail_${B.billID}" class="collapse cell-1 row-child">
                                                                                        <td colspan="2"></td>
                                                                                        <td colspan="5" style="background-color: #ddd">
                                                                                            <h4 style="text-align: center">Chi tiết hóa đơn</h4>
                                                                                            <div>
                                                                                                <form action="${pageContext.request.contextPath}/MainController" method="POST">
                                                                                                    <input type="hidden" name="billID" value="${B.billID}"/>
                                                                                                    <table class="_table table_sort">
                                                                                                        <thead>
                                                                                                            <tr>
                                                                                                                <th style="width: 20%">Dịch vụ</th>
                                                                                                                <th style="width: 10%">Số cũ</th>
                                                                                                                <th style="width: 10%">Số mới</th>
                                                                                                                <th style="width: 15%">Tổng tiền</th>                                                                                                                
                                                                                                            </tr>
                                                                                                        </thead>
                                                                                                        <tbody id="table_filter">
                                                                                                            <tr>
                                                                                                                <td>Tiền phòng</td>
                                                                                                                <td>0</td>
                                                                                                                <td>1</td>
                                                                                                                <td>${R.price}</td>
                                                                                                            </tr>
                                                                                                            <c:forEach items="${B.details}" var="BD"> 

                                                                                                                <tr>
                                                                                                                    <td>${BD.service.detailname}</td>

                                                                                                                    <c:set value="0" var="Required" scope="page"/>
                                                                                                                    <c:forEach items="${CompleteList}" var="Com">
                                                                                                                        <c:if test="${Com.customerID == B.customerID}">
                                                                                                                            <c:forEach items="${Com.details}" var="Cd">
                                                                                                                                <c:if test="${Cd.service.detailID == Com.service.detailID}">

                                                                                                                                    <c:set value="${Cd.qty}" var="Required" scope="page"/>

                                                                                                                                </c:if>
                                                                                                                            </c:forEach>
                                                                                                                        </c:if>
                                                                                                                    </c:forEach>
                                                                                                                    <td>${Required}</td>
                                                                                                                    <td>${BD.qty}</td>
                                                                                                                    <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${BD.total}"/></td>
                                                                                                                </tr>  
                                                                                                            </c:forEach>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                    <div style="text-align: right; margin-top:10px">
                                                                                                        <button  class="btn btn-success" type="submit" name="action" id="sumbitButton" value="Checkout"><i class="fas fa-money-bill-wave" ></i></button>
                                                                                                        <button  class="btn btn-success" type="submit" name="action" id="sumbitButton" value="CompleteBill"><i class="fa fa-add" ></i></button>
                                                                                                    </div>
                                                                                                </form>
                                                                                            </div>               


                                                                                        </td>

                                                                                    </tr>
                                                                                </c:if>

                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </c:if>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        </form>
                                    </div>

                                    <div role="tabpanel" class="tab-pane fade show" id="complete_${Hos.hostelname}">
                                        <div class="d-flex justify-content-center row">   
                                            <div class="table-responsive table-borderless">

                                                <table class="_table table_sort">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10%">Phòng</th>
                                                            <th style="width: 20%">Khách Thuê</th>
                                                            <th style="width: 15%">Ngày phát hành</th>
                                                            <th style="width: 15%">Ngày thanh toán</th>
                                                            <th style="width: 15%">Số Tiền</th>
                                                            <th style="width: 15%">Trạng Thái</th>
                                                            <th style="width: 20%">Hành động</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="table_filter">
                                                        <c:forEach items="${BillList}" var="B">
                                                            <c:if test="${B.status == 'COMPLETE'}">

                                                                <c:forEach items="${ContractList}" var="C">
                                                                    <c:if test="${C.customerID == B.customerID}">

                                                                        <c:forEach items="${RoomList}" var="R">
                                                                            <c:if test="${R.roomID == C.roomID}">

                                                                                <c:if test="${R.hostelID == Hos.hostelID}">

                                                                                    <tr class="cell-1" >

                                                                                        <td>${R.roomnumber}</td>

                                                                                        <c:forEach items="${CusList}" var="Cus">
                                                                                            <c:if test="${Cus.customerID == C.customerID}">
                                                                                                <td><a href="${pageContext.request.contextPath}/MainController?action=CustomerPage&CusID=${Cus.customerID}&roomID=${R.roomID}">${Cus.fullname}</a></td>
                                                                                                </c:if>
                                                                                            </c:forEach>
                                                                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${B.created}"/></td>
                                                                                        <td>---</td>
                                                                                        <td>
                                                                                            <input class="money form-control" type="text" name="unit_price"  placeholder="Giá" 
                                                                                                   value="<fmt:formatNumber type="number" maxFractionDigits="0" value="${B.total}"/>" disabled="disabled">                                   
                                                                                        </td>
                                                                                        <td class="text-success"><strong>ĐÃ THANH TOÁN</strong></td>

                                                                                        <td>                                                                                
                                                                                            <button class="btn btn-primary table-elipse" data-toggle="collapse" data-target="#detail_${B.billID}" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button> 
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="detail_${B.billID}" class="collapse cell-1 row-child">
                                                                                        <td colspan="2"></td>
                                                                                        <td colspan="5" style="background-color: #ddd">
                                                                                            <h4 style="text-align: center">Chi tiết hóa đơn</h4>


                                                                                            <div>
                                                                                                <table class="_table table_sort">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th style="width: 20%">Dịch vụ</th>
                                                                                                            <th style="width: 10%">Số cũ</th>
                                                                                                            <th style="width: 10%">Số mới</th>
                                                                                                            <th style="width: 15%">Tổng tiền</th>                                                                                                                
                                                                                                        </tr>
                                                                                                    </thead>
                                                                                                    <tbody id="table_filter">
                                                                                                        <c:forEach items="${B.details}" var="BD"> 
                                                                                                            <tr>
                                                                                                                <td>${BD.service.detailname}</td>
                                                                                                                <td>0</td>
                                                                                                                <td>${BD.qty}</td>
                                                                                                                <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${BD.total}"/></td>
                                                                                                            </tr> 
                                                                                                        </c:forEach>
                                                                                                </table>
                                                                                            </div>               


                                                                                        </td>
                                                                                    </tr>
                                                                                </c:if>

                                                                            </c:if>
                                                                        </c:forEach>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </c:if>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>

                    </div>

            </main>
        </form>
        <footer class="py-4 bg-light mt-5">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted ">Copyright &copy; by MoonHostel</div>
                </div>
            </div>
        </footer>
    </div>


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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</body>
</html>
