<%-- 
    Document   : register
    Created on : 20 Jun 2022, 11:56:02
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </style>   

    </head>
    <body style="text-align:center; background-color:#D8C6B7;">
        <img src="images\carolsboutique.png" alt="logo" height="150" width="170">
        <hr color="#22075E"><br>   

    <body>
    <center>
        <center><h2 style="color:#22077E;"><i><u>REGISTER  A  NEW  BOUTIQUE</u></i></h2></center><br>
        <form action="/" method="post">
            <label style="color:#22075E;"><b>Location : </b></label>
            <input type="text" placeholder="location" name="location" required>
            <br><br>
            <label style="color:#22075E;"><b>Daily target : </b></label>
            <input type="text" placeholder="daily target" name="dailyTarget" required>
            <br><br><!-- comment -->
            <label style="color:#22075E;"><b>Monthly target : </b></label>
            <input type="text" placeholder="monthly target" name="monthlyTarget" required>
            <br><br>
            <label style="color:#22075E;"><b>password : </b></label>
            <input type="password" placeholder="password" name="password" required>
            <br><br>
            <input type="submit" name="submit" value="Submit" style="width:110px; height:35px" class="button"/>
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
