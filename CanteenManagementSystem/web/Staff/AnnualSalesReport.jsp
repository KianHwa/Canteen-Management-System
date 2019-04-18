<jsp:useBean id="staff" scope="session" class="Model.Staff" />

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="AddFood.css">
        <link rel="stylesheet" href="../HeaderFooter/PopOut.css.css">
        <link rel="icon" href="../Images/chefhead.png">
        <style>
            <%@ include file="AddFood.css"%>
            <%@ include file="../HeaderFooter/PopOut.css"%>
            <%@ include file="Report.css"%>
        </style>
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <title>Annual Sales Report</title>
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
                <div class="staffhello">
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
    <div class="reporttitle">
            <h1>Annual Sales Report</h1>
        </div>
      <form action="../QueryTestingg" method="POST" class="annualsalesreport" target="_blank">
        <div class="row">
          <div class="col-25">
            <label for="reportdate">Report's Year</label>
          </div>
          <div class="col-75">
              <select name="year">
                  <option value="2018">2018</option>
                  <option value="2019">2019</option>
              </select>
          </div>
        </div>
          
        <div class="row">
          <input type="submit" value="Check" class="checkreportbtn">
        </div>
      </form>            
    </div>         
                
                
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>