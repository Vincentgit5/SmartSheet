package com.ppp.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppp.user.model.Groupe;
import com.ppp.user.model.User;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.UserRepository;
import com.ppp.user.service.impl.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private GroupRepository groupRepository;
	@Autowired
	private UserRepository userRepository;
	
	
	@GetMapping("/")
	public String registerUser() {
		 
		return "index";
	}
	
	@GetMapping("/user-pages-register")
	public String showRegistrationForm(Model model){
        model.addAttribute("user", new User());
        List<Groupe> groups = groupRepository.findAll();
	    model.addAttribute("groups", groups);
        return "pages-register";
    }
	
	@PostMapping("user-pages-register/save")
		public String showRegisterPage(@ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		    model.addAttribute("user", user);
		    userRepository.save(user);
		    System.out.println(user);

		    return "register";
		}
	
	@GetMapping("/users")
	public String  listUsers(Model model ) {
		List<User> listOfUser = userService.getAllUser();
		model.addAttribute("users", listOfUser);		
		return "tables-data";
	}

}


	