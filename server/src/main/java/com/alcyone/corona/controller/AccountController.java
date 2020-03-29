package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.Account;
import com.alcyone.corona.service.AccountService;

@RestController
@RequestMapping("/api/account")
class AccountController {

	@Autowired
	private AccountService service;
	
	@GetMapping
	public List<Account> getAll() {
		return service.getAll();
	}
	
	@PostMapping("/register")
	public void register(Account account) {
		service.save(account);
	}
	
	@PostMapping("/update")
	public void save(Account account) {
		service.save(account);
	}
	
	@DeleteMapping
	public void unregister(Account account) {
		service.delete(account);
	}
	
}