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


@WebServlet(name = "AddMealSet", urlPatterns = {"/AddMealSet"})
public class AddMealSet extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String mealSetName = request.getParameter("mealname");
            int mealSetPrice = Integer.parseInt(request.getParameter("mealprice"));
            String category = request.getParameter("meal");
            String mealSetDesc = request.getParameter("mealdesc");
            String mealID = "MD001";
            
            HttpSession session = request.getSession();
            List<Food> foodList = (List<Food>) session.getAttribute("foodList");
            
            List<Food> selectedFood = new ArrayList<Food>();
            for (int i = 0; i < foodList.size(); ++i) {
                if (request.getParameter("foodArr[" + i + "]")!=null) {  
                    selectedFood.add(foodList.get(i));
                }
            }
            
            
            utx.begin();
            Meal meal = new Meal(mealID, mealSetName, mealSetPrice, mealSetDesc, category, selectedFood);
            em.persist(meal);
            utx.commit();
            response.sendRedirect("Staff/AddMeal.jsp?success=true&meal=" + mealSetName + "");
            
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
