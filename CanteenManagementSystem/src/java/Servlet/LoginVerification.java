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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

@WebServlet(name = "LoginVerification", urlPatterns = {"/LoginVerification"})
public class LoginVerification extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String loginID = request.getParameter("userid");
            String password = request.getParameter("password");
            
            if(loginID.indexOf("STD") >=0){
                Query query = em.createNamedQuery("Student.findAll");
                List<Student> studentList = query.getResultList();

                for(int i=0 ; i<studentList.size() ; i++){
                    Student stud = studentList.get(i);
                    if(stud.getStudid().equals(loginID) && stud.getStudpassword().equals(password)){
                        Student std = em.find(Student.class ,loginID);
                        HttpSession session = request.getSession();
                        session.setAttribute("student",std);
                        
                        Query foodquery = em.createNamedQuery("Food.findAll");
                        Query mealquery = em.createNamedQuery("Meal.findAll");
                        Query orderquery = em.createNamedQuery("Orders.findAll");
                        
                        List<Meal> mealList = mealquery.getResultList();
                        session.setAttribute("mealList", mealList);
                        List<Food> foodList = foodquery.getResultList();
                        session.setAttribute("foodList", foodList);
                        List<Orders> orderList = orderquery.getResultList();
                        session.setAttribute("orderList", orderList);
                        
                        response.sendRedirect("HeaderFooter/loading.jsp?status=studentloggingin");
                    }  
                    
                }
                response.sendRedirect("LoginRegister/Login.jsp?status=loginfailed");
            }
            else if(loginID.indexOf("STF") >=0){
                Query query = em.createNamedQuery("Staff.findAll");
                List<Staff> staffList = query.getResultList();

                for(int i=0 ; i<staffList.size() ; i++){
                    Staff staff = staffList.get(i);
                    if(staff.getStaffid().equals(loginID) && staff.getStaffpassword().equals(password)){
                        Staff stf = em.find(Staff.class ,loginID);
                        HttpSession session = request.getSession();
                        session.setAttribute("staff",stf);
                        
                        Query foodquery = em.createNamedQuery("Food.findAll");
                        Query mealquery = em.createNamedQuery("Meal.findAll");
                        Query orderquery = em.createNamedQuery("Orders.findAll");
                        
                        List<Meal> mealList = mealquery.getResultList();
                        session.setAttribute("mealList", mealList);
                        List<Food> foodList = foodquery.getResultList();
                        session.setAttribute("foodList", foodList);
                        List<Orders> orderList = orderquery.getResultList();
                        session.setAttribute("orderList", orderList);
                        
                        response.sendRedirect("HeaderFooter/loading.jsp?status=staffloggingin");
                    }      
                }
                response.sendRedirect("LoginRegister/Login.jsp?status=loginfailed");
            }
            else if(loginID.indexOf("MNR") >=0){
                Query staffquery = em.createNamedQuery("Staff.findAll");
                List<Staff> staffList = staffquery.getResultList();

                for(int i=0 ; i<staffList.size() ; i++){
                    Staff staff = staffList.get(i);
                    if(staff.getStaffid().equals(loginID) && staff.getStaffpassword().equals(password)){
                        Staff stf = em.find(Staff.class ,loginID);
                        HttpSession session = request.getSession();
                        session.setAttribute("staff",stf);
                        
                        Query foodquery = em.createNamedQuery("Food.findAll");
                        Query mealquery = em.createNamedQuery("Meal.findAll");
                        Query mealfoodquery = em.createNamedQuery("MealFood.findAll");
                        
                        List<Meal> mealList = mealquery.getResultList();
                        session.setAttribute("mealList", mealList);
                        List<Food> foodList = foodquery.getResultList();
                        session.setAttribute("foodList", foodList);
                        List<MealFood> mealFoodList = mealfoodquery.getResultList();
                        session.setAttribute("mealFoodList", mealFoodList);
                        
                        response.sendRedirect("HeaderFooter/loading.jsp?status=managerloggingin");
                    }      
                }
                response.sendRedirect("LoginRegister/Login.jsp?status=loginfailed");
            }
            else{
                response.sendRedirect("LoginRegister/Login.jsp?status=loginfailed");
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
