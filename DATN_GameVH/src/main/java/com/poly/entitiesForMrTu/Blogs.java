/*
 * Created on 2023-04-28 ( 22:54:57 )
 * Generated by Telosys ( http://www.telosys.org/ ) version 3.3.0
 */
package com.poly.entitiesForMrTu;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

/**
 * JPA entity class for "Blogs"
 *
 * @author Telosys
 *
 */
@Entity
@Table(name="Blogs", schema="dbo", catalog="DB_4TL" )
public class Blogs implements Serializable {

    private static final long serialVersionUID = 1L;

    //--- ENTITY PRIMARY KEY 
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id", nullable=false)
    private Integer    id ;

    //--- ENTITY DATA FIELDS 
    @Column(name="BlogTittle", nullable=false, length=255)
    private String     blogtittle ;

    @Column(name="BlogBody", length=1080)
    private String     blogbody ;

    @Column(name="Username", nullable=false, length=50)
    private String     username ;

    @Column(name="IdSp")
    private Integer    idsp ;

    @Column(name="HinhAnh", length=50)
    private String     hinhanh ;

    @Temporal(TemporalType.DATE)
    @Column(name="ThoiGianBlog")
    private Date       thoigianblog ;


    //--- ENTITY LINKS ( RELATIONSHIP )
    @ManyToOne
    @JoinColumn(name="IdSp", referencedColumnName="Id", insertable=false, updatable=false)
    private Products   products ; 

    @ManyToOne
    @JoinColumn(name="Username", referencedColumnName="Username", insertable=false, updatable=false)
    private Accounts   accounts ; 

    @OneToMany(mappedBy="blogs")
    private List<Comments> listOfComments ; 


    /**
     * Constructor
     */
    public Blogs() {
		super();
    }
    
    //--- GETTERS & SETTERS FOR FIELDS
    public void setId( Integer id ) {
        this.id = id ;
    }
    public Integer getId() {
        return this.id;
    }

    public void setBlogtittle( String blogtittle ) {
        this.blogtittle = blogtittle ;
    }
    public String getBlogtittle() {
        return this.blogtittle;
    }

    public void setBlogbody( String blogbody ) {
        this.blogbody = blogbody ;
    }
    public String getBlogbody() {
        return this.blogbody;
    }

    public void setUsername( String username ) {
        this.username = username ;
    }
    public String getUsername() {
        return this.username;
    }

    public void setIdsp( Integer idsp ) {
        this.idsp = idsp ;
    }
    public Integer getIdsp() {
        return this.idsp;
    }

    public void setHinhanh( String hinhanh ) {
        this.hinhanh = hinhanh ;
    }
    public String getHinhanh() {
        return this.hinhanh;
    }

    public void setThoigianblog( Date thoigianblog ) {
        this.thoigianblog = thoigianblog ;
    }
    public Date getThoigianblog() {
        return this.thoigianblog;
    }

    //--- GETTERS FOR LINKS
    public Products getProducts() {
        return this.products;
    } 

    public Accounts getAccounts() {
        return this.accounts;
    } 

    public List<Comments> getListOfComments() {
        return this.listOfComments;
    } 

    //--- toString specific method
	@Override
    public String toString() { 
        StringBuilder sb = new StringBuilder(); 
        sb.append(id);
        sb.append("|");
        sb.append(blogtittle);
        sb.append("|");
        sb.append(blogbody);
        sb.append("|");
        sb.append(username);
        sb.append("|");
        sb.append(idsp);
        sb.append("|");
        sb.append(hinhanh);
        sb.append("|");
        sb.append(thoigianblog);
        return sb.toString(); 
    } 

}
