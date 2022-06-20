<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>promote to teller</title>
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
.button:hover {background-color: #3e8e41
}
</style>
</head>

<body style="text-align:center; background-color:#D8C6B7;">
<img src="images\carolsboutique.png" alt="logo" height="150" width="170">
<hr color="#22075E"><br><br>

<center>
<div align="center">
 <center><h2 style="color:#22077E;"><i><u>PROMOTE EMPLOYEE TO TELLER</u></i></h2></center>
 <form action="<%=request.getContextPath() %>/emplLogin" method="post"> 
    <table style="width:100">
   
   <!--<tr> <td>Username</td> <td><input type="text" name="location"/></td></tr>-->
      <label style="color:#22075E;"><b>Select employee : </b></label>
     <select name="name" style="width:170px; height:30px">
     <option value="1" > Select teller</option>
      
      <%
    try {
    	String query = "Select * from employee";
    	Class.forName("com.mysql.jdbc.Driver").newInstance();
    	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/carolsboutique","root","Root");
    	Statement stm = conn.createStatement();
    	ResultSet rs = stm.executeQuery(query);
    	
    	while(rs.next()){
    		%>
    		<option value="<%=rs.getString("name")%>"> <%=rs.getString("name") %></option>
    		<% 
    	}
    }
    catch(Exception ex)
       {
    	ex.printStackTrace();
    	out.println("Error"+ ex.getMessage());
       }
    %>   
     
      </select> 
      <br>
    <label style="color:#22075E;"><b>New password    : </b></label>
     <input type="password" placeholder="Password" name="password" style="width:165px; height:23px" required>
    </table><br>
    <input type="submit" value="submit"/> 
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