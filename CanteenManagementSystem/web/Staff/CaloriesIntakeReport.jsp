<%-- 
    Document   : ReportTesting
    Created on : Apr 18, 2019, 10:44:59 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calories Intake Report</title>
        <style>
            <%@ include file="Report.css"%>
        </style>
    </head>
    <body>
        <%
        String found = request.getParameter("found");
        %>
    
    <%if(found!=null){
           if(found.equals("error")){%>
            <h1 style="text-align:center;padding:50px;">Student Not Found</h1>
       <%}else if(found.equals("true")){%>
        <%
            String year = request.getParameter("year");
            String todaysdate = request.getParameter("generatedate");
            String studentName = request.getParameter("studname");
        %> 
        <table id="reports">
            <tr>
                <td colspan="3">
                    <img src="Images/OVERCOOKLOGO.png">
                    <h1 style="align:center;padding:50px;text-align:center">Total Calories Intake of Student of <%= year%></h1>
                    <h4 style="text-align:center;text-align:left;padding-left:20px;">Generated on : <%= todaysdate%></h4>
                    <h4 style="text-align:center;text-align:left;padding-left:20px;">Student: <%= studentName%></h4>
                </td>
            </tr>
            <tr>
                <th style="text-align:center">Meal Set</th>
                <th style="text-align:center">Order ID</th>
                <th style="text-align:center">Calories (cal)</th>
            </tr>
        ${output}
            <tr>
                <td colspan="3" style="background:#f2f2f2;margin-top:100px;text-align:left;">
                    <br/><br/><br/><br/>    Verified By:<br/><br/>
                    
                    _______________________
                   
                </td>
            </tr>
            
        </table>        
<%}}%>
    </body>
</html>
