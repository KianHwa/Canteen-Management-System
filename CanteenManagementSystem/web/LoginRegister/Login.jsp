
<html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="Login.css">
        <style>
            <%@ include file="Login.css"%>
        </style>
    </head>
    <body>
        <%
            String status = request.getParameter("status");
            if(status!=null){
                if(status.equals("loginfailed")){
        %>
        <script>alert("User ID or password may be incorrect, please login again. \nSTD for student, STF for staff.");</script>
        <%}}%>
        <div class="loginform">
        <form action="../LoginVerification" method="POST" id="loginform">
            <fieldset>
                <legend>Login Into Your Account</legend>
                <label for="id" name="id">Login ID</label>
                <input type="text" id="id" name="userid" required>
                <label for="pwd" name="pwd">Password</label>
                <input type="password" id="pwd" name="password" required> 
                <a href=""class="forgotPwd">Forgot your password ?</a><br/>
                
            </fieldset>
        </form>
                <a href="Main.jsp"><button id="backbtn">Back</button></a>
                <input type="submit" value="Login" id="loginbtn" form="loginform">
                <div class="notregdiv"><br/>Not registered?<a href="SignUp.jsp" class="notreg"> Click here</a></div>
                
        </div>
    </body>
</html>