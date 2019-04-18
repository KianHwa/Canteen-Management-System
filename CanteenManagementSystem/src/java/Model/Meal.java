/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "MEAL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Meal.findAll", query = "SELECT m FROM Meal m")
    , @NamedQuery(name = "Meal.findByMealid", query = "SELECT m FROM Meal m WHERE m.mealid = :mealid")
    , @NamedQuery(name = "Meal.findByMealname", query = "SELECT m FROM Meal m WHERE m.mealname = :mealname")
    , @NamedQuery(name = "Meal.findByMealprice", query = "SELECT m FROM Meal m WHERE m.mealprice = :mealprice")
    , @NamedQuery(name = "Meal.findByMealimage", query = "SELECT m FROM Meal m WHERE m.mealimage = :mealimage")
    , @NamedQuery(name = "Meal.findByMealdesc", query = "SELECT m FROM Meal m WHERE m.mealdesc = :mealdesc")
    , @NamedQuery(name = "Meal.findByMealstatus", query = "SELECT m FROM Meal m WHERE m.mealstatus = :mealstatus")
    , @NamedQuery(name = "Meal.findByMealcategory", query = "SELECT m FROM Meal m WHERE m.mealcategory = :mealcategory")})
public class Meal implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "MEALID")
    private String mealid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "MEALNAME")
    private String mealname;
    @Basic(optional = false)
    @NotNull
    @Column(name = "MEALPRICE")
    private int mealprice;
    @Size(max = 100)
    @Column(name = "MEALIMAGE")
    private String mealimage;
    @Size(max = 200)
    @Column(name = "MEALDESC")
    private String mealdesc;
    @Size(max = 20)
    @Column(name = "MEALCATEGORY")
    private String mealcategory;
    @Size(max = 20)
    @Column(name = "MEALSTATUS")
    private String mealstatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mealMealid")
    private List<OrderMeal> orderMealList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "mealMealid")
    private List<MealFood> mealFoodList;

    public Meal() {
    }

    public Meal(String mealid) {
        this.mealid = mealid;
    }

    public Meal(String mealid, String mealname, int mealprice) {
        this.mealid = mealid;
        this.mealname = mealname;
        this.mealprice = mealprice;
    }
    
    public Meal(String mealid, String mealname, int mealprice, String mealstatus) {
        this.mealid = mealid;
        this.mealname = mealname;
        this.mealprice = mealprice;
        this.mealstatus = mealstatus;
    }

    public String getMealid() {
        return mealid;
    }

    public void setMealid(String mealid) {
        this.mealid = mealid;
    }

    public String getMealname() {
        return mealname;
    }

    public void setMealname(String mealname) {
        this.mealname = mealname;
    }

    public int getMealprice() {
        return mealprice;
    }

    public void setMealprice(int mealprice) {
        this.mealprice = mealprice;
    }

    public String getMealimage() {
        return mealimage;
    }

    public void setMealimage(String mealimage) {
        this.mealimage = mealimage;
    }

    public String getMealdesc() {
        return mealdesc;
    }

    public void setMealdesc(String mealdesc) {
        this.mealdesc = mealdesc;
    }

    public String getMealcategory() {
        return mealcategory;
    }

    public void setMealcategory(String mealcategory) {
        this.mealcategory = mealcategory;
    }
    
    public String getMealstatus() {
        return mealstatus;
    }

    public void setMealstatus(String mealstatus) {
        this.mealstatus = mealstatus;
    }

    @XmlTransient
    public List<OrderMeal> getOrderMealList() {
        return orderMealList;
    }

    public void setOrderMealList(List<OrderMeal> orderMealList) {
        this.orderMealList = orderMealList;
    }

    @XmlTransient
    public List<MealFood> getMealFoodList() {
        return mealFoodList;
    }

    public void setMealFoodList(List<MealFood> mealFoodList) {
        this.mealFoodList = mealFoodList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mealid != null ? mealid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Meal)) {
            return false;
        }
        Meal other = (Meal) object;
        if ((this.mealid == null && other.mealid != null) || (this.mealid != null && !this.mealid.equals(other.mealid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Meal[ mealid=" + mealid + " ]";
    }
    
}
