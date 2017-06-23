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
    <g:javascript>
        var select = false;
        function gettextfb(){
            if(document.getElementById("campaignMessage").value==""){
                alert("No Message")
            }else{
                $('#selecttextfacebook').modal('show');
            }
        }
        function getlinkfb(){
            if(document.getElementById("campaignLink").value==""){
                alert("No Link")
            }else{
                $('#selectlinkfacebook').modal('show');
            }
        }
        function getimagefb(){
            if(document.getElementById("imageupload").value==""){
                alert("No Image file selected")
            }else{
                $('#selectimagefacebook').modal('show');
            }
        }
        function getvideofb(){
            if(document.getElementById("videoupload").value==""){
                alert("No Video file selected")
            }else{
                $('#selectvideofacebook').modal('show');
            }
        }

        function selecttextfb(){
            var arr=[];
            select=false;
        <% for(Integer i=0;i<userFbData.size();i++){
                %>
                if (document.getElementById('facebookt${i}').checked) {
                    select=true;
                    arr[${i}]=${i};
        }
        <%}%>
            if(select){
                document.getElementById('textdata').value=arr;
                parent.document.forms["textform"].submit();

            }else{
                alert("Facebook not selected")
            }
    }
    function selectlinkfb(){
            var arr=[];
            select=false;
        <% for(Integer i=0;i<userFbData.size();i++){
        %>
        if (document.getElementById('facebookl${i}').checked) {
                    select=true;
                    arr[${i}]=${i};
        }
        <%}%>
        if(select){
            document.getElementById('linkdata').value=arr;
            parent.document.forms["linkform"].submit();

        }else{
            alert("Facebook not selected")
        }
    }
    function selectimagefb(){
            var arr=[];
            select=false;
        <% for(Integer i=0;i<userFbData.size();i++){
        %>
        if (document.getElementById('facebooki${i}').checked) {
                    select=true;
                    arr[${i}]=${i};
        }
        <%}%>
        if(select){
            document.getElementById('imagedata').value=arr;
            parent.document.forms["imageform"].submit();

        }else{
            alert("Facebook not selected")
        }
    }
    function selectvideofb(){
            var arr=[];
            select=false;
        <% for(Integer i=0;i<userFbData.size();i++){
        %>
        if (document.getElementById('facebookv${i}').checked) {
                    select=true;
                    arr[${i}]=${i};
        }
        <%}%>
        if(select){
            document.getElementById('videodata').value=arr;
            parent.document.forms["videoform"].submit();

        }else{
            alert("Facebook not selected")
        }
    }

    </g:javascript>
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
                            <g:link controller="secure" action="index" style="text-decoration: none">Configuration</g:link>
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
                <h3 style="margin-top: 15px;margin-bottom: 0px">CAMPAIGN</h3>
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
                        %{--<form name="#" url="[controller:'#', action:'#']">
                            <input type="submit" style="width:70%; padding: 9px; background-color:#80dfff" value="POWERSHARE NOW">
                        </form>--}%
                    </td>
                </tr>
            </table>
        </div>
        <div align="center" style="width:100%; height:50%; float:right;border:0px;  border-radius:30px; background-color:white; border:0px solid black; ">
            <p align="left" style="color:black; margin-left: 1cm; margin-top:10px"><b>POWER-SHARE</b></p><hr>
            <g:form name="textform" controller="post" action="textPost">
                <textarea style="margin-bottom:20px" cols="107" rows="3" placeholder="What do you have to say?" required id="campaignMessage" name="campaignMessage"></textarea><br>
                <input type="hidden" id="textdata" name="data">

                <button class="stylebutton" type="button" onclick="gettextfb()">Post </button>
                <button class="stylebutton" type="button" data-toggle="modal" data-target="#link" >Link</button>
                <button class="stylebutton" type="button" data-toggle="modal" data-target="#image" >Image</button>
                <button class="stylebutton" type="button" data-toggle="modal" data-target="#video" >Video</button>
            </g:form>




        </div>

    </div>

    <div class="bod" style="width:30%; height:100%; float:right;border:0px;  border-radius:30px; border:0px solid black; ">
        <div style="width:100%; height:70%;border:0px;  border-radius:30px; background-color:white; border:0px solid black; ">
            <p style="color:black; margin-left: 1cm"><b><span style="margin-top:10px">YOUR CURRENT REACH</span></b></p><hr>
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
    <div class="modal fade" id="link" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Post Link</h2>
                </div>
                <div class="modal-body" align="center">
                    <g:form name="linkform" controller="post" action="linkPost" enctype='multipart/form-data'>
                        <textarea style="margin-bottom:5px" cols="40" rows="3" placeholder="What do you have to say?" name="campaignMessage"></textarea>
                        <input type="text" style="width: 56%" id="campaignLink" name="campaignLink" required placeholder="Enter Link..."><br>
                        <input type="hidden" id="linkdata" name="data">
                        <button style="border-radius: 5px;padding:10px; width:30%" type="button" onclick="getlinkfb()">Post</button>
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
    <div class="modal fade" id="image" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Upload Image</h2>
                </div>
                <div class="modal-body" align="center">
                    <g:form name="imageform" controller="post" action="mediaPost" enctype='multipart/form-data'>
                        <textarea style="margin-bottom:20px" cols="40" rows="3" placeholder="What do you have to say?" name="campaignMessage"></textarea><br>
                        <input type="file" name="fileupload" id="imageupload" required multiple="multiple" accept="image/*"/><br>
                        <input type="hidden" id="imagedata" name="data">
                        <button style="border-radius: 5px;padding:10px; width:30%" type="button" onclick="getimagefb()">Post</button>
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
                    <g:form name="videoform" controller="post" action="mediaPost" enctype='multipart/form-data'>
                        <input type="file" id="videoupload" required name="fileupload" multiple="multiple" accept="video/*"/><br>
                        <input type="hidden" id="videodata" name="data">
                        <button style="border-radius: 5px;padding:10px; width:30%" type="button" onclick="getvideofb()">Post</button>
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
    <div class="modal fade" id="selecttextfacebook" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Select Facebook</h2>
                </div>
                <div class="modal-body scroll1" style="padding-top: 0px;padding-bottom: 0px;border-radius:30px;background-color: white;width: 100%;float: right" align="center">

                    <table border=0 style="margin: 20px;margin-right: 20px">

                        <%if(userFbData!=null){%><tr><td></td><td></td><td></td><td><label><input type="checkbox" name="sample" class="selectall"/> Select all</label></td></tr><%
                            for(int i=0;i<userFbData.size();i++){
                                com.digital.user.FacebookData fbdata=(com.digital.user.FacebookData)userFbData.get(i)%>
                        <tr>
                            <td align="center" style="padding-right: 20px;padding-top: 2px; padding-bottom: 2px">
                                <g:img uri="${fbdata.getProfilePicUrl()}" style="border-radius: 50px"/>
                            </td>
                            <td valign="middle">
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookName()%></p>
                            </td>
                            <td>
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookId()%></p>
                            </td>
                            <td align="left">
                                <label><input type="checkbox" name="facebook" id="facebookt${i}" style="margin: 0px;padding-left: 20px;padding-left: 20px; border-radius: 5px"></label>
                            </td>
                        </tr>
                        <%}}%>
                        <%if(!fbcheck){%>
                        <tr>
                            <td style="padding-left: 30px">
                                <h2 style="color: #3b5998">Facebook</h2><p>Not Connected</p>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <g:javascript>
                        $('.selectall').click(function() {
                            if ($(this).is(':checked')) {
                                $('div input').attr('checked', true);
                            } else {
                                $('div input').attr('checked', false);
                            }
                        });
                    </g:javascript>
                </div>
            <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default" style="float: left" onclick="selecttextfb();">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>

        </div>
    </div>

</div>

<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="selectlinkfacebook" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Select Facebook</h2>
                </div>
                <div class="modal-body scroll1" style="padding-top: 0px;padding-bottom: 0px;border-radius:30px;background-color: white;width: 100%;float: right" align="center">

                    <table border=0 style="margin: 20px;margin-right: 20px">

                        <%if(userFbData!=null){%><tr><td></td><td></td><td></td><td><label><input type="checkbox" name="sample" class="selectall"/> Select all</label></td></tr><%
                            for(int i=0;i<userFbData.size();i++){
                                com.digital.user.FacebookData fbdata=(com.digital.user.FacebookData)userFbData.get(i)%>
                        <tr>
                            <td align="center" style="padding-right: 20px;padding-top: 2px; padding-bottom: 2px">
                                <g:img uri="${fbdata.getProfilePicUrl()}" style="border-radius: 50px"/>
                            </td>
                            <td valign="middle">
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookName()%></p>
                            </td>
                            <td>
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookId()%></p>
                            </td>
                            <td align="left">
                                <label><input type="checkbox" name="facebook" id="facebookl${i}" style="margin: 0px;padding-left: 20px;padding-left: 20px; border-radius: 5px"></label>
                            </td>
                        </tr>
                        <%}}%>
                        <%if(!fbcheck){%>
                        <tr>
                            <td style="padding-left: 30px">
                                <h2 style="color: #3b5998">Facebook</h2><p>Not Connected</p>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <g:javascript>
                        $('.selectall').click(function() {
                            if ($(this).is(':checked')) {
                                $('div input').attr('checked', true);
                            } else {
                                $('div input').attr('checked', false);
                            }
                        });
                    </g:javascript>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default" style="float: left" onclick="selectlinkfb();">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="selectimagefacebook" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Select Facebook</h2>
                </div>
                <div class="modal-body scroll1" style="padding-top: 0px;padding-bottom: 0px;border-radius:30px;background-color: white;width: 100%;float: right" align="center">

                    <table border=0 style="margin: 20px;margin-right: 20px">

                        <%if(userFbData!=null){%><tr><td></td><td></td><td></td><td><label><input type="checkbox" name="sample" class="selectall"/> Select all</label></td></tr><%
                            for(int i=0;i<userFbData.size();i++){
                                com.digital.user.FacebookData fbdata=(com.digital.user.FacebookData)userFbData.get(i)%>
                        <tr>
                            <td align="center" style="padding-right: 20px;padding-top: 2px; padding-bottom: 2px">
                                <g:img uri="${fbdata.getProfilePicUrl()}" style="border-radius: 50px"/>
                            </td>
                            <td valign="middle">
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookName()%></p>
                            </td>
                            <td>
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookId()%></p>
                            </td>
                            <td align="left">
                                <label><input type="checkbox" name="facebook" id="facebooki${i}" style="margin: 0px;padding-left: 20px;padding-left: 20px; border-radius: 5px"></label>
                            </td>
                        </tr>
                        <%}}%>
                        <%if(!fbcheck){%>
                        <tr>
                            <td style="padding-left: 30px">
                                <h2 style="color: #3b5998">Facebook</h2><p>Not Connected</p>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <g:javascript>
                        $('.selectall').click(function() {
                            if ($(this).is(':checked')) {
                                $('div input').attr('checked', true);
                            } else {
                                $('div input').attr('checked', false);
                            }
                        });
                    </g:javascript>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default" style="float: left" onclick="selectimagefb();">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>

        </div>
    </div>

</div>
<div>
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="selectvideofacebook" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title">Select Facebook</h2>
                </div>
                <div class="modal-body scroll1" style="padding-top: 0px;padding-bottom: 0px;border-radius:30px;background-color: white;width: 100%;float: right" align="center">

                    <table border=0 style="margin: 20px;margin-right: 20px">

                        <%if(userFbData!=null){%><tr><td></td><td></td><td></td><td><label><input type="checkbox" name="sample" class="selectall"/> Select all</label></td></tr><%
                            for(int i=0;i<userFbData.size();i++){
                                com.digital.user.FacebookData fbdata=(com.digital.user.FacebookData)userFbData.get(i)%>
                        <tr>
                            <td align="center" style="padding-right: 20px;padding-top: 2px; padding-bottom: 2px">
                                <g:img uri="${fbdata.getProfilePicUrl()}" style="border-radius: 50px"/>
                            </td>
                            <td valign="middle">
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookName()%></p>
                            </td>
                            <td>
                                <p style="margin-bottom: 0px; padding-right: 20px;color: #333333"><%=fbdata.getFacebookId()%></p>
                            </td>
                            <td align="left">
                                <label><input type="checkbox" name="facebook" id="facebookv${i}" style="margin: 0px;padding-left: 20px;padding-left: 20px; border-radius: 5px"></label>
                            </td>
                        </tr>
                        <%}}%>
                        <%if(!fbcheck){%>
                        <tr>
                            <td style="padding-left: 30px">
                                <h2 style="color: #3b5998">Facebook</h2><p>Not Connected</p>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                    <g:javascript>
                        $('.selectall').click(function() {
                            if ($(this).is(':checked')) {
                                $('div input').attr('checked', true);
                            } else {
                                $('div input').attr('checked', false);
                            }
                        });
                    </g:javascript>
                </div>
                <div class="modal-footer">
                    <button type="button" data-dismiss="modal" class="btn btn-default" style="float: left" onclick="selectvideofb();">Save</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>

        </div>
    </div>

</div>
