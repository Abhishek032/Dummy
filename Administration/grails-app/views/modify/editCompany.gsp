<%@ page import="com.grails.Module" %>
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
    <g:javascript>
        req = true;
        var final=[];
        window.onload=function(){
            var length=${module.size()}
            var i=0;
            for (j= 0; j< length; j++) {
                <%if(company.getModule()!=null){
                for(Module moduleObj : company.getModule().sort{it.id}){%>

                    if(document.getElementById("checkSelect"+j).value == "<%=moduleObj.getModuleName()%>"){
                     i=1;
                    }
                <%}}%>
                if(i == 0){
                    document.getElementById("row"+j).style.display='none';
                }
                if(i == 1){
                    document.getElementById("rowAvailable"+j).style.display='none';
                }
                i=0;
            }
        }
        function moduleSelect(){

        <%if(module!=null){
            for(int i=0;i<module.size();i++){
        %>
        if(document.getElementById('checkAvailable${i}').checked){
            document.getElementById("row${i}").style.display='block';
            document.getElementById("rowAvailable${i}").style.display='none';
            document.getElementById("checkAvailable${i}").checked = false;


        }
        <%}}%>

    }
    function moduleRemove() {
        <%if(module!=null){
            for(int i=0;i<module.size();i++){
        %>

        if(document.getElementById('checkSelect${i}').checked){

            document.getElementById("row${i}").style.display='none';
            document.getElementById("rowAvailable${i}").style.display='block';
            document.getElementById("checkSelect${i}").checked = false;
        }
        <%}}%>
        }
    function act(){
        var moduleStore=0;
        //Module Select--------------------
        <%if(module != null) {
            for (int no = 0; no < module.size(); no++){%>
        if(document.getElementById("row${no}").style.display != 'none'){
            final[moduleStore]=document.getElementById('checkSelect${no}').value;
            moduleStore++;
         }
        <%}}%>

        //Field Check---------------------
        if(document.getElementById('taxId').value == "" || document.getElementById('registrationNo').value == "" || document.getElementById('email').value == "" || document.getElementById('phone').value == "" || document.getElementById('address').value == "" || document.getElementById('city').value == "" || document.getElementById('state').value == "" || document.getElementById('country').value == ""){

            req = false
            alert("Required fields are empty")
        }
        if(req){
            if (final.length < 1) {
                alert("Module not selected")
            }else{
                document.getElementById('formData').value=final;
                document.getElementById("updateForm").submit();
            }
        }else {
            req=true;
        }
    }
    </g:javascript>
</head>
<body>

<div class="container">
    <header style="padding: 0px">
        <table border=0 style="width:100%">
            <tr>
                <td style="width:80%">
                    <h3 class="h3color">HR Management</h3>
                </td>
                <td style="width:6%" align="center" valign="middle">
                    <h5 class="h5color">Welcome</h5>
                </td>
                <td style="width:15%" align="left" valign="middle">
                    <div class="dropdown">
                        <%=username%><button class="dropbtn"><span class="caret"></span></button>
                        <div class="dropdown-content">
                            <g:link controller="#" action="#" style="text-decoration: none">My Profile</g:link>
                            <g:link controller="#" action="#" style="text-decoration: none">Setting/Configuration</g:link>
                            <g:link controller='logout' style="text-decoration: none">Log Out</g:link>
<g:link>Change Password</g:link>


                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <table><tr>
            <td><g:link controller="#" action="#" style="text-decoration: none">My Profile</g:link></td>
            <td><g:link controller="#" action="#" style="text-decoration: none">Setting/Configuration</g:link></td>
            <td><g:link controller='logout' style="text-decoration: none">Log Out</g:link></td></tr>
        </table>
    </header>
</div>
<div align="center">
    <h2 style="color:#808080; margin-top: 5px;margin-bottom: 5px"><%=company.getCompanyName()%></h2><hr style="margin-top: 10px">
    <h3>Company Details</h3>
    <g:form name="updateForm" url="[controller:'saveComp', action:'updateComp']">
        <input type="text" placeholder="Tax Id*" id="taxId" name="taxId" required value="<%=company.getTaxId()%>">
        <input type="text" placeholder="Company Status" id="companyStatus" name="companyStatus" required value="<%=company.getCompanyStatus()%>">
        <input type="text" placeholder="Registration No.*" id="registrationNo" name="registrationNo" required value="<%=company.getRegistrationNo()%>">
        <input type="email" placeholder="Email*" id="email" name="email" required value="<%=company.getEmail()%>">
        <input type="text" placeholder="Phone*" id="phone" name="phone" required value="<%=company.getPhone()%>">
        <input type="text" placeholder="Address*" id="address" name="address" required value="<%=company.getAddress()%>">
        <input type="text" placeholder="City*" id="city" name="city" required value="<%=company.getCity()%>">
        <input type="text" placeholder="State*" id="state" name="state" required value="<%=company.getState()%>">
        <input type="text" placeholder="Country*" id="country" name="country" required value="<%=company.getCountry()%>">
        <input type="hidden" name="companyIndex" value="<%=company.getId()%>">
        <hr style="margin-top: 10px">
        <h3>Module</h3>
        <div class="col-sm-12" align="center">
            <h3 style="margin-top: 10px">Select Module</h3>
            <div class="col-sm-5" align="center">
                <div class="col-sm-6" style="float:right;border-radius: 10px; background-color: #f2f2f2">
                    <h4>Available Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
                    <table border="1" style="width:100%;margin: 5px">
                        <%if(module!=null){
                            for(int i=0;i<module.size();i++){
                            Module mod = module.get(i)
                        %>
                        <tr id="rowAvailable${i}">
                            <td><input type="checkbox" name="check" id="checkAvailable${i}" value="<%=mod.getModuleName()%>"></td>
                            <td>
                                <%=mod.getModuleName()%>
                            </td>
                        </tr>
                        <%}}%>
                    </table>
                </div>
            </div>
            <div class="col-sm-2" align="center" style="padding:5px">
                <div style="padding:1px"><a onclick="moduleSelect()">
                    <span class="glyphicon glyphicon-circle-arrow-right"></span>
                </a></div>
                <div style="padding:1px"><a onclick="moduleRemove()">
                    <span class="glyphicon glyphicon-circle-arrow-left"></span>
                </a></div>
            </div>
            <div class="col-sm-5" align="center">
                <div class="col-sm-6" style="border-radius: 10px; background-color: #f2f2f2">
                    <h4>Selected Modules</h4><hr style="margin-bottom: 2px; margin-top: 2px;">
                    <table border="1" style="width:100%;margin: 5px" id="tab">
                        <%if(module!=null){
                            for(int i=0;i<module.size();i++){
                                Module mod = module.get(i)
                        %>
                        <tr id="row${i}">
                            <td><input type="checkbox" name="check" id="checkSelect${i}" value="<%=mod.getModuleName()%>"></td>
                            <td>
                                <%=mod.getModuleName()%>
                            </td>
                        </tr>
                        <%}}%>
                    </table>
                </div>
            </div>
        </div>
        <input type="hidden" name="data" id="formData">
        <button type="button" class="submitbutton" style="margin-top: 5px;color: white" onclick="act()">Save</button>
<br><input type="submit" value="Update">

    </g:form>

</div>
</body>
</html>
%{--================================================================================--}%
%{--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | HOME</title>
</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Human Resource Management </h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Profile</g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Setting</g:link></li>
                <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
            </ul>

        </div>
    </div>

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName} Edit</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure" action="superAdminPage"><g:message code="Home"/></g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="addComp" action="newCompPage">Add Company</g:link></li>
                    <li><g:link class="list" controller="Company" action="index">Company List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a  class="dropdown-toggle" data-toggle="dropdown" href="#">Employee<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="Employee" action="employeePage">Employee List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Module<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="Module" action="createModule">Add Module</g:link></li>
                    <li><g:link controller="Module" action="modulePage">Module List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Role<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="role" action="newRole">Add Role</g:link></li>
                    <li><g:link controller="role" action="rolePage">Role List</g:link></li>
                </ul>
            </li>

        </ul><br>
    </div>
</div>
</body>
</html>--}%
