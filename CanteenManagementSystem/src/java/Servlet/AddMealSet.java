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
            HttpSession session = request.getSession();
            Query foodquery = em.createNamedQuery("Food.findAll");
            List<Food> foodList = foodquery.getResultList();
            Query mealquery = em.createNamedQuery("Meal.findAll");
            List<Meal> mealList = mealquery.getResultList();
            Query mealfoodquery = em.createNamedQuery("MealFood.findAll");
            List<MealFood> mealFoodList = mealfoodquery.getResultList();
            
            
            String mealSetName = request.getParameter("mealname");
            int mealSetPrice = Integer.parseInt(request.getParameter("mealprice"));
            String imagePath = request.getRealPath("mealimage");
            String category = request.getParameter("meal");
            String mealSetDesc = request.getParameter("mealdesc");
            String mealID = "";
            String mealFoodID = "";
            
            int mealFoodListSize = mealFoodList.size() ;
            
            if(mealList.size() == 0){
                    mealID = "ML" + String.format("%02d",mealList.size() + 1);
                }
                else{
                    mealID = "ML" + String.format("%02d",mealList.size() + 1); //02
                    boolean duplicateID;
                    int newID = 1;
                    
                    String newFormatMealnum = mealID.substring(2,4);  //02
                    
                    do{
                        duplicateID = false;
                        for(int i=0 ; i<mealList.size() ; i++){
                            Meal meeal = mealList.get(i);
                            String formatMealnum = meeal.getMealid().substring(2,4);  //02
                            
                    
                            
                            if(newFormatMealnum.equals(formatMealnum)){
                                duplicateID = true;
                                newFormatMealnum = String.format("%02d",newID);//01
                            }
                        }
                        ++newID;
                        if(duplicateID == false){
                            mealID = "ML" + newFormatMealnum;
                        }
                    }while(duplicateID == true);
                }
            
            Meal meal = new Meal();
            meal.setMealid(mealID);
            meal.setMealname(mealSetName);
            meal.setMealprice(mealSetPrice);
            meal.setMealcategory(category);
            meal.setMealdesc(mealSetDesc);
            meal.setMealimage("images");
            //int j=0;
            
            List<MealFood> selectedMealFood = new ArrayList<MealFood>();
            
            for (int i = 0; i < foodList.size(); ++i) {
                if (request.getParameter("foodArr[" + i + "]")!=null) {
                    //mealFoodID = "MLF" + j;
                    //String mealFoodID = "MLF" + String.format("%02d",mealFoodIDsize);
                    if(mealFoodList.size() == 0){
                        mealFoodID = "MLF" + String.format("%02d",mealFoodListSize + 1);
                        ++mealFoodListSize;
                    }
                    else{
                        mealFoodID = "MLF" + String.format("%02d",mealFoodListSize + 1); 
                        
                        boolean duplicateID;
                        int newID = 1;

                        String newFormatMealFoodnum = mealFoodID.substring(3,5);  
                                
                        do{
                            duplicateID = false;
                            for(int j=0 ; j<mealFoodList.size() ; j++){
                                MealFood meealFood = mealFoodList.get(j);
                                String formatMealFoodnum = meealFood.getMealfoodid().substring(3,5);  
                                
                                if(newFormatMealFoodnum.equals(formatMealFoodnum)){
                                    duplicateID = true;
                                    newFormatMealFoodnum = String.format("%02d",newID);
                                }
                            }
                            ++newID;
                            if(duplicateID == false){
                                mealFoodID = "MLF" + newFormatMealFoodnum;
                            }
                        }while(duplicateID == true);
                        ++mealFoodListSize;
                    }
                    //j++;
                    
                    MealFood mealfood = new MealFood(mealFoodID,foodList.get(i),meal,1);
                    selectedMealFood.add(mealfood);
                }
            }
            utx.begin();
            meal.setMealFoodList(selectedMealFood);
            em.persist(meal);
            utx.commit();
            
            mealList = mealquery.getResultList();
            session.setAttribute("mealList", mealList);
            
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
