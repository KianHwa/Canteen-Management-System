<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="AddMeal.css">
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
                            <a href="UpdateFood.jsp">Update Food Items</a>
                            <a href="AddFood.jsp">Add Food Items</a>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="managemeal"><a href="">Manage Meal</a></button>
                        <div class="dropdownContent">
                            <a href="UpdateMeal.jsp">Update Meals Set</a>
                            <a href="AddMeal.jsp">Add Meal Set</a>
                        </div>
                    </div>
                </ul>
            </div>
        </div>
        
    </header>
    
    <div class="content">
        <div class="addmealtitle">
            <h1>Add Meal Set</h1>
        </div>
        
        
        <form action="" action="" class="addmeal">
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
                <input type="text" id="mealprice" name="mealprice" placeholder="Meal Set Price.." required>
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
                    <input type="file" name="pic" accept="image/*" id='mealimg'>
                </div>
            </div>
            
            <!--Meal's Food -->
            <div class="row">
                <div class="col-25">
                    <label for="meal">Select Food</label>
                </div>
                <div class="col-75">
                    <select id="food" name="food" multiple required>
                        <option value="egg">Egg</option>
                        <option value="chicken">Chicken</option>
                        <option value="rice">Rice</option>
                    </select>
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