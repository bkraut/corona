package com.alcyone.corona.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.Account;
import com.alcyone.corona.repository.AccountRepository;

@Service
public class AccountService {

	@Autowired
	private AccountRepository repository;
	
	@Autowired
	private PasswordEncoder bcryptEncoder;

	public List<Account> getAll() {
		return repository.findAll();
	}

	public Account getAccount(String uuid) {
		return repository.getOne(uuid);
	}
	
	public Account getAccountByUsername(String username) {
		return repository.findByUsername(username);
	}

	public Account register(Account account) {
		account.setUpdateDate(new Date());
		account.setCreationDate(new Date());
		account.setPassword(bcryptEncoder.encode(account.getPassword()));
		return repository.save(account);
	}
	
	public Account update(Account account) {
		Account old = repository.findByUsername(account.getUsername());
		account.setUpdateDate(new Date());
		account.setPassword(old.getPassword());
		return account;
	}

	public void delete(Account account) {
		repository.delete(account);
	}
	
}
