package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.AccountLocation;
import com.alcyone.corona.service.AccountLocationService;

@RestController
@RequestMapping("/api/account/location")
//@CrossOrigin(origins = "http://localhost:3000")
class AccountLocationController {

	@Autowired
	private AccountLocationService service;
	
	@GetMapping
	public List<AccountLocation> getAllAccountLocations(String accountId) {
		return service.getAll(accountId);
	}
	
	@PostMapping
	public void save(@RequestBody AccountLocation location) {
		System.out.println("Location received.");
		service.save(location);
	}
	
}