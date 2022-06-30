<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Product"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Category"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Size"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>LOG STOCK</title>
    </head>
    <style>
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
    <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
    
    <p style="color:#22075E" class="topnav-left"><b><u>Teller name</u> : <%=employee.getName()%></b></p>
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
    
    <br>
    <h1 color="#22075E"><u>LOG STOCK</u></h1>
    <%List<Category> categories = (List<Category>)request.getAttribute("categories");%>
    <%List<Size> sizes = (List<Size>)request.getAttribute("sizes");%>
    <%Product product = (Product)request.getAttribute("product");%>
    <%String prodId = (String)request.getAttribute("productId");%>
    <%String reply = (String)request.getAttribute("reply");%>
    <%if(reply!=null){%>
    <script>alert("<%=reply%>")</script>
    <%}%>
    <form action="ProductServlet" method="get">
        <%if (prodId == null) {%>
        <label>Product Id:<input type="text" name="productId"></label><br>
            <%}else{%>
        <label>Product Id:<input type="text" name="productId" placeholder="<%=prodId%>"></label><br>
            <%}%>    
        <input type="submit" name="submit" value="findProductToLogStock">
    </form><br><br><br><br><br><br>
    <form action="ProductServlet" method="post">
    <%if (prodId!=null){%>
    <%if (product!=null) {%>
        <input type="text" name="notnull" value="notnull" hidden> 
        <label>Product Id: <input type="text" name="id" placeholder="<%=product.getId()%>" value="<%=product.getId()%>" readonly></label><br>
        <label>Name: <input type="text" name="name" placeholder="<%=product.getName()%>" readonly></label><br>
        <label>Description: <input type="text" name="descript" placeholder="<%=product.getDescription()%>" readonly></label><br>
        <label>Color: <input type="text" name="color" placeholder="<%=product.getColor()%>" readonly></label><br>
        <label>Price: <input type="text" name="price" placeholder="<%=product.getPrice()%>" readonly></label><br><br>
        <label>Sizes:</label><br>
        <ol>
            <%for(Size size:product.getSizes()){%>
            <li><label><%=size.getName()%></label></li><br>
                    <%}%>
        </ol><br>
        <label>Categories:</label><br><br>
        <ol>
            <%for(Category category:product.getCategories()){%>
            <li><label><%=category.getName()%></label></li><br>
                    <%}%>
        </ol><br><br><br><br>
        <select name="sizeLogged">
            <ol>
                <%for(Size size:product.getSizes()){%>
                <li><option label="<%=size.getName()%>" value="<%=size.getId()%>"><%=size.getName()%></option></li><br>
                <%}%>
            </ol>
        </select>
        <%}else{%>
        <input type="text" name="notnull" value="null" hidden> 
        <label>Product Id: <input type="text" name="id"></label><br>
        <label>Name: <input type="text" name="name"></label><br>
        <label>Description: <input type="text" name="descript"></label><br>
        <label>Color: <input type="text" name="color"></label><br>
        <label>Price: <input type="text" name="price"></label><br><br>
        <label>Sizes:</label><br>
        <ol>
            <%for(Size size:sizes){%>
            <li><label><%=size.getName()%><input type="checkbox" name="<%=size.getName()%>" value="<%=size.getId()%>"></label></li><br>
                    <%}%>
        </ol><br>
        <label>Categories:</label><br><br>
        <ol>
            <%for(Category category:categories){%>
            <li><label><%=category.getName()%> <input type="checkbox" name="<%=category.getName()%>" value="<%=category.getId()%>"></label></li><br>
                    <%}%>
        </ol><br><br><br><br>
        <select name="sizeLogged">
            <ol>
                <%for(Size size:sizes){%>
                <li><option label="<%=size.getName()%>" value="<%=size.getId()%>"><%=size.getName()%></option></li><br>
                <%}%>
            </ol>
        </select>
        <%}%>
        <label>Quantity being added: <input type="number" min="1" max="100" name="quantity"></label><br>
        <input type="submit" name="submit" value="logStock">   
    <%}%>
    </form>
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
