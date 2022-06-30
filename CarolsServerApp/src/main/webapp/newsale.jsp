
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"></script>
        <title>New Sale</title>
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
        <div id="display"></div><br>
        <button id="removeItem">Remove Item</button><br><br>
        <label>Customer Email: <input type="text" name="email" id="email" required></label><br>
        <label>Card Number: <input type="text" name="card" id="card" required></label><br>
        <button id="addPromoCode">Add Promo</button>
        <button id="checkout">Checkout</button>
        <div id="reply"></div>

        <script>
            let items = [];
            var index = 0;
            var totalPrice = 0;
            var promoDiscount = 0;
            var discountCategory = "";
            document.getElementById("findProduct").addEventListener("click", getProduct);
            document.getElementById("checkout").addEventListener("click", checkout);



            //verify Manager Code
            document.getElementById("removeItem").addEventListener("click", function () {
                document.getElementById("verifyManagerCode").style.display = "block";
            });
            function closeManagerPopup() {
                document.getElementById("verifyManagerCode").style.display = "none";
            }
            function submitManagerCode() {
                var manaCode = document.getElementById("managerCode").value;
                var storeId = "<%=emp.getBoutique()%>";
                var toSend = storeId + "@" + manaCode;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/employee/verifyManagerCode/" + toSend, true);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var rep = this.responseText;
                        if (rep == "Code valid") {
                            var output = "<ol>";
                            for (var i in items) {
                                output += "<li>" +
                                        "<label>" + items[i].name + "-" + items[i].color + ":  " +
                                        "<input id='productSelected' type='radio' name='sli' value='" + items[i].id + "'>" +
                                        "</label>" +
                                        "</li><br>";
                            }
                            output += "</ol><br>";

                            document.getElementById("checkList").innerHTML = output;
                            document.getElementById("managerCode").value = "";
                            document.getElementById("verifyManagerCode").style.display = "none";
                            document.getElementById("itemToRemove").style.display = "block";
                        }
                    }
                };
                xhr.send();
            }

            //remove Sale Line Item
            function cancelRemove() {
                document.getElementById("itemToRemove").style.display = "none";
            }
            function removeSLI() {
                document.getElementById("itemToRemove").style.display = "none";
                var idSelected = document.getElementById("productSelected").value;
                for (var i in items) {
                    if (items[i].id == idSelected) {
                        items.splice(i, 1);
                        break;
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
                calculateTotal();
                for (var i in items) {
                    output += "<tr height='35px'>" +
                            "<td>" + items[i].name + "</td>" +
                            "<td class='text-center'>" + items[i].price + "</td>" +
                            "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                            "</tr>";
                }
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

            //add PromoCode
            document.getElementById("addPromoCode").addEventListener("click", function () {
                document.getElementById("promoForm").style.display = "block";
            });
            function closePromo() {
                document.getElementById("promoForm").style.display = "none";
            }
            function submitPromoCode() {
                document.getElementById("promoForm").style.display = "none";
                var promoEntered = document.getElementById("getPromoCode").value;
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/product/findPromoCode/" + promoEntered, true);
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        var promo = JSON.parse(this.responseText);
                        if (promo == null) {
                            alert("promo is no longer valid");
                        } else {
                            promoDiscount = promo.discount;
                            discountCategory += promo.category;
                            calculateTotal();
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
                            for (var i in items) {
                                output += "<tr height='35px'>" +
                                        "<td>" + items[i].name + "</td>" +
                                        "<td class='text-center'>" + items[i].price + "</td>" +
                                        "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                                        "</tr>";
                            }
                            output += "</tbody>" +
                                    "<tfoot>" +
                                    "<tr>" +
                                    "<th colspan='3' class='text-right'>Total</th>" +
                                    "<th class='text-center'>" + totalPrice + "</th>" +
                                    "</tr>" +
                                    "</tofoot>" +
                                    "</table>";
                            document.getElementById("display").innerHTML = output;
                            alert("Promo discount has been Applied");
                        }
                    }
                };
                xhr.send();
            }

            //play for each barcode scanned
            function beeper(){
                var p = document.getElementById("beep");
                p.play();
            }

            function calculateTotal() {
                var calculatedTotal = 0;
                if (promoDiscount != 0) {
                    Loop1:for (var i in items) {
                        for (var j in items[i].categories) {
                            if (discountCategory.localeCompare(items[i].categories[j].id)) {
                                var price = items[i].price;
                                var d = promoDiscount / 100;
                                var e = price * d;
                                var f = price - e;
                                calculatedTotal += f;
                                continue Loop1;
                            }
                        }
                        calculatedTotal += items[i].price;
                    }
                } else {
                    for (var i in items) {
                        if (items[i].discountedPrice != 0) {
                            calculatedTotal += items[i].discountedPrice;
                        } else {
                            calculatedTotal += items[i].price;
                        }
                    }
                }
                totalPrice = calculatedTotal;

                return totalPrice;
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
                        index++;
                        calculateTotal();
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
                        for (var i in items) {
                            output += "<tr height='35px'>" +
                                    "<td>" + items[i].name + "</td>" +
                                    "<td class='text-center'>" + items[i].price + "</td>" +
                                    "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                                    "</tr>";
                        }
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
                        calculateTotal();
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
                        for (var i in items) {
                            output += "<tr height='35px'>" +
                                    "<td>" + items[i].name + "</td>" +
                                    "<td class='text-center'>" + items[i].price + "</td>" +
                                    "<td class='text-center'>" + items[i].discountedPrice + "</td>" +
                                    "</tr>";
                        }
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

            function checkout() {
                if (items.length == 0) {
                    alert("cannot checkout without any products in the cart");
                    return;
                }
                var email = document.getElementById("email").value;
                var card = document.getElementById("card").value;
                var sale = new Sale("", "<%=emp.getId()%>", false, totalPrice, items, "<%=emp.getBoutique()%>", card, email);
                var toSend = JSON.stringify(sale);
                var xhr;
                if (window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xhr.open("POST", "http://localhost:8080/carolsBoutiqueRest/CarolsBoutique/sale/checkout", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = (function (_this) {
                    return function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            alert(xhr.responseText);
                        } else {
                            console.log("an error in response");
                        }
                    };
                })(this);
                xhr.send(toSend);
                document.getElementById("display").innerHTML = "";
                document.getElementById("checkList").innerHTML = "";
                document.getElementById("prod").value = "";
                document.getElementById("email").value = "";
                document.getElementById("card").value = "";
                items = [];
                index = 0;
                totalPrice = 0;
                promoDiscount = 0;
                discountCategory = "";
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
                if (content.length == 13) {
                    getProduct2(content);
                    beeper();
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

        <div class="form-popup" id="verifyManagerCode" class="form-container">
            <h1>Enter Manager Code</h1>
            <label>Manager Unique Code: <input id="managerCode" type="password" required></label><br>
            <button id="submitManagerCode" style="background-color:green" onclick="submitManagerCode()">Submit</button>
            <button id="closeManagerPopup" style="background-color:red" onclick="closeManagerPopup()">Close</button>
        </div>

        <div class="form-popup" id="promoForm" class="form-container">
            <h1>Enter Promo Code</h1>
            <label>Promo Code: <input id="getPromoCode" type="text" required></label><br>
            <button id="submitPromo" style="background-color:green" onclick="submitPromoCode()">Submit</button>
            <button id="closePromo" style="background-color:red" onclick="closePromo()">Close</button>
        </div>

        <video id="preview"></video>
        <audio id="beep">
            <source src="C:\Users\User\Desktop\LWFD showRoom\Repository\CarolsServerApp\CarolsServerApp\src\main\webapp\audio\beep.mp3" type="audio/ogg">
            <source src="beep.mp3" type="audio/mpeg">
        </audio>

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