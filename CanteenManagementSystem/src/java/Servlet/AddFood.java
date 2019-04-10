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
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;


@WebServlet(name = "AddFood", urlPatterns = {"/AddFood"})
public class AddFood extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String foodName = request.getParameter("foodname");
            int calories = Integer.parseInt(request.getParameter("calories"));
            boolean existed = false;
            String foodID = "";

            Query query = em.createNamedQuery("Food.findAll");
            List<Food> foodlist = query.getResultList();
            
                if(foodlist.size() == 0){
                    foodID = "FD" + String.format("%02d",foodlist.size() + 1);
                }
                else{
                    foodID = "FD" + String.format("%02d",foodlist.size() + 1);
                    boolean duplicateID;
                    int newID = 1;
                    
                    String newFormatFoodnum = foodID.substring(2,4); 
                    
                    
                    do{
                        duplicateID = false;
                        for(int i=0 ; i<foodlist.size() ; i++){
                            Food fooood = foodlist.get(i);
                            String formatFoodnum = fooood.getFoodid().substring(2,4);  
                            
                            if(newFormatFoodnum.equals(formatFoodnum)){
                                duplicateID = true;
                                newFormatFoodnum = String.format("%02d",newID);
                            }
                        }
                        ++newID;
                        
                        if(duplicateID == false){
                            foodID = "FD" + newFormatFoodnum;
                        }
                    }while(duplicateID == true);
                }
                
                
                    
                
                
            
            //check existing food name
            for(int i=0 ; i<foodlist.size() ; i++){
                    //Check if student ID/Name is exist/already registered
                    Food foood = foodlist.get(i);
                    if(foood.getFoodname().toLowerCase().equals(foodName.toLowerCase())){
                        existed = true;
                        response.sendRedirect("Staff/AddFood.jsp?existed=true&food=" + foodName + "");
                    }
                }
            if(existed==false){
                    utx.begin();
                    Food food = new Food(foodID, foodName, calories);        
                    em.persist(food);
                    utx.commit();
                    
                    HttpSession session = request.getSession();
                    Query foodquery = em.createNamedQuery("Food.findAll");
                    List<Food> foodList = foodquery.getResultList();
                    session.setAttribute("foodList", foodList);
                    
                    response.sendRedirect("Staff/AddFood.jsp?success=true&food=" + foodName + "");
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
