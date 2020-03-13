package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.Account;
import com.alcyone.corona.service.AccountService;

@RestController
@RequestMapping("/api/accounts")
//@CrossOrigin(origins = "http://localhost:3000")
class AccountController {

	@Autowired
	private AccountService service;
	
	@GetMapping("/list")
	public List<Account> getAll() {
		return service.getAll();
	}
	
	@PostMapping("/update")
	public void update(Account account) {
		service.save(account);
	}
	
	@PostMapping("/register")
	public void register(Account account) {
		service.save(account);
	}
	
	@PostMapping("/unregister")
	public void unregister(Account account) {
		service.delete(account);
	}
	
}