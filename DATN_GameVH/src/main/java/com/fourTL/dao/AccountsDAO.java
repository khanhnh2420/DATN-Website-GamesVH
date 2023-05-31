package com.fourTL.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fourTL.entities.Accounts;

public interface AccountsDAO extends JpaRepository<Accounts, String>{
	List<Accounts> findByUsernameContaining(String search);
}
