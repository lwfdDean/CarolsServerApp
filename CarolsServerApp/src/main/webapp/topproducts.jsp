<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Top 40 Products</title>
        <!--        <script src="Chart.min.js"></script>-->
    </head>
    <style>
        #canvas{
            display: none;
        }
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
    <h1 style="color:#22075E;">TOP 40 PRODUCTS</h1>

    <form id="form">
        <input type="submit" value="Find Top Products" name="submit" style="width:170px; height:35px" class="button"/>
    </form><br><br><br>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<center>
    <div id="canvas">
        <canvas id="myChart" style="width:100%;max-width:1200px"></canvas>
        <button id="download" onclick="generatePDF()">Download</button>
    </div>
</center>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"
        integrity="sha512-GsLlZN/3F2ErC5ifS5QtgpiJtWd43JWSuIgh7mbzZ8zBps+dvLusV+eNQATqgA/HdeKFVgA5v3S/cIrLF7QnIg=="
crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script>
            var myChart = null;
            document.getElementById("form").addEventListener("submit", startGen);

            function startGen(e) {
                e.preventDefault();
                document.getElementById("canvas").style.display = "block";
                document.getElementById("myChart").innerHTML = null;
                getReport();
            }

            function getReport() {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/report/findTop40Products", true);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var rep = JSON.parse(this.responseText);
                        var labels = [];
                        var values = [];
                        for (var i in rep) {
                            values.splice(i, 0, rep[i].total);
                            labels.splice(i, 0, rep[i].id + " = " + rep[i].store);
                        }
                        renderReport(labels, values);
                    } else {
                        console.log("an error in response");
                    }
                };
                xhr.send();
            }



            function renderReport(labels, values) {
                if (myChart != null) {
                    myChart.destroy();
                }
                myChart = new Chart("myChart", {
                    type: "pie",
                    data: {
                        labels: labels,
                        datasets: [{
                                label: "Results",
                                backgroundColor: "orange",
                                borderColor: "white",
                                data: values
                            }]}
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
