<%@ page import="com.digital.user.FacebookData" %>
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
                            <g:link controller="camp" action="campaignPage" style="text-decoration: none">Create Campaign</g:link>
                            <g:link controller='logout' style="text-decoration: none">Log Out</g:link>
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
                <h3 style="margin-top: 15px;margin-bottom: 0px">CONFIGURATION</h3>
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
            <div class="bod" style="width:68%;padding: 0px; float:left;border-radius:30px">
                <div style="background-color: white;border-radius:30px;width: 40%;height:100%;float: left;padding:20px " align="center">
                    <g:img dir="images" file="dp.png" alt="user" width="250" height="250" style="border-radius: 1000px" />
                    <h2 style="color: #666666"><%=username%></h2>
                </div>
                <div class="scroll" style="border-radius:30px;background-color: white;width: 59%;height:100%;float: right">
                    <table border=0 style="margin: 20px;margin-right: 20px">

                        <%if(userFbData!=null){
                            for(int i=0;i<userFbData.size();i++){
                                com.digital.user.FacebookData fbdata=(FacebookData)userFbData.get(i)
                        %>

                        <tr>
                            <td align="center" style="padding-right: 20px;padding-top: 10px; padding-bottom: 10px">
                                <g:img uri="${fbdata.getProfilePicUrl()}" style="border-radius: 50px"/>
                            </td>
                            <td valign="middle">
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookName()%></p>
                            </td>
                            <td>
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookId()%></p>
                            </td>
                            <td align="center">
                                <form>
                                    <input type="submit" value="Remove" style="width:120%;margin-bottom: 0px;padding-left: 10px;padding-right: 10px;border-radius: 5px">
                                </form>
                            </td>
                        </tr>
                        <%} }%>

                        <%if(!fbcheck){%>
                        <tr>
                            <td style="padding-left: 30px">
                                <h2 style="color: #3b5998">Facebook</h2><p>Not Connected</p>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </div>

            </div>
            <div class="bod" style="background-color:white;width:30%; float:right;border:0px;  border-radius:30px;" align="center"><br>
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