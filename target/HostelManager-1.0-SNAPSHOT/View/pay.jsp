


<%-- 
    Document   : pay
    Created on : Jul 20, 2022, 5:36:25 PM
    Author     : ASUS
--%>

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
        <link rel="icon" type="image/png" href="../assets/img/logo.png" sizes="16x16">
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

                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#moon" role="tab" data-toggle="tab">Moon Hostel</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#bae1" role="tab" data-toggle="tab">Bae Hostel</a>
                    </li>
                </ul>
                <div class="tab-content mt-3">

                    <div role="tabpanel" class="tab-pane fade show active" id="moon">
                        <h4 class="mx-4 col-md-4 text-warning mb-4"> Moon Hostel</h4>
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a  class="nav-link active" href="#moonT6" role="tab" data-toggle="tab">Tháng 06/2022</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#moonT7" role="tab" data-toggle="tab">Tháng 07/2022</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="moonT6">
                                <div class="container-fluid">
                                    <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                           placeholder="Filter This Table...">
                                    <table class="_table table_sort">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">Nhà</th>
                                                <th style="width: 10%">Phòng</th>
                                                <th style="width: 25% ">Khách Thuê</th>
                                                <th>Số Tiền</th>
                                                <th>Trạng Thái</th>
                                                <th style="width: 11%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table_filter">
                                            <tr>
                                                <td>Moon</td>
                                                <td>01</td>
                                                <td>Quang Hùng</td>
                                                <td>
                                                    <input style="width: 100%" value="3000000"  disabled="disabled" type="text">                                    
                                                </td>
                                                <td class="text-warning"><strong>CHƯA THANH TOÁN</strong></td>

                                                <td>
                                                    <button class="btn btn-primary" title="Thu tiền"><i class="fas fa-money-bill-wave" ></i></button>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button> 
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Moon</td>
                                                <td>02</td>
                                                <td>Nhựt Minh</td>
                                                <td>
                                                    <input style="width: 100%" disabled="disabled" value="2800000" type="text">                                    

                                                </td>
                                                <td class="text-success"><strong>ĐÃ THANH TOÁN</strong></td>


                                                <td>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade show" id="moonT7">
                                <div class="container-fluid">
                                    <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                           placeholder="Filter This Table...">
                                    <table class="_table table_sort">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">Nhà</th>
                                                <th style="width: 10%">Phòng</th>
                                                <th style="width: 25%">Khách Thuê</th>
                                                <th>Số Tiền</th>
                                                <th>Trạng Thái</th>
                                                <th style="width: 11%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table_filter">
                                            <tr>
                                                <td>Moon</td>
                                                <td>01</td>
                                                <td>Quang Hùng 1</td>
                                                <td>
                                                    <input style="width: 100%" value="3500000"  disabled="disabled" type="text">                                    
                                                </td>
                                                <td class="text-warning"><strong>CHƯA THANH TOÁN</strong></td>

                                                <td>
                                                    <button class="btn btn-primary" title="Thu tiền"><i class="fas fa-money-bill-wave" ></i></button>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button> 
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Moon</td>
                                                <td>02</td>
                                                <td>Nhựt Minh 1</td>
                                                <td>
                                                    <input style="width: 100%" disabled="disabled" value="4000000" type="text">                                    

                                                </td>
                                                <td class="text-success"><strong>ĐÃ THANH TOÁN</strong></td>


                                                <td>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>



                    </div>
                    <div role="tabpanel" class="tab-pane fade show" id="bae1">
                        <h4 class="mx-4 col-md-4 text-warning mb-4"> Bae Hostel</h4>

                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a  class="nav-link active" href="#baeT6" role="tab" data-toggle="tab">Tháng 06/2022</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#baeT7" role="tab" data-toggle="tab">Tháng 07/2022</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="baeT6">
                                <div class="container-fluid">
                                    <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                           placeholder="Filter This Table...">
                                    <table class="_table table_sort">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">Nhà</th>
                                                <th style="width: 10%">Phòng</th>
                                                <th style="width: 25%">Khách Thuê</th>
                                                <th>Số Tiền</th>
                                                <th>Trạng Thái</th>
                                                <th style="width: 11%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table_filter">
                                            <tr>
                                                <td>Bae</td>
                                                <td>01</td>
                                                <td>Hùng 3</td>
                                                <td>
                                                    <input style="width: 100%" value="3000000"  disabled="disabled" type="text">                                    
                                                </td>
                                                <td class="text-warning"><strong>CHƯA THANH TOÁN</strong></td>

                                                <td>
                                                    <button class="btn btn-primary" title="Thu tiền"><i class="fas fa-money-bill-wave" ></i></button>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button> 

                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Bae</td>
                                                <td>02</td>
                                                <td>Nhựt Minh 3</td>
                                                <td>
                                                    <input style="width: 100%" disabled="disabled" value="2500000" type="text">                                    

                                                </td>
                                                <td class="text-success"><strong>ĐÃ THANH TOÁN</strong></td>


                                                <td>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade show" id="baeT7">
                                <div class="container-fluid">
                                    <input type="search" oninput="filter_table(this, 'table_filter')" class="form_control"
                                           placeholder="Filter This Table...">
                                    <table class="_table table_sort">
                                        <thead>
                                            <tr>
                                                <th style="width: 15%">Nhà</th>
                                                <th style="width: 10%">Phòng</th>
                                                <th style="width: 25%">Khách Thuê</th>
                                                <th>Số Tiền</th>
                                                <th>Trạng Thái</th>
                                                <th style="width: 11%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table_filter">
                                            <tr>
                                                <td>Moon</td>
                                                <td>01</td>
                                                <td>Quang 2</td>
                                                <td>
                                                    <input style="width: 100%" value="3000000"  disabled="disabled" type="text">                                    
                                                </td>
                                                <td class="text-warning"><strong>CHƯA THANH TOÁN</strong></td>

                                                <td>
                                                    <button class="btn btn-primary" title="Thu tiền"><i class="fas fa-money-bill-wave" ></i></button>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button> 
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Moon</td>
                                                <td>02</td>
                                                <td>Nhựt Minh 2</td>
                                                <td>
                                                    <input style="width: 100%" disabled="disabled" value="2200000" type="text">                                    

                                                </td>
                                                <td class="text-success"><strong>ĐÃ THANH TOÁN</strong></td>


                                                <td>
                                                    <button class="btn btn-primary" title="Xem hóa đơn"><i class="fa fa-eye fa-beat" ></i></button>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
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
