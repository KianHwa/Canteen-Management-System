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


@WebServlet(name = "EditStudentProfile", urlPatterns = {"/EditStudentProfile"})
public class EditStudentProfile extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String studid = request.getParameter("studid");
            String email = request.getParameter("email");
            String oldpwd = request.getParameter("oldpwd");
            String newpwd = request.getParameter("newpwd");
            String phone = request.getParameter("phone");
            
            Student student = em.find(Student.class,studid);
            
            if(student.getStudpassword().equals(oldpwd)){
                student.setStudemail(email);
                student.setStudphone(phone);
                student.setStudpassword(newpwd);
                
                utx.begin();
                em.merge(student);
                utx.commit();
                
                HttpSession session = request.getSession();
                Query studentquery = em.createNamedQuery("Student.findAll");
                List<Student> studentList = studentquery.getResultList();
                session.setAttribute("studentList", studentList);
                
                response.sendRedirect("Student/ProfileSetting.jsp?status=success");
                
            }
            else{
                response.sendRedirect("Student/ProfileSetting.jsp?status=error");
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
