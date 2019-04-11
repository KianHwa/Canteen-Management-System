<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Food, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="FoodList.css">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        
    </head> 
<body>
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
                    <li><a href="../LoginRegister/Main.jsp">Log out</a></li>
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
            <%}%>
            
            <tr>
                
            </tr> 
        </table>
    </div>
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>