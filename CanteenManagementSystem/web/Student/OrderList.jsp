<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">   
        <link rel="stylesheet" href="StudentHome.css">
        <link rel="stylesheet" href="OrderList.css">
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
        <div class="orderlisttitle">
            <h1>Current orders</h1>
        </div>
        <form action="" method="">
                    <table id="orders">
                        <tr>
                          <th>No</th>
                          <th>Meal Set</th>
                          <th>Order Date</th>
                          <th></th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Testing</td>
                            <td>Testing</td>
                            <td><input type="submit" value="Remove" id="removebtn"></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <input type="submit" value="Remove all" id="removeallbtn">
                                <input type="submit" value="Place Order" id="placeorderbtn">
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
