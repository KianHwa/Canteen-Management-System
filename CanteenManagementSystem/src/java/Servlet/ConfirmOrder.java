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


@WebServlet(name = "ConfirmOrder", urlPatterns = {"/ConfirmOrder"})
public class ConfirmOrder extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String studentID = request.getParameter("studid");
            int total = Integer.parseInt(request.getParameter("total"));
            
            Query orderquery = em.createNamedQuery("Orders.findAll");
            List<Orders> orderList = orderquery.getResultList();
            Student student = em.find(Student.class, studentID);
            
            utx.begin();
            for(int i=0 ; i<orderList.size() ; i++){
                Orders orders = orderList.get(i);
                if(orders.getStudentStudid().getStudid().equals(studentID) && orders.getOrderstatus().equals("Ordered")){
                    orders.setOrderstatus("Paid");
                    em.merge(orders);
                }
            }
            student.removeCreditPoints(total);
            response.sendRedirect("Student/StudentHome.jsp");
            
            
            em.merge(student);
            utx.commit();
            
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
