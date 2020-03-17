package com.alcyone.corona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.News;
import com.alcyone.corona.service.NewsService;

@RestController
@RequestMapping("/api/news")
//@CrossOrigin(origins = "http://localhost:3000")
class NewsController {

	@Autowired
	private NewsService service;
	
	@GetMapping
	public List<News> getAll() {
		return service.getAll();
	}
	
	@GetMapping("/{uuid}")
	public News getById(String uuid) {
		return service.getNews(uuid);
	}
	
	@GetMapping("/last")
	public List<News> getLast() {
		return service.getLast();
	}
	
	@PostMapping
	public void insert(News news) {
		service.save(news);
	}
	
	@PutMapping
	public void update(News news) {
		service.save(news);
	}
	
	@DeleteMapping
	public void delete(News news) {
		service.delete(news);
	}
	
}