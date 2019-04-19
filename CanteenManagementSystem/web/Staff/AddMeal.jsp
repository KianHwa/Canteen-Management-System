<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Food, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="AddMeal.css">
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            <%@ include file="AddMeal.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
        </style>
        <title>Add Meal</title>
    </head> 
<body>
    <%
        String status = request.getParameter("success");
        String mealname = request.getParameter("meal");
    %>
    
    <%if(status!=null){
           if(status.equals("true")){%>
           <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Meal "<%= mealname%>" successfully added</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
       <%}}%>
       
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png" style="height:120px;padding:14px 40px">
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
        <div class="addmealtitle">
            <h1></h1>
        </div>
        
        
        <form action="../AddMealSet" method="POST" class="addmeal">
            <!-- Meal Set Name-->
            <div class="row">
                <div class="col-25">
                    <label for="mealname">Meal Set Name</label>
                </div>
            <div class="col-75">
                <input type="text" id="mealname" name="mealname" placeholder="Meal Set Name.." required>
            </div>
            </div>
            
            <!--Meal Set Price -->
            <div class="row">
                <div class="col-25">
                    <label for="mealprice">Meal Set Price</label>
                </div>
            <div class="col-75">
                <input type="number" id="mealprice" name="mealprice" placeholder="Meal Set Price.." required>
            </div>
            </div>
            
            <!--Breakfast/Lunch-->
            <div class="row">
                <div class="col-25">
                    <label for="meal">Select Category</label>
                </div>
                <div class="col-75">
                    <select id="meal" name="meal">
                        <option value="breakfast">Breakfast</option>
                        <option value="lunch">Lunch</option>
                    </select> 
                </div>
            </div>
            
            <!--Meal Image-->
            <div class="row">
                <div class="col-25">
                    <label for="mealimg">Meal Image</label>
                </div>
                <div class="col-75">
                    <input type="text" name="pic" id='mealimg'>
                </div>
            </div>
            
            <!--Meal's Food -->
            <div class="row">
                <div class="col-25">
                    <label for="meal">Select Food</label>
                </div>
                <div class="col-75">
                        <%
                            int[] foodArr = new int[foodList.size()];
                            for(int i=0 ; i<foodList.size() ; i++){
                                Food food = foodList.get(i);
                        %>
                            <label class="container"><%= food.getFoodname()%>
                                    <input type="checkbox" name="<%= "foodArr[" + i + "]"%>">
                                    <span class="checkmark"></span>
                                </label>
                                
                        <%}%>
                </div>
            </div>
            
            <!--Meal Description-->
            <div class="row">
                <div class="col-25">
                    <label for="mealdesc">Meal Description</label>
                </div>
                <div class="col-75">
                    <textarea id="subject" name="mealdesc" placeholder="Write the meal's description .." style="height:200px"></textarea>
                </div>
            </div>
            
            <div class="row">
                <input type="submit" value="Add Meal Set" class="addmealbtn">
            </div>
      </form>
          
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>