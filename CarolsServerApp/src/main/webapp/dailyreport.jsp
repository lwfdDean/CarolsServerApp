<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="co.za.carolsBoutiqueServer.boutique.model.Boutique"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>current daily report</title>
    </head>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
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
        .multicolortext {
            background-image: linear-gradient(to left, violet, indigo, green, blue, yellow, orange, red);
            -webkit-background-clip: text;
            -moz-background-clip: text;
            background-clip: text;
            color: transparent;
        }
    </style>
</head>
<body style="text-align:center; background-color:#D8C6B7;">
    <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
    <hr color="#22075E">
    <br>
    <h1>DAILY REPORT</h1>
    <%List<Boutique> bouts = (List<Boutique>)request.getAttribute("boutiques");%>
    <form id="form">
        <br><br>
        <table style="width:100">
            <label style="color:#22075E;" for="">Boutique  :  </label>
            <select name="result" id="boutique">
                <ol>
                    <%for(Boutique b:bouts){%>
                        <li><option value="<%=b.getId()%>"><%=b.getLocation()%></option></li>
                    <%}%>
                </ol>
            </select>
            <br><br>
            <br>
        </table> <br>
        <input type="submit" value="generate" name="submit" style="width:170px; height:35px" class="button"/>
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
            crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    
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
                var boutique = document.getElementById("boutique").value;
                let rc = new ReportCriteria(boutique, "", 0, 0);
                var toSend = JSON.stringify(rc);
                var xhr;
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xhr.open("POST", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findCurrentDailySales", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = (function (_this) {
                    return function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var rep = JSON.parse(xhr.responseText);
                            var stores = [];
                            var totals = [];
                            var a =rep.amount;
                            stores.splice(0, 0, rep.id + " " + amount + "% away from target");
                            totals.splice(0, 0, rep.total);
                            
                            renderReport(stores,totals);
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
                    type: "pie",
                    data: {
                        labels: stores,
                        datasets: [{
                                label: "Results",
                                backgroundColor: "blue",
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
    </span>
</body>
</html>
