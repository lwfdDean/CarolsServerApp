<%@ page import="co.za.carolsBoutiqueServer.Sale.model.Sale"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Product"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>exchange</title>
    </head>
    <style>
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
            z-index: 100;
        }

        .navbar a {
            float: left;
            font-size: 16px;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            z-index: 100;
        }

        .dropdown {
            float: left;
            overflow: hidden;
            z-index: 100;
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
            z-index: 100;
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
            z-index: 100;
        }

        .dropdown-content a {
            float: none;
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
            z-index: 100;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
            z-index: 100;
        }

        .dropdown:hover .dropdown-content {
            display: block;
            z-index: 100;
        }

        .column {
            float: left;
            width: 33.33%;
            padding: 5px;
        }
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
        <%Sale sale = (Sale)request.getAttribute("sale");%>
         <%String saleId = (String)request.getAttribute("saleId");%>
        <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
        <div class="navbar">
        <div class="dropdown">
            <a href="home.jsp">HOME</a>
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
        <h1>EXCHANGE A PRODUCT</h1>
        
            <%if (saleId == null) {%>
                <form action="SaleServlet" method="get">
                    <label>Sale Id:<input type="text" name="saleId"></label><br>
                    <input type="submit" name="submit" value="findSale">
                </form>
            <%}else{%>
                <form action="SaleServlet" method="post">
                <table style="width:100">
                <label style="color:#22075E;"><b>Email Address : </b></label>
                <input type="text" placeholder="Enter customer email" name="emailAddress" required>
                <br><br><!-- comment -->
                <label style="color:#22075E;"><b>New product id : </b></label>
                <input type="text" placeholder="Enter New product" name="newProduct" required>
                <br><br><!-- comment -->
                <label style="color:#22075E;"><b>Product to be exchanged: </b></label>
                <ol>
                    <%for(Product p : sale.getItems()){%>
                        <%if(p.get)%>
                            <li><input type="radio" value="<%=p.getId()%>" name="oldProduct"><%=p.getName()%>   <%=p.getPrice()%></option></li>
                            <input name="price" type="text" value="<%=p.getPrice()%>"hidden>
                        <%}%>    
                    <%}%>
                </ol>         
                <input type="submit" name="submit" value="exchange">
                </form>
            </table>  
            <%}%>    
        </form><br><br>
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
