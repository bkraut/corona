package com.alcyone.corona.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.alcyone.corona.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, String> {
	
	@Query("SELECT u FROM Account u WHERE u.username = ?1")
	public Account findByUsername(String username);
	
}