package com.alcyone.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.Account;
import com.alcyone.corona.repository.AccountRepository;

@Service
public class AccountService {

	@Autowired
	private AccountRepository repository;

	public List<Account> getAll() {
		return repository.findAll();
	}

	public Account getAccount(String uuid) {
		return repository.getOne(uuid);
	}
	
	public Account getAccountByDeviceId(String deviceId) {
		return repository.findByDeviceId(deviceId);
	}

	public Account save(Account account) {
		return repository.save(account);
	}

	public void delete(Account account) {
		repository.delete(account);
	}
	
	public void delete(String uuid) {
		repository.deleteById(uuid);
	}
	
}
