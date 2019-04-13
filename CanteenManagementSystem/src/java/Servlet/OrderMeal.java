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
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import java.util.Date;


@WebServlet(name = "OrderMeal", urlPatterns = {"/OrderMeal"})
public class OrderMeal extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            Query mealquery = em.createNamedQuery("Meal.findAll");
            List<Meal> mealList = mealquery.getResultList();
            
            
            String orderStartDate = request.getParameter("startdate");
            String orderEndDate = request.getParameter("enddate");
            String mealid = request.getParameter("mealid");
            String studid = request.getParameter("studid");
            
            Student stud = em.find(Student.class,studid);
            Meal meal = em.find(Meal.class,mealid);
            
            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(orderStartDate);  
            Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(orderEndDate);

            int days = (int)(endDate.getTime() - startDate.getTime())/(1000*60*60*24);
            
            
            Order1 order = new Order1();
            order.setOrderid("ORD001");
            order.setOrderdate(startDate);
            order.setCouponcode("1");
            order.setOrderstatus("Ordered");
            order.setStudentStudid(stud);
            
            OrderMeal o = new OrderMeal();
            
            /*try (PrintWriter out = response.getWriter()) {
                out.println("<h1>Start Date :  " + startDate + "   End Date : " + endDate + "  Days:" + meal.getMealname() + "</h1>");
            }*/
            
            
            
            
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
