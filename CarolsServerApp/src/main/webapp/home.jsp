<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="co.za.carolsBoutiqueServer.employee.model.Employee"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>home</title>
        <style>
            div.scroll {
                margin:4px, 4px;
                padding:4px;
                background-color: #E8BDB4;
                width: 700px;
                height: 250px;
                overflow-x: hidden;
                overflow-y: auto;
                text-align:justify;
            }
            * {
                box-sizing: border-box;
            }

            /* Create two equal columns that floats next to each other */
            .column {
                float: left;
                width: 50%;
                padding: 10px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }
            /* Style the buttons */
            .btn {
                border: none;
                outline: none;
                padding: 12px 16px;
                background-color: #f1f1f1;
                cursor: pointer;
            }

            .btn:hover {
                background-color: #ddd;
            }

            .btn.active {
                background-color: #666;
                color: white;
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
        <%Employee employee = (Employee)request.getSession(false).getAttribute("employee");%>
        <%String reply = (String)request.getAttribute("reply");%>
        <%if(reply!=null){%>
        <script>alert("<%=reply%>");</script>
        <%}%>

        <%String exchangeReply = (String)request.getAttribute("exchangeReply");%>
        <%if(exchangeReply!=null){%>
        <script>alert("<%=exchangeReply%>");</script>
        <%}%>

        <%String refundReply = (String)request.getAttribute("refundReply");%>
        <%if(refundReply!=null){%>
        <script>alert("<%=refundReply%>");</script>
        <%}%>
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <br>
        <p style="color:#22075E" class="topnav-left"><b><u>Teller name</u> : <%=employee.getName()%></b></p>
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
            <!-- <a href="report.jsp">REPORT</a> -->

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
        <h3 style="color:#22075E"><u>HOW TO USE CAROL'S BOUTIQUE SYSTEM</u></h3>
        
        <!--The manual start here-->
    <center>
        <div class="scroll">
        
            <h5></h5><br><u>MENU OPTION </u><br><br>Tab Menu for employee and boutique's related settings.<br>* To register a new employee<br><!--  -->
        * To promote employee to teller.<br>* To register a new boutique.<br>* to update boutique's targets.<br><br><!-- comment -->
        <u>SALE OPTION </u><br><br>Tab Sale for sale related things.<br><strong>*</strong> To make a sale click new sale<br> Scan product's barcode<br>
        * Exchange a product (Enter product id to exchange)<br><!-- comment -->
        * Return a product (Enter product id to return to stock).<br>
        <br><u>IBT OPTION </u><br><br>
        IBT means Inter Branch Transfer of a product.<br>
        * Approve IBT (Aprrove ibt request from<br>other stores only if you have <br> the requested product).<br><!-- comment -->
        * Request an IBT (Request a product from other branch for a customer).<br>when your store has no stock or size<br>
         
        <br><!-- comment -->
        <br><u>KEEP ASIDE OPTION </u><br><br>
        Keep aside a product for a customer for later purchase<br><!-- comment -->
        And capture a sale when a customer collect the item.<br><br><!-- comment -->
        
        <br><u>LOGS STOCK OPTION </u><br><br>
        Capture new stock <br><!-- comment -->
        
        <br><u>REPORTS OPTION</u><br><br>
        * View Top achieving store <br>Report of the highest rated store in terms of sales.<br><!-- comment -->
        * View selling employee <br>Report of the highest selling employee in terms product.<br>
        * Monthly sales<br>View report of total sales made for specific month<br><!-- comment -->
        * Reached target<br> View boutique that reached the daily target.<br><!-- comment -->
        * Top 40 product <br> View report on the top 40 highest selling,<br> product and the store that sold the most.<br><!-- comment -->
        * Worst performing stores <br> View the least performing stores for a certain period<br>(intervals of 3 and 6 months).<br><!-- comment -->
        * Product Report <br> View report on a chosen product i.e how many were sold,<br> and the top salesperson across all stores.<br>
        * Current daily sales <br> View current sales for the current day.<br>
        
        <br><u> PRODUCT OPTION</u><br><br>
        * Add promocode<br><!-- comment -->
        Add promotional code for product on special.<br><!-- comment -->
        * Put product on sale.<br>
        
        
        </div>
        <!<!-- Manual ends here -->
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