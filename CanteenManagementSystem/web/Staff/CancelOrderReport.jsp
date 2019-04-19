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
        <title>Meal Cancellation Report</title>
        <style>
            <%@ include file="Report.css"%>
        </style>
    </head>
    <body>
        
        <%
            String todaysdate = request.getParameter("generatedate");
        %> 
        <table id="reports">
            <tr>
                <td colspan="5">
                    <img src="Images/OVERCOOKLOGO.png">
                    <h1 style="align:center;padding:50px;text-align:center">Meal Cancellation Report</h1>
                    <h4 style="text-align:center;text-align:left;padding-left:20px;">Generated on : <%= todaysdate%></h4>
                </td>
            </tr>
            <tr>
                <th style="text-align:center">Order ID</th>
                <th style="text-align:center">Student ID</th>
                <th style="text-align:center">Student Name</th>
                <th style="text-align:center">Refund (RM)</th>
            </tr>
        ${output}
            <tr>
                <td colspan="5" style="background:#f2f2f2;margin-top:100px;text-align:left;">
                    <br/><br/><br/><br/>    Verified By:<br/><br/>
                    
                    _______________________
                   
                </td>
            </tr>
            
        </table>
        

    </body>
</html>
