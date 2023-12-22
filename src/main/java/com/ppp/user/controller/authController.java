package com.ppp.user.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class authController {
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("/")
	public String homePage() {

		return "index";
	}
	
	// Login controller
		@GetMapping("/login")
		public String login(HttpServletRequest http) {
			
			 Principal pr = http.getUserPrincipal();
			 if(pr == null) {
			System.out.println("pr");
				 return "user_auth/login";
			 }else {
				 System.out.println("prrr" + pr.getName());
				 return "/";
			 }
		}

		// Logout controller
		@GetMapping("/logout")
		public void Logout() {
			
			return;
		}
		
		// Logout controller
				@GetMapping("/success")
				public String created() {
					
					return "success/user-created-successfully";
				}
}
