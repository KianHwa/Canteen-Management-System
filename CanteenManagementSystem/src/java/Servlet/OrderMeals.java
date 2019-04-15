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


@WebServlet(name = "OrderMeal", urlPatterns = {"/OrderMeal"})
public class OrderMeals extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            HttpSession session = request.getSession();
            String orderStartDate = request.getParameter("startdate");
            String orderEndDate = request.getParameter("enddate");
            String mealcategory = request.getParameter("mealcat");
            String mealid = request.getParameter("mealid");
            String studid = request.getParameter("studid");
            
            
            Student stud = em.find(Student.class,studid);
            Meal meal = em.find(Meal.class,mealid);
            Calendar c = Calendar.getInstance();
            
            Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(orderStartDate);  
            Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(orderEndDate);

            int days = (int)(endDate.getTime() - startDate.getTime())/(1000*60*60*24);
            boolean sameDate = false;
            /*try (PrintWriter out = response.getWriter()) {
            out.println("<h1>Servlet NewServlet at " + days + "</h1>");
            }*/
                
            List<OrderMeal> selectedOrderMeal = new ArrayList<OrderMeal>();  
                utx.begin();
            for(int i=0; i<=days ; i++){
                Query orderquery = em.createNamedQuery("Orders.findAll");
                List<Orders> orderList = orderquery.getResultList();
                Query ordermealquery = em.createNamedQuery("OrderMeal.findAll");
                List<OrderMeal> orderMealList = ordermealquery.getResultList();
                
                int ordersize = orderList.size();
                int ordermealsize = orderMealList.size();
                int couponsize = orderList.size();
                
                String orderID = "";
                String couponCode = "";
                String orderMealID = "";
                
                c.setTime(startDate);
                c.add(Calendar.DATE,i);
                startDate = c.getTime();
                
                for(int j=0 ; j<orderList.size() ; j++){
                    Orders orders = orderList.get(j);
                    if(orders.getOrderdate().compareTo(startDate) == 0 && orders.getStudentStudid().getStudid().equals(studid) && 
                        orders.getOrderMealList().get(0).getMealMealid().getMealcategory().equals(mealcategory)){
                        sameDate = true;
                        response.sendRedirect("Student/StudentHome.jsp?status=fail");
                    }
                }
                
                
                if(orderList.size() == 0){
                    orderID = "OD" + String.format("%02d",ordersize + 1);
                    couponCode = "CP" + String.format("%02d",ordersize + 1);
                    orderMealID = "OM" + String.format("%02d",ordermealsize + 1);
                }
                else{
                    orderID = "OD" + String.format("%02d",ordersize + 1);
                    couponCode = "CP" + String.format("%02d",ordersize + 1);
                    boolean duplicateID;
                    int newID = 1;
                    
                    String newFormatOrdernum = orderID.substring(2,4);  //02
                    
                    do{
                        duplicateID = false;
                        for(int j=0 ; j<orderList.size() ; j++){
                            Orders orderlist = orderList.get(j);
                            String formatOrdernum = orderlist.getOrderid().substring(2,4);  //02
                            
                    
                            
                            if(newFormatOrdernum.equals(formatOrdernum)){
                                duplicateID = true;
                                newFormatOrdernum = String.format("%02d",newID);//01
                            }
                        }
                        ++newID;
                        if(duplicateID == false){
                            orderID = "OD" + newFormatOrdernum;
                            couponCode = "CP" + newFormatOrdernum;
                            orderMealID = "OM" + newFormatOrdernum;
                        }
                    }while(duplicateID == true);
                }
                
                c.setTime(startDate);
                Orders orders = new Orders();
                orders.setOrderid(orderID);
                orders.setOrderdate(startDate);
                orders.setCouponcode(couponCode);
                orders.setOrderstatus("Ordered");
                orders.setStudentStudid(stud);
                
                
                OrderMeal ordermeal = new OrderMeal(orderMealID,meal,orders);
                selectedOrderMeal.add(ordermeal);
                
                
                orders.setOrderMealList(selectedOrderMeal);
                
                em.persist(orders);
            }
            
            if(sameDate == false){
                utx.commit();
            }
            
                Query orderquery = em.createNamedQuery("Orders.findAll");
                List<Orders> orderList = orderquery.getResultList();
                session.setAttribute("orderList", orderList);
                
               
                
                response.sendRedirect("Student/StudentHome.jsp");
            
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
