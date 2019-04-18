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


@WebServlet(name = "ClaimOrder", urlPatterns = {"/ClaimOrder"})
public class ClaimOrder extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String couponCode = request.getParameter("couponcode");
            
            Query orderquery = em.createNamedQuery("Orders.findAll");
            List<Orders> orderList = orderquery.getResultList();
            boolean claimCoupon = false;
            boolean couponClaimed = false;
            boolean couponNotFound = false;
            
            String mealname = "" ;
            
            for(int i=0 ; i<orderList.size() ; i++){
                Orders orders = orderList.get(i);
                if(orders.getCouponcode().equals(couponCode) && orders.getOrderstatus().equals("Paid")){
                    orders.setOrderstatus("Claimed");
                    utx.begin();
                    em.merge(orders);
                    utx.commit();
                    mealname = orders.getOrderMealList().get(0).getMealMealid().getMealname();
                    claimCoupon = true;
                }
                else if(orders.getCouponcode().equals(couponCode) && orders.getOrderstatus().equals("Claimed")){
                    couponClaimed = true;
                }
                else{
                    couponNotFound = true;
                }
            }
            
            if(claimCoupon == false){
                if(couponClaimed == true)
                    response.sendRedirect("Staff/StaffHome.jsp?status=claimed");
                if(couponNotFound = true)
                    response.sendRedirect("Staff/StaffHome.jsp?status=notexist");
            }
            
            
            
            HttpSession session = request.getSession();
            orderquery = em.createNamedQuery("Orders.findAll");
            orderList = orderquery.getResultList();
            session.setAttribute("orderList", orderList);
            response.sendRedirect("Staff/StaffHome.jsp?status=claimsuccessful&mealname=" + mealname);
            
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
