package com.alcyone.corona.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.AccountStatus;
import com.alcyone.corona.repository.AccountStatusRepository;

@Service
public class AccountStatusService {

	@Autowired
	private AccountStatusRepository repository;

	public List<AccountStatus> getAll() {
		return repository.findAll();
	}
	
	public Optional<AccountStatus> getById(String uuid) {
		return repository.findById(uuid);
	}
	
}
