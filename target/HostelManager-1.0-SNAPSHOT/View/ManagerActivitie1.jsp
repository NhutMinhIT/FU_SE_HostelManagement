<%-- 
    Document   : chisodien.jsp
    Created on : Jun 28, 2022, 10:52:33 AM
    Author     : Dell
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <body class="sb-nav-fixed">

        <%@include file="/View/layout/header.jsp" %>

        <div id="layoutSidenav_content">
            <h1 class="m-4 col-md-4 text-info"><i class="fas fa-bolt fa-beat"></i> Quản Lí Tiêu</h1>
            <main class="container-fluid">
                <ul class="nav nav-tabs">
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
                <div class="tab-content">
                    <c:forEach items="${HostelList}" var="Hos">
                        <c:choose>
                            <c:when test="${Hos.hostelID == HostelList.get(0).hostelID}">
                                <div role="tabpanel" class=" tab-pane fade show active" id="${Hos.hostelname}" >   
                                </c:when>
                                <c:otherwise>
                                    <div role="tabpanel" class=" tab-pane fade show" id="${Hos.hostelname}" >
                                    </c:otherwise>
                                </c:choose>
                                <div>
                                    <form action="${pageContext.request.contextPath}/MainController" method="POST">
                                        <div class="mt-3 text-center" style="float:right; display: flex; margin: 70px 50px 50px 0">                       
                                            <button class="btn btn-success" type="submit" name="action" id="sumbitButton" value="UpdateBill"><i class="fa fa-check"></i> Lưu</button>
                                        </div> 
                                        <br/>              

                                        <div class="container-fluid">

                                            <table class="_table table_sort">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 7%">Phòng</th>
                                                        <th style="width: 20%">Khách Thuê</th>
                                                        <th>Số Điện Cũ</th>
                                                        <th>Số Điện Mới</th>
                                                        <th>Số Nước Cũ</th>
                                                        <th>Số Nước Mới</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody id="table_filter">
                                                    <c:forEach items="${ProcessList}" var="B"> 
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

                                                                                <c:set value="0" var="Required" scope="page"/>
                                                                                <c:forEach items="${CompleteList}" var="Com">
                                                                                    <c:if test="${Com.customerID == C.customerID}">
                                                                                        <c:forEach items="${Com.details}" var="Cd">
                                                                                            <c:if test="${Cd.service.serviceID == '1'}">
                                                                                                <c:set value="${Cd.qty}" var="Required" scope="page"/>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </c:forEach>

                                                                                <td>
                                                                                    <input style="width: 100%" type="number"  value="${Required}" disabled="disabled">                                                                                                   
                                                                                </td>
                                                                                
                                                                                <c:forEach items="${ProcessList}" var="Com">
                                                                                    <c:if test="${Com.customerID == C.customerID}">
                                                                                        <c:forEach items="${Com.details}" var="Cd">
                                                                                            <c:if test="${Cd.service.serviceID == '1'}">
                                                                                                <td>
                                                                                                    <input style="width: 100%" type="number" name="Elec_${B.billID}" value="${Cd.qty}">
                                                                                                </td>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                            
                                                                                <c:set value="0" var="Required" scope="page"/>
                                                                                <c:forEach items="${CompleteList}" var="Com">
                                                                                    <c:if test="${Com.customerID == C.customerID}">
                                                                                        <c:forEach items="${Com.details}" var="Cd">
                                                                                            <c:if test="${Cd.service.serviceID == '2'}">
                                                                                                <c:set value="${Cd.qty}" var="Required" scope="page"/>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <td>
                                                                                    <input style="width: 100%" type="number"  value="${Required}" disabled="disabled">                                                                                                   
                                                                                </td>
                                                                                
                                                                                <c:forEach items="${ProcessList}" var="Com">
                                                                                    <c:if test="${Com.customerID == C.customerID}">
                                                                                        <c:forEach items="${Com.details}" var="Cd">
                                                                                            <c:if test="${Cd.service.serviceID == '2'}">
                                                                                                <td>
                                                                                                    <input style="width: 100%" type="number" name="Wat_${B.billID}" value="${Cd.qty}">
                                                                                                </td>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                </c:forEach>

                                                                                
                                                                            </tr>
                                                                        </c:if>

                                                                    </c:if>
                                                                </c:forEach>

                                                            </c:if>
                                                        </c:forEach>

                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </c:forEach>
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
