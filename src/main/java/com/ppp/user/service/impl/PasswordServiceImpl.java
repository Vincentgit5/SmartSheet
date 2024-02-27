package com.ppp.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppp.user.model.User;
import com.ppp.user.repository.UserRepository;
import com.ppp.user.service.PasswordService;

@Service
public class PasswordServiceImpl implements PasswordService{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public void updatePassword(User user, String hashedPassword) {
		user.setPassword(hashedPassword);
		userRepository.save(user);
		
	}

	
}
