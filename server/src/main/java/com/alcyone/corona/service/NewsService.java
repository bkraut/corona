package com.alcyone.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.News;
import com.alcyone.corona.repository.NewsRepository;

@Service
@CacheConfig(cacheNames={"news"})
public class NewsService {

	@Autowired
	private NewsRepository repository;

	@Cacheable
	public List<News> getAll() {
		return repository.findAll();
	}
	
	@Cacheable
	public List<News> getLast() {
		return repository.getLast();
	}

	@Cacheable
	public News getNews(String uuid) {
		return repository.getOne(uuid);
	}
	
	public News save(News news) {
		return repository.save(news);
	}

	public void delete(News news) {
		repository.delete(news);
	}
	
	public void delete(String uuid) {
		repository.deleteById(uuid);
	}
	
}
