<table border="0" cellpadding="2" cellspacing="0" width="100%" style="border-radius:10px">
<tr bgcolor="#000000">
<td colspan="2" align="center">
<img src="/cineshow/logo.gif" alt="cineshow" width="990" height="190" border="0"  style="border:groove;"/>
</td>
</tr>
<tr bgcolor="#000000">
<td colspan="2"><table border="0" cellspacing="0" cellpadding="3" width="100%">
<tr>
<%  
//request.getSession(false); 
//String utype=(String)session.getAttribute("utype");
//if(utype.equals("admin")){%>
<%@include file="choose.html" %>
<%/*}else if(utype.equals("staff")){*/ %>
	<%//@include file="choose1.html" %>
<%/*}else{*/%>
	<%//@include file="choose2.html" %>
<%//} %>
<td></td><td width="70" align="center"><font size="4" color="#FFFFFF"><b>
<a href="logout.jsp">Logout</a>
</b></font></td>
</tr>
</table>