<jsp:useBean id="staff" scope="session" class="Model.Staff" />

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            <%@ include file="ProfileSetting.css"%>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
        </style>
        <title>Your Profile</title>
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
                <a href="MealSetList.jsp"><img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px"></a>
            </div>
            <div class="top2">
                <a href="ManagerProfileSetting.jsp">
                <div class="profilePic">
                </div>
                </a>
                <div class="staffhello">
                    <p><%= staff.getStaffname()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                        <li><a href="../LogOut">Log out</a></li>
                        <div class="dropdown">
                            <button class="report"><a href="">Report</a></button>
                            <div class="dropdownContent">
                                <a href="DailyReportMenu.jsp">Daily Meal Sales Report</a>
                                <a href="AnnualReportMenu.jsp">Annual Sales Report</a>
                                <a href="CaloriesReportMenu.jsp">Student's Calories Intake Report</a>

                                <a href="CancelOrderReportMenu.jsp">Meal Cancellation Report</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="managefood"><a href="">Manage Food</a></button>
                            <div class="dropdownContent">
                                <a href="FoodList.jsp">Update Food Items</a>
                                <a href="AddFood.jsp">Add Food Items</a>
                            </div>
                        </div>
                        <div class="dropdown">
                            <button class="managemeal"><a href="">Manage Meal</a></button>
                            <div class="dropdownContent">
                                <a href="MealSetList.jsp">Update Meals Set</a>
                                <a href="AddMeal.jsp">Add Meal Set</a>
                            </div>
                        </div>
                    </ul>
            </div>
        </div>
        
    </header>
    
    <div class="content">
        <div class="profiletitle">
            <h1>Your Profile</h1>
            <h3>Hi, <%= staff.getStaffname()%></h3>
        </div>
        <div class="uppernote">
            <p style="text-align: right; font-size: 20; text-align:center">Staffs are only allowed to change their email address, 
                phone number, and login password. To change other options, students are required to 
                seek for school admin help and permission.
            </p>
        </div>
        
        <div class="profile">
            <form action="../EditManagerProfile?staffid=<%= staff.getStaffid()%>" method="POST" id="editprofileform">
                <fieldset> <br/>
                    <label for="name">Username</label>
                    <input type="text" name="name" id="name" value="<%= staff.getStaffname()%>"><br>
                    
                    <label for="id">ID</label>
                    <input type="text" name="id"  id="id" value="<%= staff.getStaffid()%>"  readonly><br>
                    
                    <label for="icno">Identity Card No:</label>
                    <input type="text" name="icno" id="icno" value="<%= staff.getStaffic()%>" readonly><br>
                    
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email"  value="<%= staff.getStaffemail()%>" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"><br/>
                    
                    <label for="oldpwd">Old Password</label>
                    <input type="password" name="oldpwd" id="oldpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" >
                    
                    <label for="newpwd">New Password</label>
                    <input type="password" name="newpwd" id="newpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" >

                    <label for="rpwd">Reenter Password</label>
                    <input type="password" id="rpwd" name="rpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" ><br/>

                    <label for="hpno">Phone Number</label>
                    <input type="text" id="hpno" name="phone" value="<%= staff.getStaffphone()%>" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12"  title="Ten digits code">
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
        
        
    </div>
    
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>
