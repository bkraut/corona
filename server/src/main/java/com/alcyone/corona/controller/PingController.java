package com.alcyone.corona.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/ping")
public class PingController {
	
	@GetMapping
	public Map<String, Object> ping() {
		Map<String, Object> response = new HashMap<String,Object>();
		response.put("success", true);
		return response;
	}
}
