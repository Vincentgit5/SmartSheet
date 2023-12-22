package com.ppp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ppp.user.model.User;
import com.ppp.user.model.dto.UserDTO;
import com.ppp.user.repository.UserRepository;
import com.ppp.user.service.impl.UserServiceImpl;

@RestController
@RequestMapping("userDTO")
public class userDTOController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	
	@GetMapping("get-user/{username}")
	public UserDTO getUserByUsername(@PathVariable String username) {
		return userServiceImpl.getUserByUsername(username);
	}
	
}
