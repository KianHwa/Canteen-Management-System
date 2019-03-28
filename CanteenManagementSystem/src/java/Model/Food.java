/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "FOOD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Food.findAll", query = "SELECT f FROM Food f")
    , @NamedQuery(name = "Food.findByFoodid", query = "SELECT f FROM Food f WHERE f.foodid = :foodid")
    , @NamedQuery(name = "Food.findByFoodname", query = "SELECT f FROM Food f WHERE f.foodname = :foodname")
    , @NamedQuery(name = "Food.findByFoodcalories", query = "SELECT f FROM Food f WHERE f.foodcalories = :foodcalories")})
public class Food implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "FOODID")
    private String foodid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "FOODNAME")
    private String foodname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FOODCALORIES")
    private int foodcalories;
    @JoinTable(name = "MEAL_FOOD", joinColumns = {
        @JoinColumn(name = "FOOD_FOODID", referencedColumnName = "FOODID")}, inverseJoinColumns = {
        @JoinColumn(name = "MEAL_MEALID", referencedColumnName = "MEALID")})
    @ManyToMany
    private List<Meal> mealList;

    public Food() {
    }

    public Food(String foodid) {
        this.foodid = foodid;
    }

    public Food(String foodid, String foodname, int foodcalories) {
        this.foodid = foodid;
        this.foodname = foodname;
        this.foodcalories = foodcalories;
    }

    public String getFoodid() {
        return foodid;
    }

    public void setFoodid(String foodid) {
        this.foodid = foodid;
    }

    public String getFoodname() {
        return foodname;
    }

    public void setFoodname(String foodname) {
        this.foodname = foodname;
    }

    public int getFoodcalories() {
        return foodcalories;
    }

    public void setFoodcalories(int foodcalories) {
        this.foodcalories = foodcalories;
    }

    @XmlTransient
    public List<Meal> getMealList() {
        return mealList;
    }

    public void setMealList(List<Meal> mealList) {
        this.mealList = mealList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (foodid != null ? foodid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Food)) {
            return false;
        }
        Food other = (Food) object;
        if ((this.foodid == null && other.foodid != null) || (this.foodid != null && !this.foodid.equals(other.foodid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Food[ foodid=" + foodid + " ]";
    }
    
}
