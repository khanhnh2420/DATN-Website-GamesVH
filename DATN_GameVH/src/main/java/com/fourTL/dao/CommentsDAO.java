package com.fourTL.dao;


import com.fourTL.entities.Comments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentsDAO extends JpaRepository<Comments, Integer> {
//    @Query("SELECT MAX(b.ThoiGianCmt) AS LatestDate FROM  Comments b")
//    List<Comments> findNewsestComment();

    @Query(value = "SELECT c FROM Comments c WHERE c.IdBlog= ?1 order by c.ThoiGianCmt desc ",nativeQuery = true)
    List<Comments> findAllByIdBlog(Integer id);
}