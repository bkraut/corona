package com.alcyone.corona.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.alcyone.corona.model.Account;
import com.alcyone.corona.repository.AccountRepository;

@Service
public class JwtUserDetailsService implements UserDetailsService {

	@Autowired
	private AccountRepository repository;
	
	@Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = repository.findByUsername(username);
        if (account == null) {
            throw new UsernameNotFoundException(String.format("No device found with id '%s'.", username));
        } else {
            return new User(account.getUsername(), account.getBirthYear().toString(), new ArrayList<GrantedAuthority>());
        }
    }
    
}