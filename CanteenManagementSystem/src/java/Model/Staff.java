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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "STAFF")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staff.findAll", query = "SELECT s FROM Staff s")
    , @NamedQuery(name = "Staff.findByStaffid", query = "SELECT s FROM Staff s WHERE s.staffid = :staffid")
    , @NamedQuery(name = "Staff.findByStaffname", query = "SELECT s FROM Staff s WHERE s.staffname = :staffname")
    , @NamedQuery(name = "Staff.findByStaffemail", query = "SELECT s FROM Staff s WHERE s.staffemail = :staffemail")
    , @NamedQuery(name = "Staff.findByStaffphone", query = "SELECT s FROM Staff s WHERE s.staffphone = :staffphone")
    , @NamedQuery(name = "Staff.findByStaffpassword", query = "SELECT s FROM Staff s WHERE s.staffpassword = :staffpassword")})
public class Staff implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STAFFID")
    private String staffid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFFNAME")
    private String staffname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFFEMAIL")
    private String staffemail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "STAFFPHONE")
    private String staffphone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STAFFPASSWORD")
    private String staffpassword;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "staffStaffid")
    private List<Staff> staffList;
    @JoinColumn(name = "STAFF_STAFFID", referencedColumnName = "STAFFID")
    @ManyToOne(optional = false)
    private Staff staffStaffid;

    public Staff() {
    }

    public Staff(String staffid) {
        this.staffid = staffid;
    }

    public Staff(String staffid, String staffname, String staffemail, String staffphone, String staffpassword) {
        this.staffid = staffid;
        this.staffname = staffname;
        this.staffemail = staffemail;
        this.staffphone = staffphone;
        this.staffpassword = staffpassword;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
    }

    public String getStaffemail() {
        return staffemail;
    }

    public void setStaffemail(String staffemail) {
        this.staffemail = staffemail;
    }

    public String getStaffphone() {
        return staffphone;
    }

    public void setStaffphone(String staffphone) {
        this.staffphone = staffphone;
    }

    public String getStaffpassword() {
        return staffpassword;
    }

    public void setStaffpassword(String staffpassword) {
        this.staffpassword = staffpassword;
    }

    @XmlTransient
    public List<Staff> getStaffList() {
        return staffList;
    }

    public void setStaffList(List<Staff> staffList) {
        this.staffList = staffList;
    }

    public Staff getStaffStaffid() {
        return staffStaffid;
    }

    public void setStaffStaffid(Staff staffStaffid) {
        this.staffStaffid = staffStaffid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffid != null ? staffid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staff)) {
            return false;
        }
        Staff other = (Staff) object;
        if ((this.staffid == null && other.staffid != null) || (this.staffid != null && !this.staffid.equals(other.staffid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Staff[ staffid=" + staffid + " ]";
    }
    
}
