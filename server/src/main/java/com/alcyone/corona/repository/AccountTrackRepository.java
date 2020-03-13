package com.alcyone.corona.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.alcyone.corona.model.AccountTrack;

@Repository
public interface AccountTrackRepository extends JpaRepository<AccountTrack, String> {
	
	@Query("SELECT u FROM AccountTrack u WHERE u.account.uuid = ?1")
	public List<AccountTrack> findByAccountId(String accountId);
	
}