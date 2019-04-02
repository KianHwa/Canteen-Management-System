<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="AddFood.css">
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
                    <li><a href="">Home</a></li>
                </ul>
            </div>
        </div>
        
    </header>
    <div class="content">
        <div class="addfoodtitle">
            <h1>Add Food Items</h1>
        </div>
      <form action="../AddFood" method="POST" class="addfood">
        <div class="row">
          <div class="col-25">
            <label for="foodname">Food Name</label>
          </div>
          <div class="col-75">
            <input type="text" id="lname" name="foodname" placeholder="Food Name..">
          </div>
        </div>
          
          <div class="row">
          <div class="col-25">
            <label for="calories">Calories</label>
          </div>
          <div class="col-75">
            <input type="text" id="lname" name="calories" placeholder="e.g. 1500">
          </div>
        </div>
          
        <div class="row">
          <input type="submit" value="Add Food" class="addfoodbtn">
        </div>
      </form>
          
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>