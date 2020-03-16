package com.alcyone.corona.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.alcyone.corona.model.News;

@Repository
public interface NewsRepository extends JpaRepository<News, String> {
	
	@Query("SELECT u FROM News u order by o.creationDate DESC limit 20")
	public List<News> getLast();
	
}