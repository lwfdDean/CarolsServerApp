
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="co.za.carolsBoutiqueServer.employee.model.Employee"%>
<%@ page import="co.za.carolsBoutiqueServer.Sale.model.Sale"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Product"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,
              initial-scale=1, shrink-to-fit=no" />
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></script>
        <title>New Sale</title>
        <style>
            #removeSaleLineItem{
                display:none;
                position: relative;
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
            .topnav-right {
                float: right;
            }
        </style>
    </head>

    <body style="text-align:center; background-color:#D8C6B7;">
        <%Employee emp = (Employee)request.getSession(false).getAttribute("employee");%>

        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <br>
        <p style="color:#22075E" class="topnav-left"><b><u>Teller name</u> : <%=emp.getName()%></b></p>
        <div class="navbar">
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
    <center><h2 style="color:#22077E;"><i><u>MAKING A NEW SALE</u></i></h2></center><br>
    <center>
        <script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
        <script src="<a class="vglnk" href="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js" rel="nofollow"><span>https</span> < span > ://</span><span>rawgit</span><span>.</span><span>com</span><span>/</span><span>schmich</span><span>/</span><span>instascan</span><span>-</span><span>builds</span><span>/</span><span>master</span><span>/</span><span>instascan</span><span>.</span><span>min</span><span>.</span><span>js</span></a>"></script>
        <script src="https://cdn.jsdelivr.net/npm/dynamsoft-javascript-barcode@9.0.2/dist/dbr.js"></script>
        <input type="text" name="id" id="prod">
        <button id="findProduct">Find Product</button>
        <div id="display"></div><br><br>
        <button id="removeItem">Remove Item</button>
        <label>Customer Email: <input type="text" name="id" id="email" required></label><br>
        <label>Card Number: <input type="text" name="id" id="card" required></label><br>
        <button id="checkout">Checkout</button>
        <div id="reply"></div>

        <script>
            let items = [];
            var index = 0;
            var totalPrice = 0;
            document.getElementById("findProduct").addEventListener("click", getProduct);
            document.getElementById("checkout").addEventListener("click", checkout);
            document.getElementById("removeItem").addEventListener("click", function(){
                document.getElementById("removeSaleLineItem").style.display = "block";
            });
            
            function closePopup(){
                 document.getElementById("removeSaleLineItem").style.display = "none";
            }
            
            function submitCode(){
                var manaCode = document.getElementById("managerCode").value;
                var storeId = "<%=emp.getBoutique()%>";
                var map = new Map();
                map.set(storeId,manaCode);
                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function(){
                    if(this.readyState == 4){
                        var rep = this.responseText;
                        if(rep == "Code valid"){
                            var output = "<ol>";
                            for(var i in items){
                                output += "<li>" +
                                        "<label>" + items[i].name + "-" + items[i].color +":  " +
                                        "<input id='productSelected' type='radio' name='sli' value='"+items[i].id+"'>"+
                                        "</label>" +
                                        "</li><br>";
                            }
                            output += "</ol><br>";
                            
                            document.getElementById("checkList").innerHTML = output;
                            document.getElementById("itemToRemove").style.display = "block";
                        }
                    }
                };
                xhr.open("POST", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/verifyManagerCode", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.send(JSON.stringify(map));
            }
            
            function cancelRemove(){
                document.getElementById("itemToRemove").style.display = "none";
            }
                
            function removeSLI(){
                document.getElementById("itemToRemove").style.display = "none";
                var idSelected = document.getElementById("productSelected").value;
                for(var i in items){
                    if(items[i].id == idSelected){
                        items.splice(i,1);
                    }    
                }
                let output = "";
                        output += "<table class='table table-nordered'>" +
                                "<thead>" +
                                "<tr>" +
                                "<th class='per70 text-center'>Item</th>" +
                                "<th class='per70 text-center'>Price</th>" +
                                "<th class='per70 text-center'>Discounted Price</th>" +
                                "</tr>" +
                                "</thead>" +
                                "<tbody>";
                        let calculatedTotal = 0;
                        for (var i in items) {
                            console.log[items[i]];
                            calculatedTotal += items[i].discountedPrice;
                            console.log(totalPrice);
                            output += "<tr height='35px'>" +
                                    "<td>" + items[i].name + "</td>" +
                                    "<td class='text-center'>" + items[i].price + "</td>" +
                                    "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                                    "</tr>";
                        }
                        totalPrice = calculatedTotal;
                        output += "</tbody>" +
                                "<tfoot>" +
                                "<tr>" +
                                "<th colspan='3' class='text-right'>Total</th>" +
                                "<th class='text-center'>" + totalPrice + "</th>" +
                                "</tr>" +
                                "</tofoot>" +
                                "</table>";
                        console.log(output);
                        document.getElementById("display").innerHTML = output;
            }    
            
            function getProduct() {
                var proid = document.getElementById("prod").value;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProduct/" + proid, true);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var product1 = JSON.parse(this.responseText);
                        let sizes = [];
                        let categories = [];
                        for (var i in product1.categories) {
                            categories.splice(i, 0, new Category(product1.categories[i].id, product1.categories[i].name));
                            console.log(categories[i]);
                        }
                        for (var i in product1.sizes) {
                            sizes.splice(i, 0, new Size(product1.sizes[i].id, product1.sizes[i].name));
                        }
                        items.splice(index, 0, new Product(
                                product1.id,
                                product1.name,
                                product1.description,
                                sizes,
                                product1.color,
                                product1.price,
                                product1.discountedPrice,
                                categories));
                        console.log[items[index]];
                        index++;
                        let output = "";
                        output += "<table class='table table-nordered'>" +
                                "<thead>" +
                                "<tr>" +
                                "<th class='per70 text-center'>Item</th>" +
                                "<th class='per70 text-center'>Price</th>" +
                                "<th class='per70 text-center'>Discounted Price</th>" +
                                "</tr>" +
                                "</thead>" +
                                "<tbody>";
                        let calculatedTotal = 0;
                        for (var i in items) {
                            console.log[items[i]];
                            calculatedTotal += items[i].discountedPrice;
                            console.log(totalPrice);
                            output += "<tr height='35px'>" +
                                    "<td>" + items[i].name + "</td>" +
                                    "<td class='text-center'>" + items[i].price + "</td>" +
                                    "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                                    "</tr>";
                        }
                        totalPrice = calculatedTotal;
                        output += "</tbody>" +
                                "<tfoot>" +
                                "<tr>" +
                                "<th colspan='3' class='text-right'>Total</th>" +
                                "<th class='text-center'>" + totalPrice + "</th>" +
                                "</tr>" +
                                "</tofoot>" +
                                "</table>";
                        document.getElementById("display").innerHTML = output;
                    }
                };
                xhr.send();
            }

            function getProduct2(productId) {
                let proid = productId;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findProduct/" + proid, true);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var product1 = JSON.parse(this.responseText);
                        let sizes = [];
                        let categories = [];
                        for (var i in product1.categories) {
                            categories.splice(i, 0, new Category(product1.categories[i].id, product1.categories[i].name));
                            console.log(categories[i]);
                        }
                        for (var i in product1.sizes) {
                            sizes.splice(i, 0, new Size(product1.sizes[i].id, product1.sizes[i].name));
                        }
                        items.splice(index, 0, new Product(
                                product1.id,
                                product1.name,
                                product1.description,
                                sizes,
                                product1.color,
                                product1.price,
                                product1.discountedPrice,
                                categories));
                        console.log[items[index]];
                        index++;
                        let output = "";
                        output += "<table class='table table-nordered'>" +
                                "<thead>" +
                                "<tr>" +
                                "<th class='per70 text-center'>Item</th>" +
                                "<th class='per70 text-center'>Price</th>" +
                                "<th class='per70 text-center'>Discounted Price</th>" +
                                "</tr>" +
                                "</thead>" +
                                "<tbody>";
                        let calculatedTotal = 0;
                        for (var i in items) {
                            console.log[items[i]];
                            calculatedTotal += items[i].discountedPrice;
                            console.log(totalPrice);
                            output += "<tr height='35px'>" +
                                    "<td>" + items[i].name + "</td>" +
                                    "<td class='text-center'>" + items[i].price + "</td>" +
                                    "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                                    "</tr>";
                        }
                        totalPrice = calculatedTotal;
                        output += "</tbody>" +
                                "<tfoot>" +
                                "<tr>" +
                                "<th colspan='3' class='text-right'>Total</th>" +
                                "<th class='text-center'>" + totalPrice + "</th>" +
                                "</tr>" +
                                "</tofoot>" +
                                "</table>";
                        console.log(output);
                        document.getElementById("display").innerHTML = output;
                    }
                };
                xhr.send();
            }

            function checkout() {
                var email = document.getElementById("email").value;
                var card = document.getElementById("card").value;
                var sale = new Sale("", "<%=emp.getId()%>", false, totalPrice, items, "<%=emp.getBoutique()%>", card, email);
                var toSend = JSON.stringify(sale);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/checkout", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.send(toSend);
            }

            function Category(id, name) {
                this.id = id;
                this.name = name;
            }

            function Size(id, name) {
                this.id = id;
                this.name = name;
            }

            function Product(id, name, description, sizes, color, price, discountedPrice, categories) {
                this.id = id;
                this.name = name;
                this.description = description;
                this.sizes = sizes;
                this.color = color;
                this.price = price;
                this.discountedPrice = discountedPrice;
                this.categories = categories;
            }

            function Sale(id, employee, approved, totalPrice, items, boutique, cardNumber, customerEmail) {
                this.id = id;
                this.employee = employee;
                this.approved = approved;
                this.totalPrice = totalPrice;
                this.items = items;
                this.boutique = boutique;
                this.cardNumber = cardNumber;
                this.customerEmail = customerEmail;
            }

            var scanner = new Instascan.Scanner({video: document.getElementById('preview'), scanPeriod: 5, mirror: false});
            scanner.addListener('scan', function (content) {
                console.log(content);
                if (content.length == 13) {
                    getProduct2(content);
                }
                //window.location.href=content;
            });
            Instascan.Camera.getCameras().then(function (cameras) {
                if (cameras.length > 0) {
                    scanner.start(cameras[0]);
                    $('[name="options"]').on('change', function () {
                        if ($(this).val() == 1) {
                            if (cameras[0] != "") {
                                scanner.start(cameras[0]);
                            } else {
                                alert('No Front camera found!');
                            }
                        } else if ($(this).val() == 2) {
                            if (cameras[1] != "") {
                                scanner.start(cameras[1]);
                            } else {
                                alert('No Back camera found!');
                            }
                        }
                    });
                } else {
                    console.error('No cameras found.');
                    alert('No cameras found.');
                }
            }).catch(function (e) {
                console.error(e);
                alert(e);
            }); //style ="display:none;"
        </script>
        
        <video id="preview"></video>
        
        <div class="form-popup" id="removeSaleLineItem">
            <h1>Enter Manager Code</h1>
            <label>Manager Unique Code: <input id="managerCode" type="text" required></label><br>
            <button id="submitCode" style="background-color:green" onclick="submitCode()">Submit</button>
            <button id="closePopup" style="background-color:red" onclick="closePopup()">Close</button>
        </div>
        
        <div class="form-popup" id="itemToRemove"> 
            <div id="checkList"></div>
            <button id='remove' style='background-color:red' onClick="removeSLI()">Remove</button>
            <button id='cancelRemove' style='background-color:grey' onclick="cancelRemove()">Cancel</button>
        </div>
        
        <br><br><br> 
        <br><hr width="400px;" color="#22075E">       
        <span style="Font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"><span style="font-size:8pt; vertical-align: text-bottom;">
                <strong style="color:#22075E;">© Copyright 
                    <span style="color:#22075E;" id="ctl00_YearLbl">2022</span>, Carol's Boutique (Pty) Ltd. All rights reserved.<br />A Fashion Company.<br/>      
                </strong><p style="color:#22075E;">All brands, trademarks, tradenames, and logos are the<br/> property of Carol's Boutique.</p>
                <strong style="color:#22075E;"><i><u>Developed by LWFD-GROUP.</u></i></strong>  
                <br />
            </span>
        </span>

    </center>    

</body>
</html>