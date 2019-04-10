/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "MEAL_FOOD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MealFood.findAll", query = "SELECT m FROM MealFood m")
    , @NamedQuery(name = "MealFood.findByMealfoodid", query = "SELECT m FROM MealFood m WHERE m.mealfoodid = :mealfoodid")
    , @NamedQuery(name = "MealFood.findByFoodqty", query = "SELECT m FROM MealFood m WHERE m.foodqty = :foodqty")})
public class MealFood implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "MEALFOODID")
    private String mealfoodid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FOODQTY")
    private int foodqty;
    @JoinColumn(name = "FOOD_FOODID", referencedColumnName = "FOODID")
    @ManyToOne(optional = false)
    private Food foodFoodid;
    @JoinColumn(name = "MEAL_MEALID", referencedColumnName = "MEALID")
    @ManyToOne(optional = false)
    private Meal mealMealid;

    public MealFood() {
    }
    
    
    public MealFood(String mealfoodid, Food foodFoodid, Meal mealMealid, int foodqty){
        this.mealfoodid = mealfoodid;
        this.foodFoodid = foodFoodid;
        this.mealMealid = mealMealid;
        this.foodqty = foodqty;
    }

    public MealFood(String mealfoodid) {
        this.mealfoodid = mealfoodid;
    }
    
    public MealFood(Meal mealMealid) {
        this.mealMealid = mealMealid;
    }
    
    public MealFood(Food foodFoodid) {
        this.foodFoodid = foodFoodid;
    }

    public MealFood(String mealfoodid, int foodqty) {
        this.mealfoodid = mealfoodid;
        this.foodqty = foodqty;
    }

    public String getMealfoodid() {
        return mealfoodid;
    }

    public void setMealfoodid(String mealfoodid) {
        this.mealfoodid = mealfoodid;
    }

    public int getFoodqty() {
        return foodqty;
    }

    public void setFoodqty(int foodqty) {
        this.foodqty = foodqty;
    }

    public Food getFoodFoodid() {
        return foodFoodid;
    }

    public void setFoodFoodid(Food foodFoodid) {
        this.foodFoodid = foodFoodid;
    }

    public Meal getMealMealid() {
        return mealMealid;
    }

    public void setMealMealid(Meal mealMealid) {
        this.mealMealid = mealMealid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mealfoodid != null ? mealfoodid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MealFood)) {
            return false;
        }
        MealFood other = (MealFood) object;
        if ((this.mealfoodid == null && other.mealfoodid != null) || (this.mealfoodid != null && !this.mealfoodid.equals(other.mealfoodid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.MealFood[ mealfoodid=" + mealfoodid + " ]";
    }
    
}
