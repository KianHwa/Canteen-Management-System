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
            <%@ include file="PrintCoupon.css"%>
        </style>
        <title>Print Coupon</title>
    </head> 
<body>
    <%
                            
                            int count=0;
                            SimpleDateFormat dff = new SimpleDateFormat("yyyy-MM-dd");
                            for(int i=0 ; i<orderList.size() ; i++){
                                int orderfoodsize = 0;
                                Orders orders = orderList.get(i);
                                if(orders.getOrderstatus().equals("Paid") && orders.getStudentStudid().getStudid().equals(student.getStudid())){
                                    orders.getOrderMealList().get(0).getMealMealid().getMealid();
                                    count++;
                                    String date = dff.format(orders.getOrderdate());
                                    
    %>
            <div class="coupon">
                <div class="container" id="top">
                    <h3><img src="../Images/logo.png" style="max-height:75px;width:75px;margin-left:45%;"></h3>
            </div>

                <div class="container" id="mid" style="background-color:white">
                <h2 style="padding:20px;text-align: center;color:gray"><b><%= orders.getOrderMealList().get(0).getMealMealid().getMealname()%></b></h2> 
                
                <h4 style="text-align:center;color:gray">Category: <%= orders.getOrderMealList().get(0).getMealMealid().getMealcategory()%></h4>
                
                </div>
                <div id="message">
                <p style="text-align:center;font-size: 12px;color:gray">
                    Present this coupon at time when you redeem your meal to the staff in charge<br/> 
                    Each coupon can only redeem one meal at a time<br/>Expired Coupon are not acceptable
                </p>
                </div>
                <div class="container" id="bottom">
                <p>Use Coupon Code: <span class="promo"><%= orders.getCouponcode()%></span></p>
                <p class="expire">Expires: After <%= date%></p>
                </div>
            </div>
    <%}}%>
    
</body>
</html>