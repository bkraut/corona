package com.alcyone.corona.service;

import java.util.List;

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

	public AccountStatus save(AccountStatus status) {
		return repository.save(status);
	}

	public void delete(AccountStatus status) {
		repository.delete(status);
	}
	
	public void delete(String uuid) {
		repository.deleteById(uuid);
	}
	
}
