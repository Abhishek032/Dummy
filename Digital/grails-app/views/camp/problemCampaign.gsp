%{--
<%@ page import="com.digital.user.FacebookData" %>
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
                        <%=username%><button class="dropbtn"> <span class="caret"></span></button>
                        <div class="dropdown-content">

                            <g:link controller='logout'>Log Out</g:link>

                            --}%
%{--<g:link controller="#" action="#">Change Password</g:link>--}%%{--

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


            --}%
%{--<table border=0>

                <%if(userFbData!=null){
                    for(int i=0;i<userFbData.size();i++){
                        FacebookData fbdata=(FacebookData)userFbData.get(i)
                        %>
                <tr>
                    <td>
                        <p>Facebook Name </p>
                    </td>
                    <td>
                        <p><%=fbdata.getFacebookName()%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Facebook Id </p>
                    </td>
                    <td>
                        <p><%=fbdata.getFacebookId()%></p>
                    </td>
                </tr>
                    <%} }
                %>

            </table>--}%%{--




            <form>
                <p><input type="checkbox" id="checkme"/> By clicking this I agree to post<br>the contents on facebook wall</p>
                <h3 class="h3color">Choose a Category to Post</h3>
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
                <button type="button" class="postbtn" disabled="disabled" id="proceed" value="Next" onclick="getcube()">Next</button>
            </form>


            <g:javascript>
                function getcube(){
                    if(${fbcheck}){
                        if (document.getElementById('link').checked) {
                            $('#linkmodal').modal('show');
                        } else if (document.getElementById('text').checked) {
                            $('#textmodal').modal('show');
                        } else if (document.getElementById('image').checked) {
                            $('#imagemodal').modal('show');
                        } else if (document.getElementById('video').checked) {
                            $('#videomodal').modal('show');
                        }
                    }else {
                        $('#facebookmodal').modal('show');
                    }
                }
            </g:javascript>

            <g:javascript>
                var checker = document.getElementById('checkme');
                var sendbtn = document.getElementById('proceed');
                checker.onchange = function(){
                    if(this.checked){
                        sendbtn.disabled = false;
                    } else {
                        sendbtn.disabled = true;
                    }
                }
            </g:javascript>
            <br>
            <br>
        </div>
    </div>
</div>
</body>
</html>




<!-- Modal -->
<div class="modal fade" id="linkmodal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                <h2 class="modal-title">Create Campaign</h2>
            </div>
            <div class="modal-body" align="center">
                <g:form name="campaignform" url="[controller: 'post',action:'linkPost']">
                    <input type="text" placeholder="Campaign Name" required name="campaignName">
                    <input type="text" placeholder="Campaign Title" required name="campaignTitle">
                    <textarea cols="39" rows="2" placeholder="Write here..." name="campaignMessage"></textarea>
                    <input type="text" placeholder="Link..." required name="campaignLink">

                    <input type="submit" class="btn" value="Post">
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
            </div>
        </div>

    </div>
</div>

</div>

    <!-- Modal -->
<div class="modal fade" id="textmodal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                <h2 class="modal-title">Create Campaign</h2>
            </div>
            <div class="modal-body" align="center">
                <g:form name="campaignform" url="[controller: 'post',action:'textPost']">
                    <input type="text" placeholder="Campaign Name" required name="campaignName">
                    <input type="text" placeholder="Campaign Title" required name="campaignTitle">
                    <textarea cols="39" rows="2" placeholder="Write here..." required name="campaignMessage"></textarea>

                    <input type="submit" class="btn" value="Post">
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
            </div>
        </div>

    </div>
</div>

</div>

    <!-- Modal -->
<div class="modal fade" id="imagemodal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                <h2 class="modal-title">Create Campaign</h2>
            </div>
            <div class="modal-body" align="center">
                <g:form name="campaignform" url="[controller: 'post',action:'mediaPost']" enctype='multipart/form-data'>
                    <input type="text" placeholder="Campaign Name" required name="campaignName">
                    <input type="text" placeholder="Campaign Title" required name="campaignTitle">
                    <textarea cols="39" rows="2" placeholder="Write here..." name="campaignMessage"></textarea>
                    <input class="inputFiles" type="file" name="fileupload" required multiple="multiple" accept="image/*" />
                    <input type="submit" class="btn" value="Post">
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
            </div>
        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="videomodal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                <h2 class="modal-title">Create Campaign</h2>
            </div>
            <div class="modal-body" align="center">
                <g:form name="campaignform" url="[controller: 'post',action:'mediaPost']" enctype='multipart/form-data'>
                    <input type="text" placeholder="Campaign Name" required name="campaignName">
                    <input type="text" placeholder="Campaign Title" required name="campaignTitle">
                --}%
%{--<textarea cols="39" rows="2" placeholder="Write here..." name="campaignMessage"></textarea>--}%%{--

                    <input class="inputFiles" type="file" name="fileupload" required multiple="multiple" accept="video/*" />
                    <input type="submit" class="btn" value="Post">
                </g:form>
            </div>
            <div class="modal-footer">

                <button type="button" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
            </div>
        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="facebookmodal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                <h2 class="modal-title">Add Facebook</h2>
            </div>
            <div class="modal-body" align="center">
                <g:form name="myform" url="[controller:'FbSignIn', action:'signin']">
                <input type="submit" class="fbbtn" style="width: 50%" value="Facebook">
            </g:form>
            </div>
            <div class="modal-footer">

                <button type="button" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
            </div>
        </div>

    </div>
</div>

___________________________________________________________________________________________________________________________________________

--}%



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
                <p style="color: red;">*Post Failed: Only Image/Video file can be Posted</p>
                <h3>CAMPAIGN</h3>
            <td>
        <tr>
    </table>
</div><hr>

<div class="bod" style="height:500px;">

    <div class="bod" style="width:69%; height:100%;float:left;border:0px;  border-radius:30px; border:0px solid black;">
        <div style="width:100%; height:50%; float:right;border:0px; margin-bottom:10px  ; border-radius:30px; background-color:white; border:0px solid black;">
            <p style="color:black; margin-left: 1cm; margin-top:10px"><b>TWO-WAY</b></p><hr>
            <table border="0" width="100%">
                <tr>
                    <td width="70%" align="center">
                        <button class="button" type="button"><g:img dir="images" file="facebook icon.jpg" alt="fb" style="width:50px;height:50px;"/></button>
                        <button class="button" type="button"><g:img dir="images" file="twitter.jpg" alt="twitter" style="width:50px;height:50px"/></button>
                        <button class="button" type="button"><g:img dir="images" file="linkedln.jpg" alt="linkedln" style="width:50px;height:50px"/></button>
                        <button class="button" type="button"><g:img dir="images" file="google icon.jpg" alt="google" style="width:50px;height:50px"/></button>
                    </td>
                    <td width="30%" align="center">
                        <form name="#" url="[controller:'#', action:'#']">
                            <input type="submit" style="width:40%; padding: 7px; background-color:#80a9cb; margin-top:10px" value="PREVIEW">
                        </form>
                        <form name="#" url="[controller:'#', action:'#']">
                            <input type="submit" style="width:70%; padding: 9px; background-color:#80dfff" value="POWERSHARE NOW">
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div align="center" style="width:100%; height:50%; float:right;border:0px;  border-radius:30px; background-color:white; border:0px solid black; ">
            <p align="left" style="color:black;margin-left: 1cm; margin-top:10px"><b>POWER-SHARE</b></p><hr>
            <g:form controller="post" action="textPost">
                <textarea style="margin-bottom:20px" cols="107" rows="3" placeholder="What do you have to say?" required name="campaignMessage"></textarea><br>
                <input style="background-color:coral ;padding: 10px; border-radius:5px; width: 70px; color:black" type="submit" value="Post">
                <button type="button" data-toggle="modal" data-target="#link" style="background-color:coral ;padding: 10px; border-radius:5px;">Link</button>
                <button type="button" data-toggle="modal" data-target="#image" style="background-color:coral ;padding: 10px; border-radius:5px;">Image</button>
                <button type="button" data-toggle="modal" data-target="#video" style="background-color:coral ;padding: 10px; border-radius:5px;">Video</button>
            </g:form>
        </div>

    </div>

    <div class="bod" style="width:30%; height:100%; float:right;border:0px;  border-radius:30px; border:0px solid black; ">
        <div style="width:100%; height:70%;border:0px;  border-radius:30px; background-color:white; border:0px solid black; ">
            <p style="color:black; margin-left: 1cm; margin-top=10px"><b><span style="margin-top:10 px">YOUR CURRENT REACH</span></b></p><hr>
        </div>
        <div style="width:100%; height:30%;border:0px;  border-radius:30px; background-color:white; border:0px solid black; ">
            <p style="color:black; margin-left: 1cm; margin-top:10px"><b>Preview</b></p><hr>
        </div>
    </div>
</div>

</body>

</html>

<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="image" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Upload Image</h2>
                </div>
                <div class="modal-body" align="center">
                    <g:form controller="post" action="mediaPost" enctype='multipart/form-data'>
                        <textarea style="margin-bottom:20px" cols="40" rows="3" placeholder="What do you have to say?" name="campaignMessage"></textarea><br>
                        <input type="file" name="fileupload" required multiple="multiple" accept="image/*"/><br>
                        <input style="padding:10px; width:30%" type="submit" value="post">
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>
<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="link" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Post Link</h2>
                </div>
                <div class="modal-body" align="center">
                    <g:form controller="post" action="linkPost" enctype='multipart/form-data'>
                        <textarea style="margin-bottom:5px" cols="40" rows="3" placeholder="What do you have to say?" name="campaignMessage"></textarea>
                        <input type="text" style="width: 56%" name="campaignLink" required placeholder="Enter Link..."><br>
                        <input style="padding:10px; width:30%" type="submit" value="post">
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>

<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="video" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Upload Video</h2>
                </div>
                <div class="modal-body" align="center">
                    <g:form controller="post" action="mediaPost" enctype='multipart/form-data'>
                        <input type="file" placeholder="Video...." required name="fileupload" multiple="multiple" accept="video/*"/><br>
                        <input style="padding:10px; width:30%" type="submit" value="post">
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>

<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="facebook" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Add Facebook</h2>
                </div>
                <div class="modal-body" align="center">
                    <g:form name="myform" url="[controller:'FbSignIn', action:'signin']">
                        <input style="width:55%;padding: 10px; background-color:#3b5998" type="submit" class="fbbtn" value="Facebook">
                    </g:form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>
