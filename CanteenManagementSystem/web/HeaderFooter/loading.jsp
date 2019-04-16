<%-- 
    Document   : loading
    Created on : Apr 4, 2019, 6:26:37 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
        
        <title>Loading</title>
        <style>
            .no-js #loader { display: none;  }
           .js #loader { display: block; position: absolute; left: 100px; top: 0; }
           .se-pre-con {
                   position: fixed;
                   left: 0px;
                   top: 0px;
                   width: 100%;
                   height: 100%;
                   z-index: 9999;
                   background: url(../Images/30.gif) center no-repeat #fff;
           }

           .se-pre-con h1{
               text-align:center;
               margin-top:270px;
               font-family:Helvetica;
           }
           
           #successdiv{
               text-align:center;
               margin-top:300px;
               font-family:Helvetica;
           }
        </style>
    </head>
    <body>
        <%
            String status = request.getParameter("status");
        %>
        
        <% if(status.equals("studentloggingin")){%>
        <div class="se-pre-con"><h1>Logging in ..</h1></div>
        
        <script>
            $(window).load(function() {
		$(".se-pre-con").delay(2000).fadeOut("slow");
                setTimeout(function(){window.location.href="../Student/StudentHome.jsp";},2500);
	});
        </script>
        <% }else if(status.equals("staffloggingin")){%>
        <div class="se-pre-con"><h1>Logging in ..</h1></div>
        
        <script>
            $(window).load(function() {
		$(".se-pre-con").delay(2000).fadeOut("slow");
                setTimeout(function(){window.location.href="../Staff/StaffHome.jsp";},2500);
	});
        </script>
        <% }else if(status.equals("managerloggingin")){%>
        <div class="se-pre-con"><h1>Logging in ..</h1></div>
        
        <script>
            $(window).load(function() {
		$(".se-pre-con").delay(2000).fadeOut("slow");
                setTimeout(function(){window.location.href="../Staff/MealSetList.jsp";},2500);
	});
        </script>
        <% }else if(status.equals("registering")){%>
            <div class="se-pre-con"><h1>Registering in ..</h1></div>

            <script>
                $(window).load(function() {
                    $(".se-pre-con").delay(2000).fadeOut("slow");
                    setTimeout(function(){document.getElementById("success").innerHTML = "Successfully Registered"},2500);
                    setTimeout(function(){window.location.href="../LoginRegister/Main.jsp";},3500);
            });
            </script>
        <%}else if(status.equals("loggingout")){%>
            <div class="se-pre-con"><h1>Logging Out</h1></div>

            <script>
                $(window).load(function() {
                    $(".se-pre-con").delay(2000).fadeOut("slow");
                    setTimeout(function(){window.location.href="../LoginRegister/Main.jsp";},3500);
            });
            </script>
        <%}%>
        <div id="successdiv"><h1 id="success"></h1></div>
    </body>
</html>
