
<html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="Login.css">
        <link rel="icon" href="../Images/chefhead.png">
        <style>
            <%@ include file="Login.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
        </style>
        <title>Login</title>
    </head>
    <body>
        <%
            String status = request.getParameter("status");
            if(status!=null){
                if(status.equals("loginfailed")){
        %>
        <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">User ID or password may be incorrect, please login again. <br/>STD for student, STF for staff.</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
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