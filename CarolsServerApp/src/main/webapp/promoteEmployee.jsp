<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>promote Employee</title>
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
        </style>
    </head>

    <body style="text-align:center; background-color:#D8C6B7;">
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <hr color="#22075E"><br><br>

    <center>
        <div align="center">
            <center><h2 style="color:#22077E;"><i><u>PROMOTE EMPLOYEE TO MANAGER</u></i></h2></center>
            <form action="EmployeeServlet" method="post"> 
                <label>Manager<input type="radio" name="role" value="man101"></label>
                <label>Teller<input type="radio" name="role" value="tel101"></label>
                <label>Employee ID: <input type="text" name="employeeId" required></label><br>
                <label>Password: <input type="password" name="password" required>*only if teller is selected</label>
                <label>Manager Unique Code: <input type="password" name="managercode">*only if manager is selected</label>
<!--                <table style="width:100">
                    <label style="color:#22075E;"><b>Select employee : </b></label>
                    <select name="name" style="width:170px; height:30px">
                        <option value="1" > Select teller</option>
                    </select> 
                    <br>
                    <label style="color:#22075E;"><b>New password    : </b></label>
                    <input type="password" placeholder="Password" name="password" style="width:165px; height:23px" required>
                </table><br>-->
                <input type="submit" value="promoteEmployee" name="submit"> 
            </form>
        </div>
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