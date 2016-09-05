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
<td align="left"><br>
<table width="100%" cellspacing="0" cellpadding="0" border="0"><tr><td width="200" bgcolor="#FFFFFF" bordercolor="#FF0000">
<table width="100%" cellspacing="0" cellpadding="0" border="1"bordercolor="#FF0000"><tr><td>
<table width="98%" cellspacing="0" cellpadding="5" border="0">
<tr><td><a href="movie.jsp?act=0"><font color="#8A2BE2" size="4"><b>Add Movie</b></font></a></td></tr>
<tr><td><a href="movie.jsp?act=1"><font color="#8A2BE2" size="4"><b>Edit Movie</b></font></a></td></tr>
<tr><td><a href="movie.jsp?act=2"><font color="#8A2BE2" size="4"><b>Delete Movie</b></font></a></td></tr>
<tr><td><a href="movie.jsp?act=3"><font color="#8A2BE2" size="4"><b>Assign Movie</b></font></a></td></tr>
</table></td></tr></table></td>
<td align="center" valign="top">
<%if(request.getParameter("act")=="0"){ %>
<%@include file="add_movie.jsp" %>
<%}else if(request.getParameter("act")=="1"){ %>
<%@include file="edit_movie.jsp" %>
<%}else if(request.getParameter("act")=="2"){ %>
<%@include file="delete_movie.jsp" %>
<%}else if(request.getParameter("act")=="3"){ %>
<%@include file="assign_movie.jsp" %>
<%}else{ %>
Select The Operation From Left Panel.
<%} %>
</td></tr></table></td>
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