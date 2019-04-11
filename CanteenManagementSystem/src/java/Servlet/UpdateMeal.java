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


@WebServlet(name = "UpdateMeal", urlPatterns = {"/UpdateMeal"})
public class UpdateMeal extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String updatedMealname = request.getParameter("mealname");
            String updatedMealprice = request.getParameter("mealprice");
            String updatedMealcategory = request.getParameter("category");
            String updatedMealdesc = request.getParameter("mealdesc");
            String mealid = request.getParameter("mealid");
            //String mealFoodID = "";
            
            //Query foodquery = em.createNamedQuery("Food.findAll");
            //List<Food> foodList = foodquery.getResultList();
            Query mealquery = em.createNamedQuery("Meal.findAll");
            List<Meal> mealList = mealquery.getResultList();
            //Query mealfoodquery = em.createNamedQuery("MealFood.findAll");
            //List<MealFood> mealFoodList = mealfoodquery.getResultList();
            
            
            
            utx.begin();
            Meal meal = new Meal();  
            meal.setMealid(mealid);
            meal.setMealprice(Integer.parseInt(updatedMealprice));
            meal.setMealcategory(updatedMealcategory);
            meal.setMealdesc(updatedMealdesc);
            meal.setMealname(updatedMealname);
            meal.setMealimage("aa");
            em.merge(meal);
            utx.commit();
            
            HttpSession session = request.getSession();
            mealquery = em.createNamedQuery("Meal.findAll");
            mealList = mealquery.getResultList();
            session.setAttribute("mealList", mealList);
            
            response.sendRedirect("Staff/MealSetList.jsp");
            
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
