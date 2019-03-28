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
@Table(name = "STUDENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Student.findAll", query = "SELECT s FROM Student s")
    , @NamedQuery(name = "Student.findByStudid", query = "SELECT s FROM Student s WHERE s.studid = :studid")
    , @NamedQuery(name = "Student.findByStudname", query = "SELECT s FROM Student s WHERE s.studname = :studname")
    , @NamedQuery(name = "Student.findByStudemail", query = "SELECT s FROM Student s WHERE s.studemail = :studemail")
    , @NamedQuery(name = "Student.findByStudphone", query = "SELECT s FROM Student s WHERE s.studphone = :studphone")
    , @NamedQuery(name = "Student.findByStudpassword", query = "SELECT s FROM Student s WHERE s.studpassword = :studpassword")
    , @NamedQuery(name = "Student.findByCredpoints", query = "SELECT s FROM Student s WHERE s.credpoints = :credpoints")})
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STUDID")
    private String studid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STUDNAME")
    private String studname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STUDEMAIL")
    private String studemail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "STUDPHONE")
    private String studphone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "STUDPASSWORD")
    private String studpassword;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CREDPOINTS")
    private int credpoints;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentStudid")
    private List<Order1> order1List;

    public Student() {
    }

    public Student(String studid) {
        this.studid = studid;
    }

    public Student(String studid, String studname, String studemail, String studphone, String studpassword, int credpoints) {
        this.studid = studid;
        this.studname = studname;
        this.studemail = studemail;
        this.studphone = studphone;
        this.studpassword = studpassword;
        this.credpoints = credpoints;
    }

    public String getStudid() {
        return studid;
    }

    public void setStudid(String studid) {
        this.studid = studid;
    }

    public String getStudname() {
        return studname;
    }

    public void setStudname(String studname) {
        this.studname = studname;
    }

    public String getStudemail() {
        return studemail;
    }

    public void setStudemail(String studemail) {
        this.studemail = studemail;
    }

    public String getStudphone() {
        return studphone;
    }

    public void setStudphone(String studphone) {
        this.studphone = studphone;
    }

    public String getStudpassword() {
        return studpassword;
    }

    public void setStudpassword(String studpassword) {
        this.studpassword = studpassword;
    }

    public int getCredpoints() {
        return credpoints;
    }

    public void setCredpoints(int credpoints) {
        this.credpoints = credpoints;
    }

    @XmlTransient
    public List<Order1> getOrder1List() {
        return order1List;
    }

    public void setOrder1List(List<Order1> order1List) {
        this.order1List = order1List;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studid != null ? studid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Student)) {
            return false;
        }
        Student other = (Student) object;
        if ((this.studid == null && other.studid != null) || (this.studid != null && !this.studid.equals(other.studid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Model.Student[ studid=" + studid + " ]";
    }
    
}
