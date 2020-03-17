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
    public UserDetails loadUserByUsername(String deviceId) throws UsernameNotFoundException {
        Account account = repository.findByDeviceId(deviceId);
        if (account == null) {
            throw new UsernameNotFoundException(String.format("No device found with id '%s'.", deviceId));
        } else {
            return new User(account.getDeviceId(), account.getBirthYear().toString(), new ArrayList<GrantedAuthority>());
        }
    }
}