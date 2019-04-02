<html>
    <head>
        <title>Register</title>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        
    </head>
    <body>
        <%
            String status = request.getParameter("status");
            String existedStudID = request.getParameter("studid");
            if(status!=null){
                if(status.equals("error")){                 
        %>
        <script>
            alert("Invalid Student ID, Please retry again.");
        </script>
        <%}else if(status.equals("existed")){%>
        <script>
            var studid = "'<%=existedStudID %>'";
            alert("Student ID " + studid + " already registered, Please retry again.");
        </script>
        <%}}%>
        
        <form action="../RegistrationVerification" method="POST">
            <fieldset>
                <legend>Sign Up Into Your Account</legend>
                <label for="id" name="id">Student ID</label>
                <input type="text" id="id" name="userid">
                
                <label for="email" name="pwd">Password</label>
                <input type="password" id="pwd" name="pwd">      
                
                <label for="email" name="pwd">Email</label>
                <input type="text" id="email" name="email">
                
                <label for="email" name="pwd">Phone Number</label>
                <input type="text" id="email" name="phone">  
                
                <input type="submit" name="register" value="Register">
            </fieldset>
        </form>
        
    </body>
</html>
