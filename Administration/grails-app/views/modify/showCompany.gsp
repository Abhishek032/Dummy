%{--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <h2 style="margin-top: 5px;margin-bottom: 5px"><%=company.getCompanyName()%></h2><hr>
    <table border="0">
        <tr>
            <td><h4 style="color: #666666">Name</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCompanyName()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Tax Id</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getTaxId()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Status</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCompanyStatus()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Total Employee</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getEmployee().size()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Registration No.</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getRegistrationNo()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Email</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getEmail()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Phone</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getPhone()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Address</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getAddress()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">City</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCity()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">State</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getState()%></td>
        </tr>
        <tr>
            <td><h4 style="color: #666666">Country</h4></td><td style="padding-left: 10px">:</td>
            <td style="padding-left: 30px"><%=company.getCountry()%></td>
        </tr>
    </table><hr>
    <h4 style="color: #2b406e">Module(s)</h4><hr>
    <%if(module!=null){
        for(String mod : module.sort()){ %>
    <p style="color: #204060"><%=mod%></p>
    <%}}%><hr>
    <g:form name="companyEmployee" controller="company" action="showEmployee">
        <input type="hidden" name="index" value="<%=company.getId()%>">
        <button type="submit"style="color: #2b406e;background-color: white;border: 0px"><b>Employee</b></button>
    </g:form>

</div>
</body>
</html>--}%
%{--===================================================================================--}%

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>HRM | ${company.companyName}</title>
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

    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName} Information</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure" action="superAdminPage"><g:message code="Home"/></g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="addComp" action="newCompPage">Add Company</g:link></li>
                    <li><g:link class="list" controller="Company" action="showCompany">Company List</g:link></li>
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
    <div class="col-md-12" style="padding:0 0 0 0" align="center">
        <div class="col-md-12" style="padding:0 0 0 0" align="left">
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Name</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.companyName}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Tax Id.</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0" >${company.taxId}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Status</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.companyStatus}</div>
            </div>
        </div>
        <div class="col-md-12" style="padding:0 0 0 0" align="left">
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Total Employee</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.getEmployee().size()}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Registration No.</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.registrationNo}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Email</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.email}</div>
            </div>
        </div>
        <div class="col-md-12" style="padding:0 0 0 0"align="left">
            <div class="col-md-4" >
                <div class="col-md-5"><h4 style="color: #666666">Phone</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.phone}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Address</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.address}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5" ><h4 style="color: #666666">City</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.city}</div>
            </div>
        </div>
        <div class="col-md-12" style="padding:0 0 0 0"align="left">
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">State</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.state}</div>
            </div>
            <div class="col-md-4">
                <div class="col-md-5"><h4 style="color: #666666">Country</h4></div>
                <div class="col-md-7" style="padding: 10px 0 0 0">${company.country}</div>
            </div>
        </div>
    </div>
    <div class="col-md-12" style="padding-bottom:10px; background-color: white" align="center">
        <hr>
        <h4 style="color: #2b406e">Module(s)</h4><hr>
        <%if(module!=null){
            for(String mod : module.sort()){ %>
        <p style="color: #204060"><%=mod%></p>
        <%}}%><hr>
        <g:form name="companyEmployee" controller="company" action="showEmployee">
            <input type="hidden" name="index" value="<%=company.getId()%>">
            <button type="submit"style="color: #2b406e;background-color: white;border: 0px"><b>Employee</b></button>
        </g:form>
    </div>
</div>
</body>
</html>
