package com.gamevh.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gamevh.entities.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, String>{

}
