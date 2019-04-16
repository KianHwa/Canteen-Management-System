<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">      
        <link rel="stylesheet" href="ThankYou.css">  
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
    
    <div id="myModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">&times;</span>
                    <h1>Meal Coupon</h1>
                </div>
                <div class="modal-body">
                    <form action="" method="">
                    <table id="meals">
                        <tr>
                          <th>No</th>
                          <th>Date</th>
                          <th>Meal Description</th>
                          <th>Meal ID</th>
                          <th>Coupon Code</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Testing</td>
                            <td>Testing</td>
                            <td>Testing</td>
                            <td>Testing</td>
                        </tr>
                      </table>
            <input type="submit" value="Print" id="printbtn">
        </form>
                </div>
                <div class="modal-footer">
                    <h3>Modal Footer</h3>
                </div>
            </div>
          </div>
    
    <div class="content">
        <div class="thankyou">
            <h1 style="text-align: center">Thank You !</h1>
            <p style="text-align: center; font-size: 20">You had successfully paid your meal order !</p>
            <br/><br/><br/>
            <p style="text-align: center; font-size: 20">Please print your digital meal coupon <br/> from the 'Coupon' section 
            to redeem your meal on redeeming day</p>
            <br/><br/>
            <h2 style="text-align: center">Have A Nice Day</h2>
        </div>
    </div>
    <a href="StudentHome.jsp"><button class="homebtn">Back To Home</button></a>
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>