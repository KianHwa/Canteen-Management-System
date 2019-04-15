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
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import javax.validation.ConstraintViolationException;


@WebServlet(name = "AddCredits", urlPatterns = {"/AddCredits"})
public class AddCredits extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String studid = request.getParameter("studid");
            String amount = request.getParameter("topup");
            
            HttpSession session  = request.getSession();
            Student stud = em.find(Student.class, studid);
            
            stud.setStudid(studid);
            stud.addCreditPoints(Integer.parseInt(amount) * 10);
            
            utx.begin();
            em.merge(stud);
            utx.commit();
                    
            response.sendRedirect("Staff/TopUp.jsp");
            
        }
        catch(ConstraintViolationException ex){
            System.out.println("CONSTRAINT : " + ex.getConstraintViolations());
        }
        catch(Exception ex){
            System.out.println("EXCEPTION  : " + ex.getMessage());
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
