package com.alcyone.corona.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.News;
import com.alcyone.corona.repository.NewsRepository;

@Service
public class NewsService {

	@Autowired
	private NewsRepository repository;

	public List<News> getAll() {
		return repository.findAll();
	}
	
	public List<News> getLast() {
		return repository.getLast();
	}

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
