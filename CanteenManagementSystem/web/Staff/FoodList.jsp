<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Food, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="FoodList.css">
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            <%@ include file="FoodList.css"%>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
        </style>
        <title>Food</title>
    </head> 
<body>
    <%
        String status = request.getParameter("status");
    %>
    
    <%if(status!=null){
           if(status.equals("updatefoodsuccess")){%>
           <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Food updated successfully</p>
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
        <div class="foodlisttitle">
            <h1>Food Lists</h1>
        </div>
        <%
            if(foodList.size() !=0){
        %>
        <table id="foodlist" style="height:150px">
            <tr style="height:50px">
                <th>No</th>
                <th>Food</th>
                <th>Calories (kcal)</th>
                <th></th>
                <th></th>
            </tr>
            <%for (int i=0 ; i<foodList.size() ; i++){
                Food food = foodList.get(i);
            %>
            <tr style="height:50px">
                <td style="width:10%"><%= i+1%></td>
                <td style="width:30%"><%= food.getFoodname()%></td>
                <td style="width:30%"><%= food.getFoodcalories()%></td>
                <td style="width:15%"><a href="UpdateFood.jsp?foodid=<%= food.getFoodid()%>"><button id="updatefoodbtn">Update</button></a></td>
                <td style="width:15%"><a href=""><button id="deletefoodbtn">Delete</button></a></td>
            </tr>
            <%}}else{%>
                <div class="nofood">
            <h2>Currently there's no food</h2>
        </div>
            <%}%>
        </table>
    </div>
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>