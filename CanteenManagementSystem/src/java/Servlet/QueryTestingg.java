/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import static com.sun.faces.config.WebConfiguration.DisableUnicodeEscaping.Auto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Util;

/**
 *
 * @author USER
 */
@WebServlet(name = "QueryTestingg", urlPatterns = {"/QueryTestingg"})
public class QueryTestingg extends HttpServlet {

    private String host = "jdbc:derby://localhost:1527/CanteenDB";
    private String user = "nbuser";
    private String pass = "nbuser";

    private Connection conn;
    private PreparedStatement stmt;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String year = request.getParameter("year");
            
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
                
                
                stmt = conn.prepareStatement("select count(m.mealid), sum(m.mealprice) from Orders o, order_meal om, meal m where o.orderID = om.order_orderID and om.meal_mealid = m.mealID and o.orderStatus = 'Claimed' or o.orderStatus = 'Paid' and o.orderdate between ? and ?");
                stmt.setDate(1, Util.getSQLDate(Util.calToDate(firstday)));
                stmt.setDate(2, Util.getSQLDate(Util.calToDate(lastday)));   
                ResultSet rs = stmt.executeQuery();
                
                String outputYearly = "";
                /*<tr>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                      </table>
                */
                while (rs.next()) {
                    outputYearly += "<tr>"
                            + "<td>" + rs.getString(1) + "</td>"
                            + "<td>" + rs.getString(2) + "</td>"
                            + "</tr>";
                }
                
          
                
                request.setAttribute("output",outputYearly);
                request.getRequestDispatcher("Staff/AnnualSalesReport.jsp").forward(request, response);
            } catch (Exception ex) {
                ex.printStackTrace();
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
