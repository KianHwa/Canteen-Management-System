<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Food, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="UpdateFood.css"> 
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
    </head> 
    <title>Update Food</title>
<body>
    <%
        String selectedFoodid = request.getParameter("foodid");
        String foodname = "";
        int foodcalories = 0;
        String foodid = "";
    %>
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px">
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
                    <li><a href="../LogOut">Log out</a></li>
                    <li><a href="">Reports</a></li>
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
        <%
            for(int i=0 ; i<foodList.size() ; i++){
                Food food = foodList.get(i);
                if(food.getFoodid().equals(selectedFoodid)){
                    foodname = food.getFoodname();
                    foodcalories = food.getFoodcalories();
                    foodid = food.getFoodid();
                }
            }
        %>
        
        
        <div class="editfoodtitle">
            <h1>Update Food Items</h1>
        </div>
      <form action="../UpdateFood?foodid=<%= foodid%>" method="POST" class="editfood">
        <div class="row">
          <div class="col-25">
            <label for="foodname">Food Name</label>
          </div>
          <div class="col-75">
            <input type="text" id="foodname" name="foodname" placeholder="Food Name.." value="<%= foodname%>"required>
          </div>
        </div>
          
          <div class="row">
          <div class="col-25">
            <label for="calories">Calories</label>
          </div>
          <div class="col-75">
            <input type="text" id="foodcalories" name="calories" value="<%= foodcalories%>" placeholder="e.g. 1500">
          </div>
        </div>
          
        <div class="row">
          <input type="submit" value="Edit Food" class="editfoodbtn">
        </div>
      </form>
          
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>