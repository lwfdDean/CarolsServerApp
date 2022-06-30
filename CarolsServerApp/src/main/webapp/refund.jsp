
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="co.za.carolsBoutiqueServer.Sale.model.Sale"%>
<%@ page import="co.za.carolsBoutiqueServer.product.model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Refund</title>
    </head>
    <style>
            .form-container{
                max-width: 300px;
                padding: 10px;
                background-color: white;
            }
            #verifyManagerCode{
                display:none;
                position: center;
                z-index: 90
            }
            #promoForm{
                display:none;
                position: center;
                z-index: 90
            }
            #itemToRemove{
                display:none;
                position: relative;
                z-index: 90
            }
            #preview{
                width:500px;
                height: 500px;
                margin:0px auto;
                display: none;
                z-index: 20
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
                z-index: 100;
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
                z-index: 100;
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
            .topnav-right {
                float: right;
            }
        </style>
    </head>
    <center>
    <body style="text-align:center; background-color:#D8C6B7;">
    
        <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
        <hr color="#22075E">
        <br>
        <h1>REFUND AN ITEM</h1>
        
        <%Sale sale = (Sale)request.getAttribute("sale");%>
        
        <%if(sale==null){%>
        <form action="SaleServlet" method="get">
             <table style="width:100">
                    <label style="color:#22075E;"><b>Sale Id   : </b></label>
                    <input type="text" placeholder="Sale Id" name="saleId" style="width:165px; height:23px" required> 
                    <br><br/>
             </table><br>
            <input type="submit" value="findSaleInfo" name="submit" style="width:110px; height:35px" class="button"/>
        </form>
        <%}%>
        
        <%if(sale!=null){%>
        <form action="SaleServlet" method="post">
            <input name="saleId" type="text" value="<%=sale.getId()%>" hidden>
            <label style="color:#22075E;"><b>Customer email : </b></label>
            <input type="text" placeholder="Enter the customer email" name="customerEmail" style="width:165px; height:23px" required> 
            <br><br/>
            <label style="color:#22075E;"><b>Card number   : </b></label>
            <input type="text" placeholder="Enter the card number" name="cardNumber" style="width:165px; height:23px" required> 
            <br><br/>
             <table style="width:100">
             <label style="color:#22075E;"><b>Product : </b></label>
             <select name="product">
                <ol>
                    <%for(Product prod : sale.getItems()){%>
                    <li><option label="<%=prod.getName()%>" value="<%=prod.getId()%>"><%=prod.getName()%></option></li>
                    <%}%>
                </ol>
            </select>
                    
             </table><br>
            <input type="submit" value="refund" name="submit" style="width:110px; height:35px" class="button"/>
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
    </center>
</body>
</html>
