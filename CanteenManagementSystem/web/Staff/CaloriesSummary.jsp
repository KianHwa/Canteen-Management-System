<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="CaloriesSummary.css">
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
                    <p>Manager's Name</p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../LogOut">Log out</a></li>
                    
                    <div class="dropdown">
                        <button class="report"><a href="">Report</a></button>
                        <div class="dropdownContent">
                            <a href="TransactionReport.jsp">Daily Meal Sales Report</a>
                            <a href="SummaryReport.jsp">Annual Sales Report</a>
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
        <form action="action_page.php" method="">
            <br/><br/>
            <input type="text" placeholder="Search Student ID..">
            Pick a month and a year <input type="month" name="monthyear">
            <table id="caloriesreport">
                <tr>
                    <td colspan="5" id="calories"><h1>Student's Calories Intake Report</h1></td>
                </tr>
                <tr>
                    <th>Meal Sets</th>
                    <th>Calories (kcal)</th>
                    <th>Quantity Sold</th>
                    <th>Total Calories Consumed (kcal)</th>

                </tr>
                <tr>
                    <td>Meal Set L1</td>
                    <td>11111111</td>
                    <td>2222222</td>
                    <td>3333333</td>

                </tr>
                <tr>
                    <td colspan="5">
                        <input type="submit" value="Print" id="printbtn">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    <footer>
        <div class="bottom">
            <p style="text-align: center; font-size: 20"><a href="AboutUs.jsp">About Us</a></p>
        </div>
    </footer>
    
</body>
</html>
