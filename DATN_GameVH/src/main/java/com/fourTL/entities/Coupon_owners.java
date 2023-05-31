package com.fourTL.entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
public class Coupon_owners implements Serializable{
	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	Boolean status;
	
	@ManyToOne
	@JoinColumn(name = "Username")
	Accounts account;
	
	@ManyToOne
	@JoinColumn(name = "CouponCode")
	Coupons coupon;
}
