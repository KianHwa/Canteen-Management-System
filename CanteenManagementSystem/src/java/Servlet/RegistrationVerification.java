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
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

@WebServlet(name = "RegistrationVerification", urlPatterns = {"/RegistrationVerification"})
public class RegistrationVerification extends HttpServlet {
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
            String ID = request.getParameter("userid");
            String password = request.getParameter("pwd");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phone");
            int creditPoints = 0;
            
            String verifyID = "";
            String verifyName = "";
            
            //Verify student ID from school database          
            conn = DriverManager.getConnection(host,user,pass);
            
            stmt = conn.prepareStatement("SELECT * FROM SchoolStudent WHERE studentid = ?");
            stmt.setString(1,ID);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next()){
                verifyID = rs.getString("studentID");
                verifyName = rs.getString("studentName");
            }
            
            //Register Verification
            
            
            Query query = em.createNamedQuery("Student.findAll");
            List<Student> studentList = query.getResultList();
            boolean existingStudent = false;
            
            for(int i=0 ; i<studentList.size() ; i++){
                //Check if student ID/Name is exist/already registered
                Student stud = studentList.get(i);
                if(stud.getStudid().equals(verifyID)){
                    response.sendRedirect("LoginRegister/Register.jsp?status=existed&studid=" + stud.getStudid() + "");
                    request.setAttribute("aa","ggg");
                }
            }
            
            if(existingStudent == false){
                    if(verifyID.equals("")){
                        response.sendRedirect("LoginRegister/Register.jsp?status=error");
                    }
                    else{
                        //If verified, store register information into Canteen's Student database
                        utx.begin();
                        Student student = new Student(verifyID, verifyName, email, phoneNumber, password, creditPoints);
                        em.persist(student);
                        utx.commit();
                        response.sendRedirect("LoginRegister/Main.jsp");
                    }
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
