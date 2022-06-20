<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="refresh" content="5.2; URL=login.jsp" />
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
</style>
</head>
<body style="text-align:center; background-color:#D8C6B7;">
<img src="images\carolsboutique.png" alt="logo" height="150" width="170">



<div class="navbar">
  <a href="#home">Home</a>
  <a href="login.jsp">Login</a>
  <div class="dropdown">
    <button class="dropbtn">Boutiques 
      <i class="fa fa-caret-down"></i>
    </button>
    
  </div> 
</div><br>
<marquee style="color:#09192F; font-size:25px;" width="60%" direction="right" height="100px" scrollamount="19.4"><h1><b>WELCOME TO</b></h1></marquee>
<br>
<marquee style="color:#ff4000; font-size:25px;" width="60%" direction="left" height="100px" scrollamount="19.4"><h1><b>CAROL'S BOUTIQUE</b></h1></marquee>

<br><br><br><hr color="#22075E">
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