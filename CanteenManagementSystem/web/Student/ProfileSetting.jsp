<jsp:useBean id="student" scope="session" class="Model.Student" />

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            <%@ include file="ProfileSetting.css"%>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
        </style>
    </head> 
<body>
    <%
        String status = request.getParameter("status");
        if(status!=null){
           if(status.equals("success")){
    %>
    <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Profile Updated Successfully !</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
    <%}else if(status.equals("error")){%>
        <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Your old password is incorrect. <br/> Please enter the correct password to edit</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
    <%}}%>
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px">
            </div>
            <div class="top2">
                <div class="profilePic">
                    
                </div>
                <div class="hello">
                    <p><%= student.getStudname()%></p>
                </div>
                <div class="balance">
                    <p style="color:yellow;">Credit Points : <%= student.getCredpoints()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../HeaderFooter/loading.jsp?status=loggingout">Log out</a></li>
                    <li><button id="couponbtn">Coupon</button></li>
                    
                    <li><a href="OrderList.jsp">Order</a></li>
                    <li><a href="StudentHome.jsp">Home</a></li>
                    
                </ul>
            </div>
        </div>
    </header>
    
    <div class="content">
        <div class="profiletitle">
            <h1>Your Profile</h1>
            <h3>Hi, <%= student.getStudname()%></h3>
        </div>
        <div class="uppernote">
            <p style="text-align: right; font-size: 20; text-align:center">Students are only allowed to change their email address, 
                phone number, and login password. To change other options, students are required to 
                seek for school admin help and permission.
            </p>
        </div>
        
        <div class="profile">
            <form action="../EditStudentProfile?studid=<%= student.getStudid()%>" method="POST" id="editprofileform">
                <fieldset> <br/>
                    <label for="name">Username</label>
                    <input type="text" name="name" id="name" value="<%= student.getStudname()%>" readonly><br>
                    
                    <label for="id">ID</label>
                    <input type="text" name="id"  id="id" value="<%= student.getStudid()%>"  readonly><br>
                    
                    <label for="icno">Identity Card No:</label>
                    <input type="text" name="icno" id="icno" value="<%= student.getStudic()%>" readonly><br>
                    
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email"  value="<%= student.getStudemail()%>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"><br/>
                    
                    <label for="oldpwd">Old Password</label>
                    <input type="password" name="oldpwd" id="oldpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                    
                    <label for="newpwd">New Password</label>
                    <input type="password" name="newpwd" id="newpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>

                    <label for="rpwd">Reenter Password</label>
                    <input type="password" id="rpwd" name="rpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required><br/>

                    <label for="hpno">Phone Number</label>
                    <input type="text" id="hpno" name="phone" value="<%= student.getStudphone()%>" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12"  title="Ten digits code">
                </fieldset> 
            </form>
            
            <input type="submit" value="Save Changes" id="savebtn" form="editprofileform">
            <a href=""><button id="cancelbtn">Cancel</button></a>
        </div>
                
                <script>
            var password = document.getElementById("newpwd")
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
        
        <div class="btngroup">
            <a href=""><button id="historybtn">History</button></a>
            <a href=""><button id="calintakes">Calories Intake</button></a>
        </div>
    </div>
    
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>
