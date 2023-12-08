package com.ppp.user.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class loginController {
	
	
	@GetMapping("/login")
	public String login() {
//		
//		if (error != null) 
//			model.addAttribute("error", "Your username and password is invalid.");
//		
//		if (logout != null)
//			model.addAttribute("logout", "You have been logged out successfully.");
//		
		return "pages-login";
	}

}
