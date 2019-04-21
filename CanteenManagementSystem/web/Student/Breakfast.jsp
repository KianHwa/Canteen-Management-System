<%@page import="Model.Orders"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="student" scope="session" class="Model.Student" />
<%@page import="Model.Food, java.util.*" %>
<%@page import="Model.Meal, java.util.*" %>
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
            <%@ include file="BreakfastLunch.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
        </style>
        <title>Breakfast</title>
    </head> 
<body>
    <%
        String status = request.getParameter("status");
        String dates = request.getParameter("date");
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        if(status!=null){
            if(status.equals("fail")){
    %>
    <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">You already ordered a meal on <%= dates%></p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
    <%}else if(status.equals("late")){%>
        <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Sorry, you can only pre order 2 days in advance</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
    <%}else if(status.equals("ordered")){%>
        <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Successfully added your order</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
    <%}}%>
    <header>
        <div class="top" id="navbar">
            <div class="top1">
                <a href="StudentHome.jsp"><img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px"></a>
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
        <div class="title">
            <h1>Breakfast</h1>
        </div>
        <div class="foodList">
        <%
            for(int i=0 ; i<mealList.size() ; i++){
                Meal meal = mealList.get(i);
                if(meal.getMealcategory().equals("breakfast") && meal.getMealstatus().equals("Active")){
        %>
        
                <div class="container">
                    <div class="images">
                        <img src="<%= meal.getMealimage()%>" id="image">
                    </div>
                    <div class="foodName">
                        <h2><%= meal.getMealname()%></h2>
                    </div>
                    <div class="foodPrice">
                        <h3>RM <%= meal.getMealprice()%></h3>
                    </div>
                    <div class="btnclass">
                        <form action ="../OrderMeal?mealid=<%= meal.getMealid()%>&studid=<%= student.getStudid()%>&mealcat=<%= meal.getMealcategory()%>" method="POST">
                            <label for="startdatebtn">Start date:</label>
                            <input type="date" id="startdate" name="startdate" required>
                            <label for="enddatebtn">End date:</label>
                            <input type="date" id="enddate" name="enddate" required>
                            <input type="submit" id="orderbtn" value="Order">
                        </form>
                    </div>
                        <span class="tooltiptext"><%= meal.getMealdesc()%></span>
                </div>
        <%}}%>
        </div>
    </div>
    
        <footer>
            <div class="bottom">
                <p style="text-align: center; font-size: 20"><a href="AboutUs.jsp">About Us</a></p>
            </div>
        </footer>
    
</body>
</html>