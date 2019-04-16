<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="WeeklyIntake.css">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
    </head> 
    <body>
        <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px">
            </div>
            <div class="top2">
                <a href="ProfileSetting.jsp">
                <div class="profilePic">
                </div>
                </a>
                <div class="hello">
                    <p><%= student.getStudname()%></p>
                </div>
                <div class="balance">
                    <p style="color:yellow;">Credit Points : <%= student.getCredpoints()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../HeaderFooter/loading.jsp?status=loggingout">Log out</a></li>
                    <li><button id="couponbtn">Coupon</button></li>
                    
                    <li><a href="OrderList.jsp">Order</a></li>
                    <li><a href="StudentHome.jsp">Home</a></li>
                    
                </ul>
            </div>
        </div>
    </header>
        
     <div class="content">
        <div class="weeklyform">
            <h1>Weekly Food Intake</h1>
        </div>
            <form action="" method="">
                
                    <table id="foodintake">
                        <tr>
                          <th>Date</th>
                          <th>Total Expenses</th>
                          <th>Calories Intake (kcal)</th>
                        </tr>
                        <tr>
                            <td>date-date</td>
                            <td>400 CP (RM 40.00)</td>
                            <td>9100</td>
                        </tr>
                        <tr>
                            <td>date-date</td>
                            <td>920 CP (RM 92.00)</td>
                            <td>10100</td>
                        </tr>
                        
                      </table>
            </form>
    </div>
        
    </body>
    
</html>