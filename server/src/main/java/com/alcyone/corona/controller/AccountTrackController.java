package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.AccountTrack;
import com.alcyone.corona.service.AccountTrackService;

@RestController
@RequestMapping("/api/account")
//@CrossOrigin(origins = "http://localhost:3000")
class AccountTrackController {

	@Autowired
	private AccountTrackService service;
	
	@GetMapping("/{accountId}/tracks/list")
	public List<AccountTrack> getAllAccountTracks(String accountId) {
		return service.getAll(accountId);
	}
	
	@PostMapping("/{accountId}/tracks")
	public void save(AccountTrack track) {
		service.save(track);
	}
	
}