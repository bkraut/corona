package com.alcyone.corona.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.alcyone.corona.model.AccountLocation;

@Repository
public interface AccountLocationRepository extends JpaRepository<AccountLocation, String> {
	
	@Query("SELECT u FROM AccountLocation u WHERE u.account.uuid = ?1")
	public List<AccountLocation> findByAccountId(String accountId);
	
}