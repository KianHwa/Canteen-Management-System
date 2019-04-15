<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Meal, java.util.*" %>
<%@page import="Model.Orders, java.util.*" %>
<% List<Meal> mealList = (List<Meal>) session.getAttribute("mealList");%>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>
<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="StaffHome.css">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
    </head> 
<body>
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png" style="height:120px;padding:14px 40px">
            </div>
            <div class="top2">
                <div class="profilePic">
                    
                </div>
                <div class="hello">
                    <p><%= staff.getStaffname()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../LoginRegister/Main.jsp">Log out</a></li>
                    <li><a href="TopUp.jsp">Top Up</a></li>
                    <li><a href="">Ingredients</a></li>
                    <li><a href="MealSet.jsp">Meal Set List</a></li>
                    <li><a href="StaffHome.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </header>
    
    <div class="content">
        <div class="couponclaimtitle">
            <h1>Coupon Status</h1>
        </div>
            <form action="" method="">
                <input type="text" placeholder="Enter coupon code ..." id="claimcouponbox">
                <input type="submit" value="Claim" id="claimcouponbtn">
                    <table id="claimcoupon">
                        <tr>
                          <th>No</th>
                          <th>Order Date</th>
                          <th>Meal Set</th>
                          <th>Price</th>
                          <th>Status</th>
                        </tr>
                        <%  
                            int count = 1;
                            for(int i=0 ; i<orderList.size() ; i++){
                                Orders orders = orderList.get(i);
                                if(orders.getOrderstatus().equals("Paid")){
                                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                String orderdate = df.format(orders.getOrderdate());
                                
                        %>
                        <tr>
                            <td><%= count%></td>
                            <td><%= orderdate%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealname()%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealprice()%></td>
                            <td><%= orders.getOrderstatus()%></td>
                        </tr>
                        <%count++;}}%>
                      </table>
            </form>
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>