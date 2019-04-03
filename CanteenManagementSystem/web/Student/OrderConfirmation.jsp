<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">   
        <link rel="stylesheet" href="OrderConfirmation.css">
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
        <form action="" method="">
                    <table id="orders">
                        <tr>
                            <td colspan="5" id="orderconfirmationtitle"><h1>Order Confirmation</h1></td>
                        </tr>
                        <tr>
                          <th>No</th>
                          <th>Meal Set</th>
                          <th>From</th>
                          <th>To</th>
                          <th>Credit Points</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Testing</td>
                            <td>Testing</td>
                            <td>Testing</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <input type="submit" value="Back" id="backbtn">
                                <input type="submit" value="Purchase" id="purchasebtn">
                            </td>
                        </tr>
                      </table>
        </form>
    </div>  
    <script src="../HeaderFooter/OrderModal.js"></script>
    
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>