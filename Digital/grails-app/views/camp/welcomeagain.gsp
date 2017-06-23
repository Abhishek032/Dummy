<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="configstyle.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Digital Marketing | Camapign</title>
</head>
<body>

<div class="container">
    <header>
        <table border=0 style="width:100%">
            <tr>
                <td style="width:80%">
                    <h3 class="h3color">Digital Marketing</h3>
                </td>
                <td style="width:6%" align="center" valign="middle">
                    <h5 class="h5color">Welcome</h5>
                </td>
                <td style="width:15%" align="left" valign="middle">
                    <div class="dropdown">
                        <%=username%><button class="dropbtn"><span class="caret"></span></button>
                        <div class="dropdown-content">
                            <g:link controller="camp" action="campaignPage">Create Campaign</g:link>
                            <g:link controller='logout'>Log Out</g:link>
                            %{--<g:link>Change Password</g:link>--}%

                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </header>
</div>
<div>
    <table border= "0", style="width: 100%">
        <tr>
            <td align="center" >
                <p style="color: red;">*Failed to Add Facebook Account Try Again </p>
                <h3>CONFIGURATION</h3>
            <td>
        <tr>
    </table>
</div><hr>
<div class="row" style="margin-right: 0px;margin-left: 0px">
    <table border= "0" style="width:100%">
        <tr style="width:100%">
            <td style="width:100%">
                <ul>
                    <li><a href="#" style="width:220px;text-align:center;width:220px;text-align:center">SOCIAL</a></li>
                    <li><a href="#" style="width:220px;text-align:center;width:220px;text-align:center">CUSTOMERS</a></li>
                    <li><a href="#" style="width:220px;text-align:center;width:220px;text-align:center">COMPANY</a></li>
                </ul>
            </td>
        </tr>
    </table><hr>
    <div>
        <div class="bod">
            <div class="bod" style="width:69%; float:left;border-radius:30px; background-color:white;"></div>
            <div class="bod" style="width:30%; float:right;border:0px;  border-radius:30px; background-color:white"; align="center"><br>
                <p align="left" style="margin-left:20px; color:black"><b>ADD AN ACCOUNT</b></p><hr>
                <g:form name="myform" url="[controller:'FbSignIn', action:'signin']">
                    <input style="padding: 10px; background-color:#3b5998" type="submit" class="fbbtn" value="Facebook">
                </g:form>
            <!--<form name="#" url="[controller:'#', action:'#']">
				<input type="submit" class="fbbtn" value="Twitter" style= "background-color:#4099ff">
			</form>
			<form name="#" url="[controller:'#', action:'#']">
				<input type="submit" class="fbbtn" value="Linkedln" style="background-color:#0e76a8">
			</form>
			<form name="#" url="[controller:'#', action:'#']">
				<input type="submit" class="fbbtn" value="Google+" style="background-color:#d34836">
			</form>-->
            </div>
        </div>
    </div>
</div>
</body>
</html>
