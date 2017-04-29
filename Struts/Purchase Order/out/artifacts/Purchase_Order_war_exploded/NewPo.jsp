<%--
  Created by IntelliJ IDEA.
  User: Abhishek
  Date: 28-04-2017
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>New Purchase Order</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <style>
        input[type],select {
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
                <td style="width:35%" class="searchbox" align="right" valign="middle">
                    <form action="/search.do">
                        <input type="text" placeholder="Search.." name="search">
                    </form>
                </td>
                <td style="width:35%" align="right" valign="top">
                    <p class="headp"><b><%=request.getParameter("user")%></b>, buyer<br> Acme. Corporation</p>
                </td>
                <td>

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
<p class="para"><b>&nbsp;&nbsp;&nbsp;NEW PURCHASE ORDER</b></p>

<form method="get" action="/NewLogin.do">

    <table border=0>
        <tr>
            <td width="200px" align="center">
                <p><b>P.O. Number</b></p>
            </td>
            <td width="240px">
                <input type="text" name="ponumber" required>
            </td>
            <td width="200px" align="center">
                <p><b>Status</b></p>
            </td>
            <td width="240px">
                <input type="text" name="status" required>
            </td>
            <td width="200px" align="center">
                <p><b>Priority</b></p>
            </td>
            <td width="240px">
                <select name="priority">
                    <option value="low">Low</option>
                    <option value="normal">Normal</option>
                    <option value="high">High</option>
                </select>
            </td>
        </tr>
        <tr>
            <td align="center">
                <p><b>P.O. Issue Date</b></p>
            </td>
            <td >
                <input type="date" name="issuedate" required style="width: 180px;">
            </td>
            <td align="center">
                <p><b>*Due Date</b></p>
            </td>
            <td >
                <input type="date" name="duedate" required style="width: 180px;">
            </td>
            <td align="center">
                <p><b>Seller/Vendor</b></p>
            </td>
            <td>
                <input type="text" name="seller" required>
            </td>
        </tr>
        <tr>
            <td align="center">
                <p><b>*Ship From</b></p>
            </td>
            <td>
                <input type="text" name="shipfrom" required>
            </td>
            <td align="center">
                <p><b>*Ship To</b></p>
            </td>
            <td>
                <input type="text" name="shipto" required>
            </td>
            <td align="center">
                <p><b>Bill To</b></p>
            </td>
            <td>
                <input type="text" name="billto" required>
            </td>
        </tr>
        <tr>
            <td align="center">
                <p><b>Trans. Respond</b></p>
            </td>
            <td>
                <input type="text" name="trans" required>
            </td>
            <td align="center">
                <p><b>Incoterms</b></p>
            </td>
            <td>
                <input type="text" name="incoterms" required>
            </td>
            <td align="center">
                <p><b>Must Ship Together?</b></p>
            </td>
            <td>
                <input type="checkbox" name="mustship" value="true">
            </td>
        </tr>
        <tr>
            <td align="center">
                <p><b>Designated Mode</b></p>
            </td>
            <td>
                <input type="text" name="designate" required>
            </td>
            <td align="center">
                <p><b>Carrier</b></p>
            </td>
            <td>
                <input type="text" name="carrier" required>
            </td>
        </tr>
    </table>
    <hr />
    <table border=0 style="width:100%">
        <tr>
            <td style="width:50%">
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ORIGIN</h2>
                <table border=0 style="width:100%">
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ships From</b></p>
                        </td>
                        <td>
                            <input type="text" name="orishipsfrom" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Street Address</b></p>
                        </td>
                        <td>
                            <input type="text" name="oristreetadd"  required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City</b></p>
                        </td>
                        <td>
                            <input type="text" name="oricity" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country</b></p>
                        </td>
                        <td>
                            <input type="text" name="oricountry" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State/Province</b></p>
                        </td>
                        <td>
                            <input type="text" name="oristate" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country</b></p>
                        </td>
                        <td>
                            <input type="text" name="oricountrynew" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pickup Start</b></p>
                        </td>
                        <td>
                            <input type="date" name="oripickupstart" required style="width:275px;">
                        </td>
                    </tr>
                    <tr>
                        <td><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pickup End</b></p>
                        </td>
                        <td>
                            <input type="date" name="oripickupend" required style="width:275px;">
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width:50%">
                <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DESTINATION</h2>
                <table border=0 style="width:100%">
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ships To</b></p>
                        </td>
                        <td>
                            <input type="text" name="destshipsto" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Street Address</b></p>
                        </td>
                        <td>
                            <input type="text" name="deststreetadd" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City</b></p>
                        </td>
                        <td>
                            <input type="text" name="destcity" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country</b></p>
                        </td>
                        <td>
                            <input type="text" name="destcountry" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State/Provience</b></p>
                        </td>
                        <td>
                            <input type="text" name="deststate" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Country</b></p>
                        </td>
                        <td>
                            <input type="text" name="destcountrynew" required style="width: 275px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Delivery Start</b></p>
                        </td>
                        <td>
                            <input type="date" name="destdeliverystart" required style="width:275px;">
                        </td>
                    </tr>
                    <tr>
                        <td><p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Delivery End</b></p>
                        </td>
                        <td>
                            <input type="date" name="destdeliveryend" required style="width:275px;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border=0 style="width:100%">
        <tr>
            <td align="right" style="width:50%">
                <input type="submit" name="act" value="Proceed" style="width:120px;">
                </form>
            </td>
            <td>
                <form action="NewPo.jsp"><br>
                <input type="submit" name="act" value="Reset" style="width:120px;">
                </form>
            </td>
        </tr>
    </table>


</body>
</html>
