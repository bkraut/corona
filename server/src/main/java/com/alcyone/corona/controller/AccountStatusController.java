package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.AccountStatus;
import com.alcyone.corona.service.AccountStatusService;

@RestController
@RequestMapping("/api/sets/account/status")
@CrossOrigin
class AccountStatusController {

	@Autowired
	private AccountStatusService service;
	
	@GetMapping
	public List<AccountStatus> getAll() {
		return service.getAll();
	}
	
}