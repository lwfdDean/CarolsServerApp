<%-- 
    Document   : logstock
    Created on : 20 Jun 2022, 20:18:43
    Author     : Administrator
--%>

<%@ page import="co.za.carolsBoutiqueServer.Sale.model.Sale"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Product"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>exchange</title>
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
        <%Sale sale = (Sale)request.getAttribute("sale");%>
         <%String saleId = (String)request.getAttribute("saleId");%>
        <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
        <hr color="#22075E">
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
