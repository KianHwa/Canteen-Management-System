
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
@Table(name = "ORDER_MEAL")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderMeal.findAll", query = "SELECT o FROM OrderMeal o")
    , @NamedQuery(name = "OrderMeal.findByOrdermealid", query = "SELECT o FROM OrderMeal o WHERE o.ordermealid = :ordermealid")})
public class OrderMeal implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "ORDERMEALID")
    private String ordermealid;
    @JoinColumn(name = "MEAL_MEALID", referencedColumnName = "MEALID")
    @ManyToOne(optional = false)
    private Meal mealMealid;
    @JoinColumn(name = "ORDER_ORDERID", referencedColumnName = "ORDERID")
    @ManyToOne(optional = false)
    private Orders orderOrderid;

    public OrderMeal() {
    }

    public OrderMeal(String ordermealid, Meal mealMealid, Orders orderOrderid) {
        this.ordermealid = ordermealid;
        this.mealMealid = mealMealid;
        this.orderOrderid = orderOrderid;
    }

    public String getOrdermealid() {
        return ordermealid;
    }

    public void setOrdermealid(String ordermealid) {
        this.ordermealid = ordermealid;
    }

    public Meal getMealMealid() {
        return mealMealid;
    }

    public void setMealMealid(Meal mealMealid) {
        this.mealMealid = mealMealid;
    }

    public Orders getOrderOrderid() {
        return orderOrderid;
    }

    public void setOrderOrderid(Orders orderOrderid) {
        this.orderOrderid = orderOrderid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ordermealid != null ? ordermealid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderMeal)) {
            return false;
        }
        OrderMeal other = (OrderMeal) object;
        if ((this.ordermealid == null && other.ordermealid != null) || (this.ordermealid != null && !this.ordermealid.equals(other.ordermealid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.OrderMeal[ ordermealid=" + ordermealid + " ]";
    }
    
}
