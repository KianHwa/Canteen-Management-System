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


@WebServlet(name = "CaloriesIntakeReport", urlPatterns = {"/CaloriesIntakeReport"})
public class CaloriesIntakeReport extends HttpServlet {
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
            String studentID = request.getParameter("studid");
            
            Student student = em.find(Student.class,studentID);
            
            
            if(student!=null){ 
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

                
                stmt = conn.prepareStatement("select m.mealname, o.ORDERID, sum(f.FOODCALORIES) " +
                                             "from Orders o, Student s, Order_Meal om, Meal m, Meal_Food mf, Food f " +
                                             "where s.STUDID = o.STUDENT_STUDID and " +
                                             "o.ORDERID = om.ORDER_ORDERID and " +
                                             "om.MEAL_MEALID = m.MEALID and " +
                                             "m.MEALID = mf.MEAL_MEALID and " +
                                             "mf.FOOD_FOODID = f.FOODID and " +
                                           "o.ORDERID = om.ORDER_ORDERID and " +
                                             "om.MEAL_MEALID = m.MEALID and " +
                                             "m.MEALID = mf.MEAL_MEALID and " +
                                      "s.STUDID ='STD1001' and " +
                                             "(o.ORDERSTATUS ='Paid' or " +
                                             "o.ORDERSTATUS ='Claimed') and o.orderdate between ? and ? and s.studid = ? " +
                                             "group by m.mealname, o.orderID, f.FOODCALORIES");
                String outputCalories = "";
                stmt.setDate(1, Util.getSQLDate(Util.calToDate(firstday)));
                stmt.setDate(2, Util.getSQLDate(Util.calToDate(lastday))); 
                stmt.setString(3,studentID);
                ResultSet rs1 = stmt.executeQuery();
                
                while(rs1.next()){
                    
                    outputCalories += "<tr>"
                            + "<td>" + rs1.getString(1) + "</td>"
                            + "<td>" + rs1.getString(2) + "</td>"
                            + "<td>" + rs1.getString(3) + "</td>"
                            + "</tr>";
                }
                
                request.setAttribute("output",outputCalories);
                request.getRequestDispatcher("Staff/CaloriesIntakeReport.jsp?year=" + year + "&generatedate=" + todaysDate + "&studname=" + student.getStudname() + "&found=true").forward(request, response);   
            }
            else{
                response.sendRedirect("Staff/CaloriesIntakeReport.jsp?found=error");
            }
                    
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
