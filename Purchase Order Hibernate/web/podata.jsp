<%@ page import="com.purchase.web.Po,java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Abhishek
  Date: 28-04-2017
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.purchase.web.NumberComparator" %>
<%@ page import="com.purchase.web.ItemComparator" %>
<%@ page import="com.purchase.web.TransComparator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Purchase Order List</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        input[type="text"],input[type="submit"],select {
            width: 140px;
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


    <table border=0>
        <form method="get" action="/Sort.do">
        <tr bgcolor=#b3b3b3>
            <th width="50px" align="center">
                <input type="checkbox" name="select1">
            </th>
            <th width="220px" >

                    <input type="submit" name="act" value="P.O. Number" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Supplier" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Due Date" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="P.O. Status" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Priority" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Item(s)" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Ship From" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Ship To" style=" border:none; background:#b3b3b3">

            </th>
            <th width="220px">

                    <input type="submit" name="act" value="Trans. Resp." style=" border:none; background:#b3b3b3">

            </th>
        </tr>
        </form>
        <%
            ArrayList arrList=(ArrayList)request.getAttribute("gets");
            if(arrList != null)
            {

                for(int i=0;i<arrList.size();i++)
                {
                    Po tab=(Po)arrList.get(i);
        %>
        <tr bgcolor=#e6e6e6>
            <td align="center">
                <input type="checkbox">
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
                &nbsp;<%=tab.getTransresp()%>
            </td>
        </tr>
        <%} }%>
    </table>
    <div style="text-align:center">
        <form method="get" action="/PoData.do">
        <br><input type="submit" name="act" value="Next" style="width:120px;">
        </form>
    </div>
</form>
</body>
</html>
