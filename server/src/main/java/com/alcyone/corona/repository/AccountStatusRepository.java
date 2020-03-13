package com.alcyone.corona.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.alcyone.corona.model.AccountStatus;

@Repository
public interface AccountStatusRepository extends JpaRepository<AccountStatus, String> {
	
}