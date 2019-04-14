
package Model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o")
    , @NamedQuery(name = "Orders.findByOrderid", query = "SELECT o FROM Orders o WHERE o.orderid = :orderid")
    , @NamedQuery(name = "Orders.findByOrderdate", query = "SELECT o FROM Orders o WHERE o.orderdate = :orderdate")
    , @NamedQuery(name = "Orders.findByOrderstatus", query = "SELECT o FROM Orders o WHERE o.orderstatus = :orderstatus")
    , @NamedQuery(name = "Orders.findByCouponcode", query = "SELECT o FROM Orders o WHERE o.couponcode = :couponcode")})
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "ORDERID")
    private String orderid;
    @Column(name = "ORDERDATE")
    @Temporal(TemporalType.DATE)
    private Date orderdate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "ORDERSTATUS")
    private String orderstatus;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "COUPONCODE")
    private String couponcode;
    @JoinColumn(name = "STUDENT_STUDID", referencedColumnName = "STUDID")
    @ManyToOne(optional = false)
    private Student studentStudid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderOrderid")
    private List<OrderMeal> orderMealList;

    public Orders() {
    }

    public Orders(String orderid) {
        this.orderid = orderid;
    }

    public Orders(String orderid, String orderstatus, String couponcode) {
        this.orderid = orderid;
        this.orderstatus = orderstatus;
        this.couponcode = couponcode;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

    public String getCouponcode() {
        return couponcode;
    }

    public void setCouponcode(String couponcode) {
        this.couponcode = couponcode;
    }

    public Student getStudentStudid() {
        return studentStudid;
    }

    public void setStudentStudid(Student studentStudid) {
        this.studentStudid = studentStudid;
    }

    @XmlTransient
    public List<OrderMeal> getOrderMealList() {
        return orderMealList;
    }

    public void setOrderMealList(List<OrderMeal> orderMealList) {
        this.orderMealList = orderMealList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Orders[ orderid=" + orderid + " ]";
    }
    
}
