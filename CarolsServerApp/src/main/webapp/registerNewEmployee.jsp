<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.List" %>
<%@page import = "co.za.carolsBoutiqueServer.boutique.model.Boutique" %>
<%@page import = "co.za.carolsBoutiqueServer.employee.model.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>register</title>
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
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170"
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
                <a href="home.jsp">HOME</a>
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

    <body>
        <%List<Boutique> boutiques = (List<Boutique>) request.getAttribute("boutiques");%>
        <%List<Role> rs = (List<Role>) request.getAttribute("roles");%>

    <center>
        <center><h2 style="color:#22077E;"><i><u>REGISTER  A  NEW  EMPLOYEE</u></i></h2></center><br>
        <form action="EmployeeServlet" method="post">          
            <ol> 
                <label style="color:#22075E;"><b>Role : </b></label>
                <%for(Role role : rs){%>
                <label><input type="radio" value="<%=role.getId()%>" name="roleId" required="required"><%=role.getName()%></option></label>
                    <%}%>
            </ol>
            <br>
            <div>
                <label style="color:#22075E;"><b>Name : </b></label>
                <input type="text" placeholder="Enter Employee Name" name="name" required>
                <br><br>
                <label style="color:#22075E;"><b>Surname : </b></label>
                <input type="text" placeholder="Enter Employee Surname" name="surname" required>
                <br><br>
                <label style="color:#22075E;"><b>Email Address : </b></label>
                <input type="text" placeholder="Enter Employee email" name="emailAddress" required>
                <br><br><!-- comment -->
                <label style="color:#22075E;"><b>Password : </b></label>
                <input type="password" placeholder="Enter a password 8 characters long" name="password" required>
                <br><br>
                <label style="color:#22075E;"><b>Manager Unique code : </b></label>
                <input type="password" placeholder="Enter a manager code 6 characters long" name="managerCode" required>
                <br><br>
                <label style="color:#22075E;"><b>Boutique : </b></label>
                <select name="boutique">
                    <ol>
                        <%for(Boutique bout : boutiques){%>
                        <li><option label="<%=bout.getLocation()%>" value="<%=bout.getId()%>"><%=bout.getLocation()%></option></li>
                        <%}%>
                    </ol>
                </select>
                <br><br>
                <input type="submit" name="submit" value="register" style="width:110px; height:35px" class="button"/>
        </form>
    </div>
    <br>
    <hr width="400px;" color="#22075E">       
    <span style="Font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"><span style="font-size:8pt; vertical-align: text-bottom;">
            <strong style="color:#22075E;">© Copyright 
                <span style="color:#22075E;" id="ctl00_YearLbl">2022</span>, Carol's Boutique (Pty) Ltd. All rights reserved.<br />A Fashion Company.<br/>      
            </strong><p style="color:#22075E;">All brands, trademarks, tradenames, and logos are the<br/> property of Carol's Boutique.</p>
            <strong style="color:#22075E;"><i><u>Developed by LWFD-SHOWROOM-GROUP.</u></i></strong>  
            <br />
        </span>
    </span>	   
</center>    
</body>
</html>
