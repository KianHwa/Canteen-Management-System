<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Food, java.util.*" %>
<%@page import="Model.Meal, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>
<% List<Meal> mealList = (List<Meal>) session.getAttribute("mealList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="MealSetList.css">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            <%@ include file="MealSetList.css"%>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
        </style>
    </head> 
<body>
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px">
            </div>
            <div class="top2">
                <a href="ManagerProfileSetting.jsp">
                <div class="profilePic">
                </div>
                </a>
                <div class="hello">
                    <p><%= staff.getStaffname()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../HeaderFooter/loading.jsp?status=loggingout">Log out</a></li>
                    <div class="dropdown">
                        <button class="report"><a href="">Report</a></button>
                        <div class="dropdownContent">
                            <a href="TransactionReport.jsp">Daily Meal Sales Report</a>
                            <a href="SummaryReport.jsp">Annual Sales Report</a>
                            <a href="CaloriesSummary.jsp">Student's Calories Intake Report</a>

                            <a href="ExceptionReport.jsp">Meal Cancellation Report</a>
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
        <table id="mealsetlist" style="height:250px">
            <%for (int i=0 ; i< mealList.size() ; i++){
                Meal meal = mealList.get(i);
            %>
                        <tr>
                            <td rowspan="4" style="width:30%; height:250px"><img src="../Images/545451.jpg" style="width:100%"></td>
                            <td colspan="2"><%= meal.getMealname()%></td>
                        </tr>
                        <tr>
                            <td colspan="2"><%= meal.getMealdesc()%></td>
                        </tr>
                        <tr>
                            <td colspan="2"><%= meal.getMealprice()%></td>
                        </tr>
                        <tr>
                            <td><a href="UpdateMeal.jsp?mealid=<%= meal.getMealid()%>"><button id="updatemealbtn">Update</button></a></td>
                            <td><a href=""><button id="deletemealbtn">Delete</button></a></td>
                        </tr> 
            <%}%>
                      </table>
    </div>
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>