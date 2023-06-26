package com.fourTL.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fourTL.dao.AccountDAO;
import com.fourTL.entities.Account;
import com.fourTL.service.AcountService;


@Service
public abstract class AcountServiceImpl implements AcountService {

	@Autowired
	AccountDAO accountsDAO;

	@Override
	public List<Account> findAll() {
		return accountsDAO.findAll();
	}

	@Override
	public Account findById(String username) {
		return accountsDAO.findById(username).get();
	}
	
}
