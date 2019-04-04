<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="MealSetList.css">
        
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
                    <p>Hello World</p>
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
        <table id="mealsetlist" style="height:250px">
                        <tr>
                            <td rowspan="4" style="width:30%; height:250px"><img src="../Images/545451.jpg" style="width:100%"></td>
                            <td colspan="2">Meal Name</td>
                        </tr>
                        <tr>
                            <td colspan="2">Meal description</td>
                        </tr>
                        <tr>
                            <td colspan="2">Price</td>
                        </tr>
                        <tr>
                            <td><a href="UpdateMeal.jsp"><button id="updatemealbtn">Update</button></a></td>
                            <td><a href=""><button id="deletemealbtn">Delete</button></a></td>
                        </tr> 
                      </table>
    </div>
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>