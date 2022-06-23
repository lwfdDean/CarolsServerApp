<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Product"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Category"%>
<%@page import="co.za.carolsBoutiqueServer.product.model.Size"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>log new stock</title>
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
        <%
            List<Category> categories = (List<Category>)request.getAttribute("categories");
            List<Size> sizes = (List<Size>)request.getAttribute("sizes");
            Product product = (product)request.getAttribute("product");
            String prodId = (String)request.getAttribute("productId");
        %>
        <img src="images\carolsboutique.png" alt="logo" height="150" width="190">
        <hr color="#22075E">
        <br>
        <h1>Log new stock</h1>
        <form action="ProductServlet" method="get">
            <%if (prodId == null) {%>
                <label>Product Id:<input type="text" name="productId"></label><br>
            <%}else{%>
                <label>Product Id:<input type="text" name="productId" placeholder="<%=prodId%>"></label><br>
            <%}%>    
            <input type="submit" name="submit" value="findProductToLogStock">
        </form><br><br><br><br><br><br>
        <%if (prodId!=null)%>
            <form action="ProductServlet" method="post">   
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
                <%for(Category size:product.getCaegories()){%>
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
                <%for(Category size:categories){%>
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
