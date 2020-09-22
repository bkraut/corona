package com.alcyone.corona.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.AccountLocation;
import com.alcyone.corona.repository.AccountLocationRepository;

@Service
public class AccountLocationService {

	@Autowired
	private AccountLocationRepository repository;

	public List<AccountLocation> getAll(String accountId) {
		return repository.findByAccountId(accountId);
	}

	public AccountLocation save(AccountLocation location) {
		location.setUuid(UUID.randomUUID().toString());
		location.setCreationDate(new Date());
		return repository.save(location);
	}

	public void delete(AccountLocation location) {
		repository.delete(location);
	}
	
	public void delete(String uuid) {
		repository.deleteById(uuid);
	}
	
}
