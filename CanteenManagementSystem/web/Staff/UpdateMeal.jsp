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
        <link rel="stylesheet" href="UpdateMeal.css">
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <title>Update Meal</title>
        <style>
            <%@ include file="UpdateMeal.css"%>
            <%@ include file="../HeaderFooter/HeaderAndFooter.css"%>
            /* The container */
            .container {
              display: block;
              position: relative;
              padding: 5px 35px 10px 35px;
              cursor: pointer;
              font-size: 15px;
              user-select: none;
              width:50%;
              float:left;
            }

            .container input {
              position: absolute;
              opacity: 0;
              cursor: pointer;
              height: 0;
              width: 0;
            }

            .checkmark {
              position: absolute;
              top: 0;
              left: 0;
              height: 25px;
              width: 25px;
              background-color: #eee;
              border:1px solid gray;
              
            }
            
            .container:hover input ~ .checkmark {
              background-color: #ccc;
            }
            
            .container input:checked ~ .checkmark {
              background-color: black;
            }
            
            .checkmark:after {
              content: "";
              position: absolute;
              display: none;
            }

            .container input:checked ~ .checkmark:after {
              display: block;
            }

            .container .checkmark:after {
              left: 7px;
              top: 4px;
              width: 5px;
              height: 10px;
              border: solid white;
              border-width: 0 3px 3px 0;
              transform: rotate(45deg);
            }
        </style>
    </head> 
<body>
    <%
        String selectedMealid = request.getParameter("mealid");
    %>
    
    <header>
        <div class="top" id="navbar">
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
            String mealid ="";
            String mealname ="";
            String mealdesc = "";
            String mealcategory ="";
            int mealprice = 0;
            
            for(int i=0 ; i<mealList.size() ; i++){
                Meal meal = mealList.get(i);
                if(meal.getMealid().equals(selectedMealid)){
                    mealid = meal.getMealid();
                    mealname = meal.getMealname();
                    mealprice = meal.getMealprice();
                    mealdesc = meal.getMealdesc();
                    mealcategory = meal.getMealcategory();
                }
            }
            
        %>
        
        <div class="editmealtitle">
            <h1>Edit Meal Set</h1>
        </div>
        
        
        <form action="../UpdateMeal?mealid=<%= mealid%>&mealprice=<%= mealprice%>" method ="POST" class="editmeal">
            <!-- Meal Set Name-->
            <div class="row">
                <div class="col-25">
                    <label for="mealname">Meal Set Name</label>
                </div>
            <div class="col-75">
                <input type="text" id="mealname" name="mealname" value="<%= mealname%>" placeholder="Meal Set Name.." required>
            </div>
            </div>
            
            <!--Meal Set Price -->
            <div class="row">
                <div class="col-25">
                    <label for="mealprice">Meal Set Price</label>
                </div>
            <div class="col-75">
                <input type="text" id="mealprice" name="mealprice" value="<%= mealprice%>" placeholder="Meal Set Price.." required>
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
                            for(int i=0 ; i<foodList.size() ; i++){
                                Food food = foodList.get(i);
                        %>
                            <label class="container"><%= food.getFoodname()%>
                                    <input type="checkbox" name="<%= "foodArr[" + i + "]"%>" disabled>
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
                    <textarea id="subject" name="mealdesc" placeholder="Write the meal's description .." style="height:200px"><%= mealdesc%></textarea>
                </div>
            </div>
            
            <div class="row">
                <input type="submit" value="Confirm" class="editmealbtn">
                <input type="reset" value="Reset" class="resetbtn">
            </div>
      </form>
          
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>