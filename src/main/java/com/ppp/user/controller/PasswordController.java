package com.ppp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ppp.user.model.User;
import com.ppp.user.service.PasswordService;
import com.ppp.user.service.UserService;

@Controller
@RequestMapping("/password")
public class PasswordController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PasswordService passwordService;
	@Autowired 
	private PasswordEncoder passwordEncoder;
	

	@PostMapping("/change-password")
	public String changePassword(@RequestParam("currentPassword") String currentPassword, 
								 @RequestParam("newPassword") String newPassword, 
								 @RequestParam("confirmPassword") String confirmPassword,
								 Authentication authentication) {
		
		String username = authentication.getName();
		User user = userService.findUserByUsername(username);
		if(!passwordEncoder.matches(currentPassword, user.getPassword())) {
			return "redirect:/changePassword?error";
		}
		if(!newPassword.equals(confirmPassword)) {
			return "redirect:/changePassword?error";
		}
		
		String hashedPassword = passwordEncoder.encode(newPassword);
		
		passwordService.updatePassword(user, hashedPassword);
		
		return "redirect:/index"; 
	}
}
