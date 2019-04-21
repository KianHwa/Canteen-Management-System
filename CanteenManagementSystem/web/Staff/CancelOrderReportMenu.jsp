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
                <%@ include file="Report.css"%>
            </style>
            <title>Meals</title>
        </head> 
    <body>
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
        <div class="reporttitle">
            <h1>Meal Cancellation Report</h1>
        </div>
      <form action="../CancelOrderReport" method="POST" class="reports" id="reports" target="_blank">
        <div class="row">
          <div class="col-25">
            <label for="year">Report's Year</label>
          </div>
          <div class="col-75">
              <select name="year" id="year">
                  <option value="2018">2018</option>
                  <option value="2019">2019</option>
              </select>
          </div>
        </div>
          
        <div class="row">
          <input type="submit" value="Generate" class="checkreportbtn">
        </div>
      </form>
      </div>
                    
        <footer>
            <div class="bottom">

            </div>
        </footer>

    </body>
    </html>