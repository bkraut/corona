package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.AccountTrack;
import com.alcyone.corona.service.AccountTrackService;

@RestController
@RequestMapping("/api/account/{accountId}/track")
//@CrossOrigin(origins = "http://localhost:3000")
class AccountTrackController {

	@Autowired
	private AccountTrackService service;
	
	@GetMapping
	public List<AccountTrack> getAllAccountTracks(String accountId) {
		return service.getAll(accountId);
	}
	
	@PostMapping
	public void save(@RequestBody AccountTrack track) {
		System.out.println("Location received.");
		//service.save(track);
	}
	
}