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
            <link rel="icon" href="../Images/chefhead.png">
            <script src="../HeaderFooter/HeaderAndFooter.js"></script>
            <style>
                <%@ include file="MealSetList.css"%>
                <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
                <%@ include file="../HeaderFooter/PopOut.css"%>
            </style>
            <title>Meals</title>
        </head> 
    <body>
        <%
            String status = request.getParameter("status");
            String mealname = request.getParameter("meal");
        %>

        <%if(status!=null){
            if(mealname!=null || !mealname.equals("")){
               if(status.equals("updatemealsuccess")){%>
               <div id="myModal" class="modal">
                    <div class="modal-content">
                      <span class="close">&times;</span>
                      <p style="text-align:center">Meal "<%= mealname%>" successfully updated</p>
                    </div>
                </div>
                <script src="../HeaderFooter/PopOut.js"></script>
           <%}}}%>
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
                                <a href="TransactionReport.jsp">Daily Meal Sales Report</a>
                                <a href="AnnualSalesReport.jsp">Annual Sales Report</a>
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
            <div class="meallisttitle">
                <h1>Meal Set Lists</h1>
            </div>
            <%
                if(mealList.size() == 0){
            %>
            <div class="nomeal">
                <h2>Currently there's no meal</h2>
            </div>
            <%}%>
                <%
                    for (int i=0 ; i< mealList.size() ; i++){
                    Meal meal = mealList.get(i);
                    String mealStatus = meal.getMealstatus();
                %>

                <%if(mealStatus.equals("Active")){%>
                    <table id="mealsetlist" style="height:250px">
                <%}else if(mealStatus.equals("Inactive")){%>
                    <table id="mealsetlist" style="height:250px;border:2px solid red;">
                <%}%>
                            <tr>
                                <td rowspan="4" style="width:30%; height:250px"><img src="<%= meal.getMealimage()%>" style="width:100%"></td>
                                <td colspan="2"><%= meal.getMealname()%></td>
                            </tr>
                            <tr>
                                <td colspan="2"><%= meal.getMealdesc()%></td>
                            </tr>
                            <tr>
                                <td colspan="2">RM <%= meal.getMealprice()%></td>
                            </tr>
                            <tr>
                                <td><a href="UpdateMeal.jsp?mealid=<%= meal.getMealid()%>"><button id="updatemealbtn">Update</button></a></td>
                                <%if(mealStatus.equals("Active")){%>
                                    <td><a href="../ChangeMealStatus?mealstatus=Active&mealid=<%= meal.getMealid()%>"><button id="deletemealbtn">Active</button></a></td>
                                <%}else if(mealStatus.equals("Inactive")){%>
                                <td><a href="../ChangeMealStatus?mealstatus=Inactive&mealid=<%= meal.getMealid()%>"><button id="deletemealbtn">Inactive</button></a></td>
                                <%}%>
                            </tr> 

                          </table>
                          <%}%>
        </div>
        <footer>
            <div class="bottom">

            </div>
        </footer>

    </body>
    </html>