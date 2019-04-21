<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Food, java.util.*" %>
<%@page import="Model.Meal, java.util.*" %>
<%@page import="Model.Orders, java.util.*" %>
<%@page import="Model.MealFood, java.util.*" %>
<% List<Food> foodList = (List<Food>) session.getAttribute("foodList");%>
<% List<Meal> mealList = (List<Meal>) session.getAttribute("mealList");%>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>
<% List<MealFood> mealFoodList = (List<MealFood>) session.getAttribute("mealFoodList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="Ingredients.css">
        <link rel="icon" href="../Images/chefhead.png">
        <script src="../HeaderFooter/HeaderAndFooter.js"></script>
    </head> 
    <title>Ingredients</title>
<body>
    <header>
        <div class="top"id="navbar">
            <div class="top1">
                <a href="StaffHome.jsp"><img src="../Images/OVERCOOKLOGO.png"style="height:120px;padding:14px 40px"></a>
            </div>
            <div class="top2">
                <a href="ProfileSetting.jsp">
                <div class="profilePic">
                </div>
                </a>
                <div class="staffhello">
                    <p>Staff Name</p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../LogOut">Log out</a></li>
                    <li><a href="TopUp.jsp">Top Up</a></li>
                    <li><a href="">Ingredients</a></li>
                    <li><a href="MealSet.jsp">Meal Set List</a></li>
                    <li><a href="StaffHome.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </header>
    
    <div class="content">
        <div class="ingredientsummary">
            <h1>Ingredients</h1>
        </div>
        
        <form action="../CheckIngredients" method="POST">
            <input type="date" id="date"  name="checkingingredients">
            <input type="submit" value="Check" id="checkbtn">
        </form>
            
            <table id="ingredients">
                
                
                <tr>
                    <th>No</th>
                    <th>Ingredients</th>
                    <th>Quantity</th>
                </tr>
                <%
                            String checkdate = request.getParameter("checkmealdate");
                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            int no = 1;
                            
                            for(int j=0 ; j<foodList.size() ; j++){
                                int foodcount = 0;
                                int count=0;
                                Food food = foodList.get(j);
                                    for(int i=0 ;  i<orderList.size() ; i++){ 
                                        Orders orders = orderList.get(i);
                                        
                                        if(orders.getOrderstatus().equals("Paid")){
                                            foodcount = orders.getOrderMealList().get(0).getMealMealid().getMealFoodList().size();
                                            for(int k=0 ; k<foodcount ; k++){
                                                if(food.getFoodid().equals(orders.getOrderMealList().get(0).getMealMealid().getMealFoodList().get(k).getFoodFoodid().getFoodid())){
                                                    if(checkdate!=null){
                                                        if(checkdate.equals(df.format(orders.getOrderdate())))
                                                            count++;
                                                    }
                                                }
                                            }
                                            
                                            
                                        }
                                    }     
                %>
                <tr>
                    <td><%= no%></td>
                    <td><%= food.getFoodname()%></td>
                    <td><%= count%></td>
                </tr>
                <%count++;no++;}%>
            </table>
        
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>