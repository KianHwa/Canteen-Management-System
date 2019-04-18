package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Model.*;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import java.util.Date;


@WebServlet(name = "QueryTesting", urlPatterns = {"/QueryTesting"})
public class QueryTesting extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CanteenDB";
    private String user = "nbuser";
    private String pass = "nbuser";

    private Connection conn;
    private PreparedStatement stmt;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        System.out.println("test");
        try {
            String date = request.getParameter("year");
            conn = DriverManager.getConnection(host,user,pass);
            
                ResultSet rs = stmt.executeQuery();
                stmt = conn.prepareStatement("");
                stmt.setString(1,date);
            
                String outputMonthly = "";
                
                while (rs.next()) {
                    outputMonthly += "<table><tr>"
                            + "<td>" + rs.getString(1) + "</td>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "<td>" + rs.getString(4) + "</td>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "</tr></table>";
                }

                
                
                try (PrintWriter out = response.getWriter()) {
                    out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
                }
                request.setAttribute("output",outputMonthly);
                request.getRequestDispatcher("Staff/ReportTesting.jsp").forward(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
    }
}