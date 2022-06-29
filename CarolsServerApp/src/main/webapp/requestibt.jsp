<%-- 
    Document   : logstock
    Created on : 20 Jun 2022, 20:18:43
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="co.za.carolsBoutiqueServer.boutique.model.Boutique"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Size"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>request ibt</title>
    </head>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
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
        .multicolortext {
            background-image: linear-gradient(to left, violet, indigo, green, blue, yellow, orange, red);
            -webkit-background-clip: text;
            -moz-background-clip: text;
            background-clip: text;
            color: transparent;
        }
    </style>
</head>
<body style="text-align:center; background-color:#D8C6B7;">
    <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
    <hr color="#22075E">
    <br>
    <h1>Request an IBT</h1>

    <%Map<String, String> availableStock = (Map<String, String>)request.getAttribute("availableStock");%>
    <%List<Boutique> boutiques = (List<Boutique>) request.getAttribute("boutiques");%>
    <%List<Size> sizes = (List<Size>) request.getAttribute("sizes");%>
    
    <%if (availableStock == null) {%>
    <form action="ProductServlet" method = "get">
        <table style="width:100">
            <label style="color:#22075E;"><b>Product Code   : </b></label>
            <input type="text" placeholder="Enter a product Code" name="productId" style="width:165px; height:23px" required>
            <br><br/>
        </table><br>
        <input type="submit" value="findStockOfProduct" name="submit" style="width:170px; height:35px" class="button"/>
    </form>
    <%}%>

    <%if (availableStock != null) {%>

    <form action="IbtServlet" method="post">
        <table style="width:100">
            <label style="color:#22075E;"><b>Email   : </b></label>
            <input type="text" placeholder="Enter an email address" name="customerEmail" style="width:165px; height:23px" required> 
            <br><br/>
            <label style="color:#22075E;"><b>Boutique   : </b></label>
            <select name="boutique">
                <ol>
                    <%for(Boutique bout : boutiques){%>
                      
                        <%if(availableStock.containsKey(bout.getId())){%>
                        
                    <li><option label="<%=bout.getLocation()%>" value="<%=bout.getId()%>"><%=bout.getLocation()%></option></li>
                        <%}
                    }%>
                </ol>
            </select>
            <br><br>
        </table><br>
        <input type="submit" value="requestIBT" name="submit" style="width:110px; height:35px" class="button"/>
    </form>
    <%}%>


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
