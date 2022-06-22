<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.List" %>
<%@page import = "co.za.carolsBoutiqueServer.boutique.model.Boutique" %>
<%@page import = "co.za.carolsBoutiqueServer.employee.model.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

            /* Dropdown Button */
            .dropbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
            }

            /* Dropdown button on hover & focus */
            .dropbtn:hover, .dropbtn:focus {
                background-color: #3e8e41;
            }

            /* The search field */
            #myInput {
                box-sizing: border-box;
                background-image: url('searchicon.png');
                background-position: 14px 12px;
                background-repeat: no-repeat;
                font-size: 16px;
                padding: 14px 20px 12px 45px;
                border: none;
                border-bottom: 1px solid #ddd;
            }

            /* The search field when it gets focus/clicked on */
            #myInput:focus {
                outline: 3px solid #ddd;
            }

            /* The container <div> - needed to position the dropdown content */
            .dropdown {
                position: relative;
                display: inline-block;
            }

            /* Dropdown Content (Hidden by Default) */
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f6f6f6;
                min-width: 230px;
                border: 1px solid #ddd;
                z-index: 1;
            }

            /* Links inside the dropdown */
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            /* Change color of dropdown links on hover */
            .dropdown-content a:hover {
                background-color: #f1f1f1
            }

            /* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
            .show {
                display:block;
            }


        </style>   

    </head>
    <body style="text-align:center; background-color:#D8C6B7;">
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <hr color="#22075E"><br><br>    

    <body>
        <%List<Boutique> boutiques = (List<Boutique>) request.getAttribute("boutiques");%>
        <%List<Role> rs = (List<Role>) request.getAttribute("roles");%>

    <center>
        <center><h2 style="color:#22077E;"><i><u>REGISTER  A  NEW  EMPLOYEE</u></i></h2></center><br>
        <form action="EmployeeServlet" method="post">
            <label style="color:#22075E;"><b>Role : </b></label>
<!--            <select>-->
                <ol>
                    <%for(Role role : rs){%>
                    <li><input type="radio" value="<%=role.getId()%>" name="roleId"><%=role.getName()%></option></li>
                    <%}%>
                </ol>
<!--            </select>--><br>
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
