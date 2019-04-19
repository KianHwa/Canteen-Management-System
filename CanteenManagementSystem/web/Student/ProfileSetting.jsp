<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="student" scope="session" class="Model.Student" />
<%@page import="Model.Food, java.util.*" %>
<%@page import="Model.Meal, java.util.*" %>
<%@page import="Model.Orders, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>
<% List<Meal> mealList = (List<Meal>) session.getAttribute("mealList");%>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>

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
                <img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px">
            </div>
            <div class="top2">
                <a href="ProfileSetting.jsp">
                <div class="profilePic">
                </div>
                </a>
                <div class="hello">
                    <p><%= student.getStudname()%></p>
                </div>
                <div class="balance">
                    <p style="color:yellow;">Credit Points : <%= student.getCredpoints()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../LogOut">Log out</a></li>
                    <li><button id="couponbtn">Coupon</button></li>
                    
                    <li><a href="OrderList.jsp">Order</a></li>
                    <li><a href="StudentHome.jsp">Home</a></li>
                    
                </ul>
            </div>
        </div>
    </header>
                <div id="myModal" class="modals">
            <div class="modal-contents">
                <div class="modal-header">
                    <span class="close">&times;</span>
                    <h1>Meal Coupon</h1>
                </div>
                <div class="modal-body">
                    
                    <table id="meals">
                        <tr>
                          <th>No</th>
                          <th>Date</th>
                          <th>Meal Set Name</th>
                          <th>Meal ID</th>
                          <th>Coupon Code</th>
                          <th></th>
                        </tr>
                        <%
                            
                            int count=0;
                            SimpleDateFormat dff = new SimpleDateFormat("yyyy-MM-dd");
                            for(int i=0 ; i<orderList.size() ; i++){
                                Orders orders = orderList.get(i);
                                if(orders.getOrderstatus().equals("Paid") && orders.getStudentStudid().getStudid().equals(student.getStudid())){
                                    count++;
                                    String date = dff.format(orders.getOrderdate());
                                    
                                    
                        %>
                        <tr>
                            <td><%= count%></td>
                            <td><%= date%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealcategory()%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealid()%></td>
                            <td><%= orders.getCouponcode()%></td>
                            <td><form action="../CancelOrder?orderid=<%= orders.getOrderid()%>&mealprice=<%= orders.getOrderMealList().get(0).getMealMealid().getMealprice()%>&studid=<%= student.getStudid()%>" method="POST"><input type="submit" id="cancelbtn" value="Cancel"></form></td>
                        </tr>
                        <%}}%>
                        
                      </table>
                      <form action="PrintCoupon.jsp" method="POST" target="_blank"><input type="submit" value="Print" id="printbtn"></form>
                      
                </div>
                <div class="modal-footer">
                    <h3></h3>
                </div>
            </div>
          </div>
    <script src="../HeaderFooter/OrderModal.js"></script>
    
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
                    <input type="password" name="oldpwd" id="oldpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" >
                    
                    <label for="newpwd">New Password</label>
                    <input type="password" name="newpwd" id="newpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" >

                    <label for="rpwd">Reenter Password</label>
                    <input type="password" id="rpwd" name="rpwd" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" ><br/>

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
            <a href="TranscHistory.jsp"><button id="historybtn">History</button></a>
            <a href="WeeklyIntake.jsp"><button id="calintakes">Calories Intake</button></a>
        </div>
    </div>
    
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>
