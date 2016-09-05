<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CINESHOW</title>
</head>
<style>
a{
text-decoration:none;}
</style>
<body bgcolor="#EDEDED" alink="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF">
<%
 request.getSession(false); 
 String name=(String)session.getAttribute("phone");
 if(name!=null){
	 Connection con;
	 Statement stmt;
	 ResultSet rs;
	 try
	 {
		 Class.forName("oracle.jdbc.OracleDriver");
     	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:sona", "cineshow", "sona558");
		stmt=con.createStatement();
	 }
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
	  %>
<center>
<table border="0" cellpadding="6" cellspacing="0" width="80%" style="border-radius:10px" bgcolor="#FFFAF0">
<tr>
<td colspan="2" align="center">
<jsp:include page="top2.jsp"/>
</td>
</tr>
<tr>
<td width="100" align="center">
<form name="f3" action="book" method="post">
<table cellspacing="0" cellpadding="5" border="0">
<%try{ %>
<tr><td>Movie Name:</td><td><select name="movie">
<%
	rs=stmt.executeQuery("select * from movie");
	while(rs.next()){
		%>
<option value="<%out.println(rs.getString("name"));%>"><%out.println(rs.getString("name")); %></option>
		<%
	}
	%>
</select></td></tr><tr><td>Theatre Name:</td><td><select name="theatre">
<% rs=stmt.executeQuery("select * from theatre");
	while(rs.next()){%>
<option value="<%rs.getString("name");%>"><%out.println(rs.getString("name")); %></option>
		<%
	}
	%>

</select></td></tr>
<tr><td>Show Date:</td><td><input name="sdate" type="text" size="25"></td></tr>
<tr><td>Show Time:</td><td><input name="stime" type="text" size="25"></td></tr>
<tr><td>No. of Seats:</td><td><select name="ns"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option></select></td></tr>
<tr><td>Seat No.:</td><td><input type="text" name="sn" size="25"></td></tr>
	<%
}
catch(Exception e)
{
	System.out.println(e);
}
	%>

<tr><td>Theatre Name:</td><td><select name="theatre"><option value=""></option></select></td></tr>
<tr><td>Show Date:</td><td><select name="sdate"><option value=""></option></select></td></tr>
<tr><td>Show Time:</td><td><select name="stime"><option value=""></option></select></td></tr>
<tr><td>No. of Seats:</td><td><select name="ns"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option></select></td></tr>
<tr><td>Seat No.:</td><td><input type="text" name="sn" size="25"></td></tr>
</table> 
</form>
</td>
<td align="center" valign="top"></td>
</tr>
<tr>
<td colspan="2">
<jsp:include page="footer.jsp"/>
</td>
</tr>
</table>
</center>
 <% }
 else{
	 request.getRequestDispatcher("index.jsp").forward(request, response);
 }
 %> 
</body>
</html>