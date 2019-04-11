<jsp:useBean id="student" scope="session" class="Model.Student" />
<%@page import="Model.Food, java.util.*" %>
<%@page import="Model.Meal, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>
<% List<Meal> mealList = (List<Meal>) session.getAttribute("mealList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">      
        <link rel="stylesheet" href="BreakfastLunch.css">  
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
        <style>
            .container {
            position: relative;
            display: inline-block;
            border-bottom: 1px dotted black;
          }

          .container .tooltiptext {
            visibility: hidden;
            width: 80%;
            height:200px;
            background-color: black;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 10px;

            /* Position the tooltip */
            position: absolute;
            z-index: 1;
            bottom:50%;
          }

          .container:hover .tooltiptext {
            visibility: visible;
            background-color:rgba(0,0,0,0.5);
          }
          
          #orderbtn:hover{
          background-color: white;
          border: none;
          color: black;
          text-align: center;
          transition: 0.3s;
        }

          #orderbtn{
          background-color: black;
          border: none;
          color: white;
          text-align: center;
          font-size: 12px;
          transition: 0.3s;
          padding:10px 10px;
          width:230px;
        }
        </style>
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
        <div class="title">
            <h1>Breakfast</h1>
        </div>
        <%
            for(int i=0 ; i<mealList.size() ; i++){
                Meal meal = mealList.get(i);
                if(meal.getMealcategory().equals("breakfast")){
        %>
        <div class="foodList">
                <div class="container">
                    <div class="images">
                        <img src="../Images/545451.jpg"id="image">
                    </div>
                    <div class="foodName">
                        <h4><%= meal.getMealname()%></h4>
                    </div>
                    <div class="foodPrice">
                        <%= meal.getMealprice()%>
                    </div>
                    <div class="btnclass">
                        <form action ="OrderMeal?mealid=<%= meal.getMealid()%>" method="POST">
                            <input type="date" id="startdatebtn">
                            <input type="date" id="enddatebtn">
                            <input type="submit" id="orderbtn" value="Order">
                        </form>
                    </div>
                        <span class="tooltiptext"><%= meal.getMealdesc()%></span>
                    
                </div>
        </div>
        <%}}%>
    </div>
    
    <footer>
        <div class="bottom">
            
        </div>
    </footer>
    
</body>
</html>