<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="TopUp.css">
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
                    <li><a href="TopUp.jsp">Top Up</a></li>
                    <li><a href="">Ingredients</a></li>
                    <li><a href="MealSet.jsp">Meal Set List</a></li>
                    <li><a href="StaffHome.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </header>
    
    <div class="content">
        <div class="topuptitle">
            <h1>Student Credit Points Top Up</h1>
        </div>
        <form class="topupform" action="" method="">
            <div class="row">
                <div class="col-25">
                    <label for="studentid">Student ID</label>
                </div>
                <div class="col-75">
                   <input type="text" placeholder="Enter student ID .." id="studentid" required>
                </div>
            </div>
            
            <div class="row">
                <div class="col-25">
                    <label for="topupamount">Amount (RM)</label>
                </div>
                <div class="col-75">
                    <input list="amount" name="topup" type="number" id="topupamount" placeholder="Select/Enter amount to top up .." required>
                        <datalist id="amount">
                            <option value="5">
                            <option value="10">
                            <option value="20">
                            <option value="50">
                            <option value="100">
                        </datalist>
                </div>
            </div>
            
            <div class="row">
                <input type="submit" value="Top Up" class="topupbtn">
            </div>
            
            
        </form> 
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>