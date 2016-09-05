<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WELCOME</title>
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
	 
	  %>
<center>
<table border="0" cellpadding="6" cellspacing="0" width="80%" style="border-radius:10px" bgcolor="#FFFAF0">
<tr>
<td colspan="2" align="center">
<jsp:include page="top2.jsp"/>
</td>
</tr>
<tr>
<td width="100">
Welcome 
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