<table border="0" cellpadding="2" cellspacing="0" width="100%" style="border-radius:10px">
<tr bgcolor="#000000"><td colspan="2" align="center">
<img src="logo/new.JPG" alt="cineshow" width="990" height="190" border="0"  style="border:groove;"/>
</td></tr>
<tr bgcolor="#000000"><td colspan="2">
<table border="0" cellspacing="0" cellpadding="3" width="100%"><tr>
<td width="70" align="center"><font size="4" color="#FFFFFF"><b><a href="index.jsp">Home</a></b></font></td>
<td width="70" align="center"><font size="4" color="#FFFFFF"><b>Movies</b></font></td>
<td width="70" align="center"><font size="4" color="#FFFFFF"><b>About</b></font></td>
<td></td><td width="70" align="center"><font size="4" color="#FFFFFF"><b>
<%request.getSession(false); 
String name=(String)session.getAttribute("phone");
if(name!=null){
%>
<a href="logout.jsp">Logout</a>
<%
}
else {
	String a=request.getParameter("err");
	if(a==null)
		a="1";
	if(a.equals("1")){
%>
<a href="index.jsp?err=0">Sign Up</a>
<%
}else{
%>
<a href="index.jsp?err=1">Login</a>
<% } }%>
</b></font></td></tr></table>
</td></tr></table>