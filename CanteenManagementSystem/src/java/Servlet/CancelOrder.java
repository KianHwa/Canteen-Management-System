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


@WebServlet(name = "CancelOrder", urlPatterns = {"/CancelOrder"})
public class CancelOrder extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String orderID = request.getParameter("orderid");
            String refund = request.getParameter("mealprice");
            String studentID = request.getParameter("studid");
            
            Orders orders = em.find(Orders.class,orderID);
            Student student = em.find(Student.class, studentID);
            
            utx.begin();
            orders.setOrderstatus("Canceled");
            student.addCreditPoints(Integer.parseInt(refund) * 10);
            
            em.merge(orders);
            em.merge(student);
            utx.commit();
            
            
            HttpSession session = request.getSession();
            Query orderquery = em.createNamedQuery("Orders.findAll");
            List<Orders> orderList = orderquery.getResultList();
            session.setAttribute("orderList", orderList);
            
            Student std = em.find(Student.class ,studentID);
            session = request.getSession();
            session.setAttribute("student",std);
            
            response.sendRedirect("Student/StudentHome.jsp?status=ordercanceled&mealname=" + orders.getOrderMealList().get(0).getMealMealid().getMealname() + "&refund=" + refund);
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
