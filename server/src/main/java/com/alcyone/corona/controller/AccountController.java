package com.alcyone.corona.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.model.Account;
import com.alcyone.corona.service.AccountService;

@RestController
@RequestMapping("/api/account")
class AccountController {

	@Autowired
	private AccountService service;
	
	@GetMapping
	public List<Account> getAll() {
		return service.getAll();
	}
	
	@PostMapping("/register")
	public void register(@Valid @RequestBody Account account) {
		service.register(account);
	}
	
	@PostMapping("/update")
	public void save(@Valid @RequestBody Account account) {
		service.update(account);
	}
	
	@DeleteMapping
	public void unregister(@RequestBody Account account) {
		service.delete(account);
	}
	
	@ResponseStatus(code = HttpStatus.BAD_REQUEST)
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public Map<String, String> handleValidationExceptions(
	  MethodArgumentNotValidException ex) {
	    Map<String, String> errors = new HashMap<>();
	    ex.getBindingResult().getAllErrors().forEach((error) -> {
	        String fieldName = ((FieldError) error).getField();
	        String errorMessage = error.getDefaultMessage();
	        errors.put(fieldName, errorMessage);
	    });
	    return errors;
	}
	
}