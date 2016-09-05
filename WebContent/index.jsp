<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<center>
<table border="0" cellpadding="6" cellspacing="0" width="80%" style="border-radius:10px" bgcolor="#FFFAF0">
<tr>
<td colspan="2" align="center">
<%@include file="top.jsp"%>

</td>
</tr>
<tr>
<td width="700" valign="top"><img src="logo/no1.JPG" alt="" height="350" width="700"/></td>
<td align="center" valign="top"><table border="2" cellspacing="0" cellpadding="0" width="99%" bordercolor="#FF0000"><tr>
<td>
<%
String a=request.getParameter("err");
if(a==null)
	a="1";
if(a.equals("1")){
%>
<%@include file="login.jsp"%>
<%
}else{%>
<%@include file="signup.jsp"%>
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
</body>
</html>