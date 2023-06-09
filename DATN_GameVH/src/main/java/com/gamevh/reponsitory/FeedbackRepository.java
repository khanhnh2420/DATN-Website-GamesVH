package com.gamevh.reponsitory;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.gamevh.entities.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {
	@Query("SELECT f FROM Feedback f WHERE f.product.id = :productId AND f.status = true")
	List<Feedback> findByProductId(Integer productId);
}
