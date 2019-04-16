<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="TranscHistory.css">
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
                    <p>Student's Name</p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../LoginRegister/Main.jsp">Log out</a></li>
                    <li><button id="couponbtn">Coupon</button></li>
                    <div class="dropdown">
                        <button class="creditPoints"><a href="">Credit Points</a></button>
                        <div class="dropdownContent">
                            <a href="">Balance:</a>
                        </div>
                    </div>  
                    <li><a href="OrderList.jsp">Order</a></li>
                    <li><a href="StudentHome.jsp">Home</a></li>
                    
                </ul>
            </div>
        </div>
    </header>
        
    <div class="content">
        <div class="transchistory">
            <h1>Transaction History</h1>
        </div>
            <form action="" method="">
                
                    <table id="transaction">
                        <tr>
                          <th>No.</th>
                          <th>Date</th>
                          <th>Meal Set</th>
                          <th>Meal Category</th>
                          <th>Price</th>
                          <th>Credit Points</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>01/01/2019</td>
                            <td>Meal Set L1</td>
                            <td>Lunch</td>
                            <td>RM7.50</td>
                            <td>75 pts</td>
                        </tr>
                      </table>
            </form>
    </div>    
        
    </body>
</html>