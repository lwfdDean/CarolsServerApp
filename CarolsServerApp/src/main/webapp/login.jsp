<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>login</title>
        <style>
            img:hover {
                animation: shake 0.5s;
                animation-iteration-count: infinite;
            }

            @keyframes shake {
                0% {
                    transform: translate(1px, 1px) rotate(0deg);
                }
                10% {
                    transform: translate(-1px, -2px) rotate(-1deg);
                }
                20% {
                    transform: translate(-3px, 0px) rotate(1deg);
                }
                30% {
                    transform: translate(3px, 2px) rotate(0deg);
                }
                40% {
                    transform: translate(1px, -1px) rotate(1deg);
                }
                50% {
                    transform: translate(-1px, 2px) rotate(-1deg);
                }
                60% {
                    transform: translate(-3px, 1px) rotate(0deg);
                }
                70% {
                    transform: translate(3px, 1px) rotate(-1deg);
                }
                80% {
                    transform: translate(-1px, -1px) rotate(1deg);
                }
                90% {
                    transform: translate(1px, 2px) rotate(0deg);
                }
                100% {
                    transform: translate(1px, -2px) rotate(-1deg);
                }
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
                background-color: #585D87;
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
            .tab {
                margin-right: 2.7em
            }
        </style>
    </head>

    <body style="text-align:center; background-color:#D8C6B7;">
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <hr color="#22075E"><br><br>
    <center>
        <div align="center">
            <center><h2 style="color:#22077E;"><i><u>EMPLOYEE LOGIN PAGE</u></i></h2></center>
            <form action="EmployeeServlet" method="post">
                <table style="width:100">

                    <label style="color:#22075E;"><b>Employee Id    : </b></label>
                    <input type="text" placeholder="Employee id" name="id" style="width:165px; height:23px" required> 
                    <br><br/>
                    <label style="color:#22075E;"><b>Password    : </b></label>
                    <input type="password" placeholder="Password" name="password" style="width:165px; height:23px" required>
                </table> <br>
                <input type="submit" value="Login" name="submit" style="width:110px; height:35px" class="button"/>

            </form>
        </div><br>
        <hr width="400px;" color="#22075E">       
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