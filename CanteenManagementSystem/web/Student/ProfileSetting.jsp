<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">
        <link rel="stylesheet" href="ProfileSetting.css">
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
    
    <div class="content">
        <div class="uppernote">

            <p style="text-align: right; font-size: 20">Students are only allowed to change their email address, 
                phone number, and login password. To change other options, students are required to 
                seek for school admin help and permission.</p>
        </div>
        
        <div class="profile">
            <form action=""method="">
                <fieldset> <br/>
                    Full Name: <input type="text" name="fullname" disabled><br>
                    
                    Student ID: <input type="text" name="studID" disabled><br>
                    
                    Identity Card No.: <input type="text" name="icno" disabled><br>
                    
                    <label for="email" name="email" >Email</label>
                    <input type="text" id="email" name="email"><br/>
                    
                    Username: <input type="text" name="uname" disabled><br>

                    <label for="pwd" name="pwd" >Password</label>
                    <input type="text" id="pwd" name="pwd"><br/>

                    <label for="hpno" name="hpno" >Phone Number</label>
                    <input type="text" id="hpno" name="phone" title="Ten digits code">
                </fieldset> 
            </form>
            
            <input type="submit"value="Save Changes"id="savebtn" >
            <a href=""><button id="cancelbtn">Cancel</button></a>
        </div>
        
        <div class="w3-bar">
            <a href=""><button class="w3-button w3-left" id="historybtn">History</button></a><br/>
            <a href=""><button class="w3-button w3-left" id="calintakes">Calories Intake</button></a>
        </div>
    </div>
    
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>
