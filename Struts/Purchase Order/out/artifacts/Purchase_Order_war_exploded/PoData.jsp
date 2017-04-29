<%@ page import="java.util.ArrayList" %>
<%@ page import="com.po.form.Insert2DBForm" %><%--
  Created by IntelliJ IDEA.
  User: Abhishek
  Date: 28-04-2017
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Purchase Order List</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <style>
        input[type="text"],select {
            width: 180px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            background-position: 10px 10px;
            padding: 7px 20px 7px 20px;
        }

        input[type="text"]:focus {
            width: 100%;
        }

        tr:nth-child(even){
            background-color:white;
        }
    </style>
</head>
<body>
<div class="container">


    <header>

        <table border=0>
            <tr>
                <td style="width:52%">
                    <h1>Cimbidia</h1>
                </td>
                </td>
                <td style="width:35%" class="searchbox" align="right" valign="middle">
                    <form action="/search.do">
                        <input type="text" placeholder="Search.." name="search">

                    </form>
                </td>
                <td style="width:35%" align="right" valign="top">
                    <p class="headp">&nbsp;&nbsp;&nbsp;<b>Jane Doe</b>, buyer<br> Acme. Corporation</p>
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
            System.out.print("Hello");
            ArrayList arrList=(ArrayList)request.getAttribute("gets");
            if(arrList != null)
            {

                for(int i=0;i<arrList.size();i++)
                {
                    Insert2DBForm tab=(Insert2DBForm)arrList.get(i);
        %>
        <tr bgcolor=#e6e6e6>
            <td align="center">
                <input type="checkbox" name="select2">
            </td>
            <td>
                &nbsp;<%=tab.getPonumber()%>
            </td>
            <td>
                &nbsp;<%= tab.getSeller()%>
            </td>
            <td>
                &nbsp;<%= tab.getDuedate()%>
            </td>
            <td>
                &nbsp;<%=tab.getStatus()%>
            </td>
            <td>
                &nbsp;<%=tab.getPriority()%>
            </td>
            <td>
                &nbsp;<%=tab.getIncoterms()%>
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
