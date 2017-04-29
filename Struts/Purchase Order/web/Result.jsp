<%--
  Created by IntelliJ IDEA.
  User: Abhishek
  Date: 29-04-2017
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.po.form.Insert2DBForm, java.util.ArrayList" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Search Result</title>
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
<p class="para">&nbsp;&nbsp;&nbsp;SEARCH RESULT</p>



<div>
    <form action="">
        <table border=0>
            <tr bgcolor=#b3b3b3>

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
            int count = 0;
            String color = "#F9EBB3";
            if (request.getAttribute("piList") != null) {
                ArrayList al = (ArrayList) request.getAttribute("piList");
                System.out.println(al);
                Iterator itr = al.iterator();
                while (itr.hasNext()) {

                    if ((count % 2) == 0) {
                        color = "#eeffee";
                    }
                    count++;
                    ArrayList pList = (ArrayList) itr.next();
        %>
        <tr bgcolor=#e6e6e6>
            <td>&nbsp;<%=pList.get(0)%></td>
            <td>&nbsp;<%=pList.get(1)%></td>
            <td>&nbsp;<%=pList.get(2)%></td>
            <td>&nbsp;<%=pList.get(3)%></td>
            <td>&nbsp;<%=pList.get(4)%></td>
            <td>&nbsp;<%=pList.get(5)%></td>
            <td>&nbsp;<%=pList.get(6)%></td>
            <td>&nbsp;<%=pList.get(7)%></td>
            <td>&nbsp;<%=pList.get(8)%></td>
        </tr>

        <%            }}
        %>
    </table>
</div>
</body>
</html>
