<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reached Target</title>
        <!--        <script src="Chart.min.js"></script>-->
    </head>
    <style>
        .form-container{
                max-width: 300px;
                padding: 10px;
                background-color: white;
            }
            #verifyManagerCode{
                display:none;
                position: center;
                z-index: 90
            }
            #promoForm{
                display:none;
                position: center;
                z-index: 90
            }
            #itemToRemove{
                display:none;
                position: relative;
                z-index: 90
            }
            #preview{
                width:500px;
                height: 500px;
                margin:0px auto;
                display: none;
                z-index: 20
            }
            label {
                display: inline-block;
                width: 150px;
                text-align: center;
            }
            select {
                width: 150px;
                margin: 10px;
            }
            select:focus {
                min-width: 150px;
                width: auto;
            }
            .button {
                background-color: #555555;
                border: 2px solid #555555;
                border-radius: 15px;
                color: white;
                padding: 5px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                box-shadow: 0 5px #666;

            }
            .button:hover {
                background-color: #3e8e41
            }
            body {
                font-family: Arial, Helvetica, sans-serif;
            }
            .navbar {
                height: 50px;
                z-index: 100;
            }

            .navbar {
                overflow: hidden;
                background-color: #130E3C;

            }

            .navbar a {
                float: left;
                font-size: 16px;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            .dropdown {
                float: left;
                overflow: hidden;
            }

            .dropdown .dropbtn {
                font-size: 16px;
                border: none;
                outline: none;
                color: white;
                padding: 14px 16px;
                background-color: inherit;
                font-family: inherit;
                margin: 0;
            }

            .navbar a:hover, .dropdown:hover .dropbtn {
                background-color: #C70039;
                z-index: 100;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                float: none;
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
                text-align: left;
            }

            .dropdown-content a:hover {
                background-color: #ddd;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .column {
                float: left;
                width: 33.33%;
                padding: 5px;
            }

            /* Clear floats after image containers */
            .row::after {
                content: "";
                clear: both;
                display: table;
            }
            .topnav-right {
                float: right;
            }
    </style>
    <body style="text-align:center; background-color:#D8C6B7;">
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <br>
        <div class="navbar">
            <a href="home.jsp">HOME</a>
            <div class="dropdown">
                <button class="dropbtn">MENU 
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">

                    <a href="EmployeeServlet?submit=getAllRoles">Register new Employee</a>
                    <a href="promoteEmployee.jsp">Promote Employee</a>
                    <a href="registerNewBoutique.jsp">Register new Boutique</a>
                    <a href="BoutiqueServlet?submit=updateBoutiquePage">Update boutique's target</a>

                </div>
            </div>  

            <div class="dropdown">
                <button class="dropbtn">SALE
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="SaleServlet?submit=newSalePage">New Sale</a>
                    <a href="exchange.jsp">Exchange product</a>
                    <a href="refund.jsp">Refund a product</a>
                </div>
            </div>    
            <div class="dropdown">
                <button class="dropbtn">IBT
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="IbtServlet?submit=getBoutiqueIbts">Approve IBT</a>
                    <a href="requestibt.jsp">Request IBT</a>
                </div>
            </div>

            <div class="dropdown">
                <button class="dropbtn">KEEP ASIDE
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="keepaside.jsp">Create</a>
                    <a href="keepaside.jsp">Collect</a>
                </div>
            </div>
            <a href="logstock.jsp">LOG STOCK</a>
            
                <div class="dropdown">
                <button class="dropbtn">REPORT
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="topAchievingReport.jsp">Top Achieving Stores</a>
                    <a href="monthlySalesReport.jsp">Monthly Sales for any store</a>
                    <a href="topachievingemployees.jsp">Top achieving Employees</a>
                    <a href="reachedtarget.jsp">Reached Target</a>
                    <a href="topproducts.jsp">Top 40 products</a>
                    <a href="worstperforming.jsp">Worst Performing Stores</a>
                    <a href="specificProductReport.jsp">Product</a>
                    <a href="dailyreport.jsp">Current Daily Sales</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn">PRODUCT
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="ProductServlet?submit=addPromoPage">Add New PromoCode</a>
                    <a href="putProductOnSale.jsp">Put Product On Sale</a>
                </div>
            </div>
            <div class="topnav-right"><a href="EmployeeServlet?submit=logout">LOGOUT</a></div>
        </div>
        <br>

    <form id="form">
        <table style="width:100">
            <label style="color:#22075E;" for="cars">Select month</label>
            <select name="month" id="month">
                <option value="1">January</option>
                <option value="2">February</option>
                <option value="3">March</option>
                <option value="4">April</option>
                <option value="5">May</option>
                <option value="6">June</option>
                <option value="7">July</option>
                <option value="8">August</option>
                <option value="9">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
            </select>
            <br><br>
            <label style="color:#22075E;" for="">Reports  :  </label>
            <select name="result" id="result">
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="20">20</option>
                <option value="25">25</option>
            </select>
        </table> <br>
        <input type="submit" value="findTopStores" name="submit" style="width:170px; height:35px" class="button"/>
    </form><br><br><br>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<center>
    <div id="canvas">
        <canvas id="myChart" style="width:100%;max-width:700px"></canvas>
        <button id="download" onclick="generatePDF()">Download</button>
    </div>
</center>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
        integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
    var myChart =null;
            document.getElementById("form").addEventListener("submit", startGen);

            function startGen(e) {
                e.preventDefault();
                document.getElementById("canvas").style.display = "block";
                document.getElementById("myChart").innerHTML = null;
                    getReport();
                
            }

            function getReport() {
                var month = document.getElementById("month").value;
                var results = document.getElementById("result").value;
                let rc = new ReportCriteria("", "", month, results);
                var toSend = JSON.stringify(rc);
                var xhr;
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                xhr.open("POST", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findStoreThatAchievedMonthlyTarget", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = (function (_this) {
                    return function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var rep = JSON.parse(xhr.responseText);
                            var stores = [];
                            var ratings = [];
                            for (var i in rep) {
                                stores.splice(i, 0, rep[i].id);
                                ratings.splice(i, 0, rep[i].rating);
                            }
                            renderReport(stores,ratings);
                        } else {
                            console.log("an error in response");
                        }
                    };
                })(this);
                xhr.send(toSend);
            }

            function ReportCriteria(boutique, product, month, results) {
                this.boutique = boutique;
                this.product = product;
                this.month = month;
                this.results = results;
            }

            function renderReport(stores,values) {
                if(myChart !=null){
                    myChart.destroy();
                }
                myChart = new Chart("myChart", {
                    type: "bar",
                    data: {
                        labels: stores,
                        datasets: [{
                                label: "Results",
                                backgroundColor: "orange",
                                borderColor: "white",
                                data: values
                            }]},
                    options: {}
                });
            }

            function generatePDF() {
                const element = document.getElementById("myChart");
                html2pdf().from(element).save("topAchievingReport.pdf");
            }
</script>
<br><br><br><hr color="#22075E" width="400px;">
<span style="Font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"><span style="font-size:8pt; vertical-align: text-bottom;">
        <strong style="color:#22075E;">© Copyright 
            <span style="color:#22075E;" id="ctl00_YearLbl">2022</span>, Carol's Boutique (Pty) Ltd. All rights reserved.<br />A Fashion Company.<br/>      
        </strong><p style="color:#22075E;">All brands, trademarks, tradenames, and logos are the<br/> property of Carol's Boutique.</p>
        <strong style="color:#22075E;"><i><u>Developed by LWFD-GROUP.</u></i></strong>  
        <br />
    </span>
</span></body>
</html>
