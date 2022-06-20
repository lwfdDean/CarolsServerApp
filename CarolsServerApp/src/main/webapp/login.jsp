<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
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
.button:hover {background-color: #3e8e41}
      </style>
      
</head>
<body style="text-align:center; background-color:#D8C6B7;">
<img src="images\carolsboutique.png" alt="logo" height="200" width="270">
<hr color="#22075E"><br>
<h2 style="color:#22077E;"><i><u>LOGIN TO CAROL'S BOUTIQUE</u></i></h2><br>
<!--#22075E-->
<form action="./Servlet1" method="post">
  <div class="container">
      
<label for="boutiques" style="color:#22075E;"><b>Select Boutique</b></label>
<select name="boutique" id="boutiqueId" width="300">
  <option>Select</option>  
  <option value="ae1673nn">Langebaan</option>
  <option value="ao8154bb">Rosebank</option>
  <option value="cd7781aB">Richards Bay</option>
  <option value="eo7917no">Queenswood</option>
  <option value="JHBCentral">Johannesburg</option>
  <option value="PTACB">PTA-Central </option>
  <option value="rt9536ao">Pretoria west</option>
  <option value="to3850ot">Balito</option>
  <option value="ue5353tu">The South</option>  
</select><br>
    <br>
    <label style="color:#22075E;"><b>Password </b> </label>
     <input type="password" placeholder="Password" name="password" required>
     <br><br>
    <br/>
    <label>
        <input type="submit" name="submit" value="login">><b>Login</b>
     </label>
  </div>
</form>
<br><br>
        <hr width="400px;" color="#22075E">      
	<span style="Font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif"><span style="font-size:8pt; vertical-align: text-bottom;">
	<strong style="color:#22075E;">© Copyright 
                    <span style="color:#22075E;" id="ctl00_YearLbl">2022</span>, Carol's Boutique (Pty) Ltd. All rights reserved.<br />A Fashion Company.<br/>      
                 </strong><p style="color:#22075E;">All brands, trademarks, trade-names, and logos are the<br/> property of Carol's Boutique.</p>
                 <strong style="color:#22075E;"><i><u>Developed by LWFDShowroom-Group.</u></i></strong>  
               <br />
            </span>
          </span>
	

</body>
</html>
