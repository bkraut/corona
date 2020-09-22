package com.alcyone.corona.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.alcyone.corona.config.JwtTokenUtil;
import com.alcyone.corona.config.WebSecurityConfig;
import com.alcyone.corona.model.Account;
import com.alcyone.corona.model.JwtRequest;
import com.alcyone.corona.model.JwtResponse;
import com.alcyone.corona.service.AccountService;
import com.alcyone.corona.service.AccountStatusService;

@RestController
@CrossOrigin
@RequestMapping("/api/account")
class AccountController {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;
	
	@Autowired
	private WebSecurityConfig config;
	
	@Autowired
	private AccountService service;
	
	@Autowired
	private AccountStatusService statusService;
	
	@GetMapping
	public List<Account> getAll() {
		return service.getAll();
	}
	
	@PostMapping("/register")
	public void register(@Valid @RequestBody Account account) {
		if (service.getAccountByUsername(account.getUsername())!=null) {
			throw new RuntimeException("Številka je že registrirana.");
		}
		account.setStatus(statusService.getById("E5B813FA-27BA-4CB3-BAC4-AC7281D9F1B6").get());
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
	
	@RequestMapping(value = "/authenticate", method = RequestMethod.POST)
	public ResponseEntity<?> createAuthenticationToken(@RequestBody JwtRequest authenticationRequest) throws Exception {
		authenticate(authenticationRequest.getUsername());
		final UserDetails userDetails = service.loadUserByUsername(authenticationRequest.getUsername());
		final String token = jwtTokenUtil.generateToken(userDetails);
		return ResponseEntity.ok(new JwtResponse(token));
	}
	
	private void authenticate(String username) throws Exception {
		try {
			authenticationManager.authenticate(
					new UsernamePasswordAuthenticationToken(
							username,
							config.getSecret()
							)
					);
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		}
	}
	
}