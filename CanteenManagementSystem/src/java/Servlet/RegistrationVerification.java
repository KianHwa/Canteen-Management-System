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
            
            
            String studVerifyID = "";
            String studVerifyName = "";
            String studVerifyIC ="";
            
            String staffVerifyID = "";
            String staffVerifyName = "";
            String staffVerifyIC ="";
            
            //Verify student ID from school database          
            conn = DriverManager.getConnection(host,user,pass);
            
            if(ID.indexOf("STD") >=0){
            stmt = conn.prepareStatement("SELECT * FROM SchoolStudent WHERE studentid = ?");
            stmt.setString(1,ID);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                studVerifyID = rs.getString("studentID");
                studVerifyName = rs.getString("studentName");
                studVerifyIC = rs.getString("studentIC");
            }
                //Register Verification
                Query query = em.createNamedQuery("Student.findAll");
                List<Student> studentList = query.getResultList();

                for(int i=0 ; i<studentList.size() ; i++){
                    //Check if student ID/Name is exist/already registered
                    Student stud = studentList.get(i);
                    if(stud.getStudid().equals(studVerifyID)){
                        response.sendRedirect("LoginRegister/SignUp.jsp?status=studexisted&studid=" + stud.getStudid() + "");
                    }
                }
                if(!studVerifyID.equals("")){
                            //If verified, store register information into Canteen's Student database
                            utx.begin();
                            Student student = new Student(studVerifyID, studVerifyName, email, phoneNumber, password, creditPoints, studVerifyIC);
                            em.persist(student);
                            utx.commit();
                            response.sendRedirect("HeaderFooter/loading.jsp?status=registering");
                }
                else{
                    response.sendRedirect("LoginRegister/SignUp.jsp?status=error");
                }
            }
            else if(ID.indexOf("STF") >=0){
                //Verify Staff ID from database
                stmt = conn.prepareStatement("SELECT * FROM CorpStaff WHERE staffsid = ?");
                stmt.setString(1,ID);
                ResultSet rs = stmt.executeQuery();
            
                if(rs.next()){
                    staffVerifyID = rs.getString("staffsID");
                    staffVerifyName = rs.getString("staffsName");
                    staffVerifyIC = rs.getString("staffsIC");
                }
                //Register Verification
                Query query = em.createNamedQuery("Staff.findAll");
                List<Staff> staffList = query.getResultList();

                for(int i=0 ; i<staffList.size() ; i++){
                    //Check if staff ID/Name is exist/already registered
                    Staff staff = staffList.get(i);
                    if(staff.getStaffid().equals(staffVerifyID)){
                        response.sendRedirect("LoginRegister/SignUp.jsp?status=staffexisted&staffid=" + staff.getStaffid() + "");
                    }
                }
                
                if(!staffVerifyID.equals("")){
                    utx.begin();
                    Staff staff = new Staff(staffVerifyID, staffVerifyName, email, phoneNumber, password, staffVerifyIC);
                    Staff manager = new Staff("MNR1", "Cardinal", "cardinal@gmail.com", "012 345 6789", "Cardinal1", "801010 12 5060");
                    staff.setStaffStaffid(manager);
                    em.persist(staff);
                    utx.commit();
                    response.sendRedirect("HeaderFooter/loading.jsp?status=registering");
                }
                else{
                    response.sendRedirect("LoginRegister/SignUp.jsp?status=error");
                }
            }
            else{
                response.sendRedirect("LoginRegister/SignUp.jsp?status=error"); //student not in school database
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
