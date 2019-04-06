<html>
    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="SignUp.css">
    </head>
    <body>
        <%
            String status = request.getParameter("status");
            String existedStudID = request.getParameter("studid");
            String existedStaffID = request.getParameter("staffid");
            if(status!=null){
                if(status.equals("error")){                 
        %>
        <script>
            alert("Invalid Student ID, Please retry again.");
        </script>
        <%}else if(status.equals("studexisted")){%>
        <script>
            var studid = "'<%=existedStudID %>'";
            alert("Student ID " + studid + " already registered, Please retry again.");
        </script>
        <%}else if(status.equals("staffexisted")){%>
        <script>
            var staffID = "'<%=existedStaffID %>'";
            alert("Staff ID " + staffid + " already registered, Please retry again.");
        </script>
        <%}}%>
        
        <div class="signupform">
        <form action="../RegistrationVerification" method="POST" id="regform">
            <fieldset>
                <legend>Account Sign Up</legend>
                
                <label for="id" name="id" >Student/Staff ID*</label>
                <input type="text" id="id" name="userid" placeholder="e.g. STD1001" required>
                
                <label for="pwd" name="pwd" >Password*</label>
                <input type="password" id="pwd" name="pwd" placeholder="Combinations of letters, numbers, and symbols usage is highly recommended."
                       required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                
                <label for="rpwd" name="rpwd">Retype Password*<span id="message"></span></label>
                <input type="password" id="rpwd" name="rpwd"  required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                
                <label for="email" name="email" >E-mail*</label>
                <input type="text" id="email" name="email" required placeholder="johndoe@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">>
                
                <label for="hpno" name="hpno" >Phone Number*</label>
                <input type="text" id="hpno" name="phone" required placeholder="e.g. 888 888 8888" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12"  title="Ten digits code">
            </fieldset>
        </form>
            <a href="Main.jsp"><button id="backbtn">Back</button></a>
            <input type="submit"value="Sign Up Now!"id="signupbtn" form="regform">
            
            <script>
            var password = document.getElementById("pwd")
            , confirm_password = document.getElementById("rpwd");

          function validatePassword(){
            if(password.value != confirm_password.value) {
              confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
              confirm_password.setCustomValidity('');
            }
          }

          password.onchange = validatePassword;
          confirm_password.onkeyup = validatePassword;
            </script>   
        </div>
    </body>
</html>
