
<html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="Login.css">
    </head>
    <body>
        <div class="loginform">
        <form action="../LoginVerification" method="POST">
            <fieldset>
                <legend>Login Into Your Account</legend>
                <label for="id" name="id">Login ID</label>
                <input type="text" id="id" name="userid">
                <label for="pwd" name="pwd">Password</label>
                <input type="password" id="pwd" name="password">
                <a href=""class="forgotPwd">Forgot your password ?</a><br/>
                <a href="Main.jsp"><button id="backbtn">Back</button></a>
                <input type="submit" value="Login" id="loginbtn">
                
            </fieldset>
        </form>
        </div>
    </body>
</html>