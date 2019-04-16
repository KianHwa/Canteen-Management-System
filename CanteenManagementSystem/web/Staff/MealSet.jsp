<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="staff" scope="session" class="Model.Staff" />
<%@page import="Model.Meal, java.util.*" %>
<%@page import="Model.Orders, java.util.*" %>
<% List<Meal> mealList = (List<Meal>) session.getAttribute("mealList");%>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>

<html>
    <head>  
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="../HeaderFooter/HeaderAndFooter.css">    
        <link rel="stylesheet" href="MealSet.css">
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
                    <p><%= staff.getStaffname()%></p>
                </div>
            </div>
            
            <div class="navBar">
                <ul>
                    <li><a href="../LoginRegister/Main.jsp">Log out</a></li>
                    <li><a href="TopUp.jsp">Top Up</a></li>
                    <li><a href="Ingredients.jsp">Ingredients</a></li>
                    <li><a href="MealSet.jsp">Meal Set List</a></li>
                    <li><a href="StaffHome.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </header>
    
    <div class="content">
        <div class="mealsetlisttitle">
            <h1>Meal Sets List</h1>
        </div>
            <form action="../CheckMeal" method="POST">
                <input type="date" id="mealsetlistdate" name="checkmeal">
                <input type="submit" value="Check" id="mealsetlistbtn">
                    <table id="mealsetlist">
                        <tr>
                          <th>Meal Sets</th>
                          <th>Meal</th>
                          <th>Quantity</th>
                        </tr>
                        <%
                            String checkdate = request.getParameter("checkmealdate");
                            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            
                            for(int j=0 ; j<mealList.size() ; j++){
                                int count=0;
                                Meal meal = mealList.get(j);
                                    for(int i=0 ;  i<orderList.size() ; i++){
                                        Orders orders = orderList.get(i);
                                        
                                        if(orders.getOrderstatus().equals("Paid")){
                                        if(meal.getMealid().equals(orders.getOrderMealList().get(0).getMealMealid().getMealid())){
                                            if(checkdate!=null){
                                                if(checkdate.equals(df.format(orders.getOrderdate()))){
                                                    count++;
                                                }
                                            }    
                                        }  
                                        }
                                    }     
                        %>
                        <tr>
                            <td><%= meal.getMealname()%></td>
                            <td><%= meal.getMealcategory()%></td>
                            <td><%= count%></td>
                        </tr>
                        <%}%>
                      </table>
            </form>
    </div>
    
    <footer>
        <div class="bottom">
        
        </div>
    </footer>
    
</body>
</html>