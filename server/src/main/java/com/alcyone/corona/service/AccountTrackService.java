package com.alcyone.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.AccountTrack;
import com.alcyone.corona.repository.AccountTrackRepository;

@Service
public class AccountTrackService {

	@Autowired
	private AccountTrackRepository repository;

	public List<AccountTrack> getAll(String accountId) {
		return repository.findByAccountId(accountId);
	}

	public AccountTrack save(AccountTrack track) {
		return repository.save(track);
	}

	public void delete(AccountTrack track) {
		repository.delete(track);
	}
	
	public void delete(String uuid) {
		repository.deleteById(uuid);
	}
	
}
