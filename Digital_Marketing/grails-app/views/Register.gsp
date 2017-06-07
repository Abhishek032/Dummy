
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="grails_stylesheet.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Digital Marketing | Register</title>
</head>
<body>
<div class="container">
    <header>
        <h3>Digital Marketing</h3>
    </header>
</div>
<div class="row">
    <div class="col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4 relative" align="center" >

        <div class="para">
            <h2>SignUp</h2>
        </div>
        <div class="content">
            <br>
            <form method="get" action="loginform">
                <input type="text" placeholder="Name" required name="name">
                <input type="text" placeholder="Email" required name="email">
                <input type="text" placeholder="Contact No" required name="contact">
                <select name="Industry">
                    <option>Industry</option>
                    <option value="it">IT</option>
                    <option value="telecom">Telecom</option>
                    <option value="banking">Banking</option>
                    <option value="education">Education</option>
                    <option value="realEstate">Real Estate</option>
                </select>
                <input type="text" placeholder="Company Name" required name="company">
                <input type="text" placeholder="Password" required name="password">

                <input type="submit" class="btn" value="SignUp">
            </form>
            <br>
            <br>
        </div>
    </div>
</div>

</body>
</html>