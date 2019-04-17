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
        </style>
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <title>Add Food</title>
    </head> 
<body>
    <%
        String success = request.getParameter("success");
        String foodName = request.getParameter("food");
        String existedFood = request.getParameter("existed");
    %>
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px">
            </div>
            <div class="top2">
                <div class="profilePic">
                    
                </div>
                <div class="hello">
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
       <%if(success!=null){
           if(success.equals("true")){%>
           <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Food "<%= foodName%>" successfully added</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
       <%}}%>
       
       <%if(existedFood!=null){
           if(existedFood.equals("true")){
       %>
            <div id="myModal" class="modal">
                <div class="modal-content">
                  <span class="close">&times;</span>
                  <p style="text-align:center">Food "<%= foodName%>" already existed</p>
                </div>
            </div>
            <script src="../HeaderFooter/PopOut.js"></script>
       <%}}%>
        
        <div class="addfoodtitle">
            <h1>Add Food Items</h1>
        </div>
      <form action="../AddFood" method="POST" class="addfood">
        <div class="row">
          <div class="col-25">
            <label for="foodname">Food Name</label>
          </div>
          <div class="col-75">
            <input type="text" id="lname" name="foodname" placeholder="Food Name.." required>
          </div>
        </div>
          
          <div class="row">
          <div class="col-25">
            <label for="calories">Calories</label>
          </div>
          <div class="col-75">
            <input type="text" id="lname" name="calories" placeholder="e.g. 1500">
          </div>
        </div>
          
        <div class="row">
          <input type="submit" value="Add Food" class="addfoodbtn">
        </div>
      </form>
          
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>