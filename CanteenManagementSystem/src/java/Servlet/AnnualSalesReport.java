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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import java.util.Date;
import util.Util;


@WebServlet(name = "AnnualSalesReport", urlPatterns = {"/AnnualSalesReport"})
public class AnnualSalesReport extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CanteenDB";
    private String user = "nbuser";
    private String pass = "nbuser";

    private Connection conn;
    private PreparedStatement stmt;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String year = request.getParameter("year");
             String outputYearly = "";
             
            //Calendar
            Calendar firstday = Calendar.getInstance();
            Calendar lastday = Calendar.getInstance();
            
            firstday.set(Calendar.MONTH,1);
            firstday.set(Calendar.DAY_OF_MONTH,1);
            firstday.set(Calendar.YEAR,Integer.parseInt(year));
            lastday.set(Calendar.MONTH, 12);
            lastday.set(Calendar.DAY_OF_MONTH, 31);
            lastday.set(Calendar.YEAR, Integer.parseInt(year));
            
            conn = DriverManager.getConnection(host,user,pass);
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime now = LocalDateTime.now();  
            
                Date todaysDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dtf.format(now));
               
                
                for(int i=0 ; i<12 ; i++){
                stmt = conn.prepareStatement("select count(o.orderid), sum(m.mealprice) from Orders o, order_meal om, meal m where o.orderID = om.order_orderID and om.meal_mealid = m.mealID and MONTH(o.orderDate) = ? and YEAR(o.orderDate) = ? and (o.orderStatus = 'Claimed' or o.orderStatus = 'Paid')");
                stmt.setInt(1,i+1);
                stmt.setString(2,year);
                ResultSet rs = stmt.executeQuery();
                
                ArrayList<String> month = new ArrayList<String>();
                month.add("January");
                month.add("February");
                month.add("March");
                month.add("April");
                month.add("May");
                month.add("June");
                month.add("July");
                month.add("August");
                month.add("September");
                month.add("October");
                month.add("November");
                month.add("December");

                while (rs.next()) {
                    outputYearly += "<tr>"
                            + "<td>" + month.get(i) + "</td>"
                            + "<td>" + rs.getInt(1) + "</td>"
                            + "<td>" + rs.getInt(2) + "</td>"
                            + "</tr>";
                }
                }
                
                stmt = conn.prepareStatement("select count(m.mealid), sum(m.mealprice) from Orders o, order_meal om, meal m where o.orderID = om.order_orderID and om.meal_mealid = m.mealID and (o.orderStatus = 'Claimed' or o.orderStatus = 'Paid') and o.orderdate between ? and ?");
                stmt.setDate(1, Util.getSQLDate(Util.calToDate(firstday)));
                stmt.setDate(2, Util.getSQLDate(Util.calToDate(lastday)));   
                ResultSet rs1 = stmt.executeQuery();
                
                while(rs1.next()){
                    outputYearly += "<tr>"
                            + "<td>" + "Total" + "</td>"
                            + "<td style=\"font-weight:bold\">" + rs1.getInt(1) + "</td>"
                            + "<td style=\"font-weight:bold\">" + rs1.getInt(2) + "</td>"
                            + "</tr>";
                }
                
                request.setAttribute("output",outputYearly);
                request.getRequestDispatcher("Staff/AnnualSalesReport.jsp?year=" + year + "&generatedate=" + todaysDate).forward(request, response);        
                    
        }
        catch(Exception ex){
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
