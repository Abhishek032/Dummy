<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="stylesheet.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>DM | Home</title>
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
                        <%=request.getParameter("username")%>Me<button class="dropbtn"> <span class="caret"></span></button>
                        <div class="dropdown-content">
                            <g:link controller="Home" action="index">Logout</g:link>
                            <g:link controller="FbLogout" action="logout">Facebook Logout</g:link>
                            %{--<g:link controller="#" action="#">Change Password</g:link>--}%
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </header>
</div>

<div class="row-custom">

    <div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4 relative" align="center" >

        <div class="para">
            <h2 class="ap">Create Campaign</h2>
        </div>
        <div class="content">
            <br>
            <g:form name="campaignform" url="[controller: 'post',action:'postaction']" enctype='multipart/form-data'>
                <input type="text" placeholder="Name"  name="campaignname">
                <input type="text" placeholder="Title" name="campaigntitle">
                <h3>Choose a Category to Post</h3>
                <table border="0" style="width: 60%">
                    <tr>
                        <td style="width: 70%"><p><input type="radio" name="campaigntype"  id="link" value="link">Link</p></td>
                        <td style="width: 30%"><p><input type="radio" name="campaigntype"  id="text" value="text">Text</p></td>
                    </tr>
                    <tr>
                        <td><p><input type="radio" name="campaigntype"  id="image" value="image">Image</p></td>
                        <td><p><input type="radio" name="campaigntype"  id="video" value="video">Video</p></td>
                    </tr>
                </table>
                <input class="inputFiles" type="file" name="fileupload" multiple="multiple" accept="video/*" />
                <input type="submit" class="postbtn" value="Next">
                
            %{--<input class="inputFiles" type="file" name="fileupload" multiple="multiple" accept="image/*" />



            <table border="0" style="width: 70%">
                <tr>
                    <td style="width: 40%">
                        <p>Select an Image</p>
                    </td>
                    <td style="width: 60%">
                        <input type="file" name="campaignimage" accept="image/*" style="width: 65%">
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Select a Video</p>
                    </td>
                    <td>
                        <input type="file" name="campaignvideo" accept="video/*" style="width: 65%">
                    </td>

                </tr>
            </table>
            <textarea cols="39" rows="2" placeholder="Write here..." name="campaignmessage"></textarea>--}%
            </g:form>
            <br>
            <br>
        </div>
    </div>
</div>
</body>
</html>