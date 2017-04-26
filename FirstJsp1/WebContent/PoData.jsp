<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="DemoServs.TableData,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PO List</title>
<link rel="stylesheet" type="text/css" href="Style1.css">
</head>
<body>
<div class="container">


<header>

<table border=0>
	<tr>
		<td style="width:52%">
			<h1>Cimbidia</h1>
		</td>
		<td style="width:35%" class="searchbox" align="right" valign="middle">
			<form >
				<input type="text" placeholder="Search..." name="search" size="20" value=""><input type="submit" value="Go">
				
			</form>
		</td>
		<td style="width:35%" align="right" valign="top">
			<p>&nbsp;&nbsp;&nbsp;<b>Jane Doe</b>, buyer<br> Acme. Corporation</p>
		</td>
		<td width="220px">
			
		</td>
	</tr>
</table>

</header>
<link>
<table border=0 style="width:100%">
	<tr style="width:100%">
		<td style="width:100%">
			<ul>
				<li><a href="#">Purchase Orders</a></li>
				<li><a href="#">Customer Orders</a></li>
				<li><a href="#">ASNs</a></li>
				<li><a href="#">Shipments</a></li>
				<li><a href="#">Bookings</a></li>
				<li><a href="#">Invoice</a></li>
				<li><a href="#">Visibility</a></li>
				<li><a href="#">Cimchat</a></li>
				<li><a href="#">Settings</a></li>
			</ul>
		</td>
	</tr>
</table>


   
</link>

</div>
<p class="para">&nbsp;&nbsp;&nbsp;PURCHASE ORDER LIST</p>

<form action="">
<table border=0>
	<tr bgcolor=#b3b3b3>
		<td width="50px" align="center">
			<input type="checkbox" name="select1">
		</td>
		<td width="220px" >
			<p>&nbsp;&nbsp;&nbsp;P.O. Number</p>
		</td>
		<td width="220px">
			<p>&nbsp;&nbsp;&nbsp;Supplier</p>
		</td>
		<td width="220px">
			<p>&nbsp;&nbsp;&nbsp;Due Date</p>
		</td>
		<td width="220px" >
			<p>&nbsp;&nbsp;&nbsp;P.O. Status</p>
		</td>
		<td width="220px">
			<p>&nbsp;&nbsp;&nbsp;Priority</p>
		</td>
		<td width="220px" >
			<p>&nbsp;&nbsp;&nbsp;Item(s)</p>
		</td>
		<td width="220px" >
			<p>&nbsp;&nbsp;&nbsp;Ship from</p>
		</td>
		<td width="220px" >
			<p>&nbsp;&nbsp;&nbsp;Ship To</p>
		</td>
		<td width="220px" >
			<p>&nbsp;&nbsp;&nbsp;Trans. Resp.</p>
		</td>
	</tr>
	<%
	ArrayList list=(ArrayList)request.getAttribute("tabledatalist");
	if(list != null)
	{
		
	for(int i=0;i<list.size();i++)
	{
		TableData tab=(TableData)list.get(i);
	%>
	<tr bgcolor=#e6e6e6>
		<td align="center">
			<input type="checkbox" name="select2">
		</td>
		<td>
			&nbsp;<%=tab.getPonumber()%>
		</td>
		<td>
			&nbsp;<%= tab.getSupplier()%>
		</td>
		<td>
			&nbsp;<%= tab.getDuedate()%>
		</td>
		<td>
			&nbsp;<%=tab.getPostatus()%>
		</td>
		<td>
			&nbsp;<%=tab.getPriority()%>
		</td>
		<td>
			&nbsp;<%=tab.getItems()%>
		</td>
		<td>
			&nbsp;<%=tab.getShipfrom()%>
		</td>
		<td>
			&nbsp;<%=tab.getShipto()%>
		</td>
		<td>
			&nbsp;<%=tab.getTrans()%>
		</td>
	</tr>
<%} }%>
	
</table>
</form>
</body>
</html>
