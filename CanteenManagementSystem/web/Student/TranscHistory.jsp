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
        <link rel="stylesheet" href="TranscHistory.css">
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
        </style>
        <title>Transaction History</title>
    </head>
    <body>
        <header>
        <div class="top"id="navbar">
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
        <div class="transchistory">
            <h1>Transaction History</h1>
        </div>
               
                    <table id="transaction">
                        <tr>
                          <th>No.</th>
                          <th>Date</th>
                          <th>Meal Set</th>
                          <th>Meal Category</th>
                          <th>Price (RM)</th>
                          <th>Credit Points (pts)</th>
                        </tr>
                        <%
                            int counts = 0;
                            int pricetotal = 0;
                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            
                        for(int i=0 ; i<orderList.size() ; i++){
                            Orders orders = orderList.get(i);
                            if(orders.getOrderstatus().equals("Paid") || orders.getOrderstatus().equals("Claimed") && orders.getStudentStudid().getStudid().equals(student.getStudid())){
                                counts++;
                                String date = df.format(orders.getOrderdate());
                                pricetotal+=orders.getOrderMealList().get(0).getMealMealid().getMealprice();
                                
                        %> 
                        <tr>
                            <td><%= counts%></td>
                            <td><%= date%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealname()%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealcategory()%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealprice()%></td>
                            <td><%= orders.getOrderMealList().get(0).getMealMealid().getMealprice() * 10%></td>
                        </tr>
                        <%}}%>
                        <tr>
                            <td colspan="4"><p style="text-align:right;font-weight:bold">Total : </p></td>
                            <td><%= pricetotal%></td>
                            <td><%= pricetotal * 10%></td>
                        </tr>
                      </table>
    </div>    
        
    </body>
</html>