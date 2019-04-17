<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css"> 
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
    </head>
    <style>
        div.aboutus {
            line-height: 1.8;
              font: italic bold 18px/30px Georgia serif;

        }
    </style>
    
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
                    <li><a href="../LogOut">Log out</a></li>
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
        <div class="aboutus">
            <br/><br/>
            <h1 style="text-align: center">About Us</h1>
            <br/>
            <p style="text-align: center; font-size: 20">The OVERCOOK Corporation was founded in the early 1990, with only a 
                building located in Sabah.<br/>The corporation began its cooperation with the Kian Kok Middle School canteen
                management since the beginning of 2019, with the intention to improve the middle school canteen business flows 
                in a computerized environment. With the cooperation made, it is hope to provide the student with its best food 
                purchasing service ever. OVERCOOK Corporation Canteen Management System also aims to provide additional functions
                such as menu modification function in conjuction to its development to further support the canteen management.
            </p>
            <br/><br/>
        </div>
    </div>
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
    
    <footer>
        <div class="bottom">
            <p style="text-align: center; font-size: 20"><a href="AboutUs.jsp">About Us</a></p>
        </div>
    </footer>
    
</html>
