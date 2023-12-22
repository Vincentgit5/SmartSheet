package com.ppp.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppp.user.model.Groupe;
import com.ppp.user.model.User;
import com.ppp.user.model.dto.UserDTO;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.UserRepository;
import com.ppp.user.service.UserService;
import com.ppp.user.service.impl.GroupeServiceImpl;
import com.ppp.user.service.impl.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private GroupRepository groupRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserServiceImpl userServiceImpl;

	
// 	@PreAuthorize("hasAuthority('ROLE_ADD_USER')")
	@GetMapping("/add-user")
	public String showRegistrationForm(Model model ,String name) {
		List<Groupe> groups = groupRepository.findAll();
		model.addAttribute("groups", groups);
		model.addAttribute("userDTO", new UserDTO());
		return "user/add-user";
	}

//	@PreAuthorize("hasAuthority('ROLE_ADD_USER')")
	@PostMapping("/add-user")
	public String saveUser(@RequestBody UserDTO userDTO, BindingResult result, String name) {
			User existUser = userRepository.findByEmail(userDTO.getEmail());
		    User registeredUser = userServiceImpl.createUser(userDTO);
			if(existUser == null) {
	           return "/errors/user-not-found";
	        }
		return "user/list-users";
	}
	
//	@PreAuthorize("hasRole('ROLE_VIEW_USER_PROFILE')")
	@GetMapping("/viewUser/{username}")
	public String findOneUser(@PathVariable String username, Model model) {
			User userFind = userServiceImpl.findUserByUsername(username);
			model.addAttribute("userFind", userFind);
			if(userFind  == null) {
				return "errors/user-not-found";
			}
	    return "user/view-user-profile";
	}
	
	
//	@PreAuthorize("hasRole('ROLE_UDATE_USER')")
	@PostMapping("/updateUser/{username}")
	public String updateUser(@RequestBody UserDTO updatedUserDTO, @PathVariable String username) {
	    String userUpdated = userServiceImpl.updateUser(updatedUserDTO);
	    if(userUpdated == "error") {
	    	return "Error";
	    }
	    return "/user/list-users";
	}

//	@PreAuthorize("hasRole('ROLE_LIST_USERS')")
	@GetMapping("/list-users")
	public String listUsers(Model model,boolean isDeleted) {
		Iterable<User> listOfUser = userService.getAllUser(isDeleted);
		if(listOfUser == null) {
			return "errors/empty-list";
		}
		model.addAttribute("users", listOfUser);
		return "user/list-users";
	}

//	@PreAuthorize("hasRole('ROLE_REMOVE_USER')")
	@DeleteMapping("remove-user/{username}")
	public String removeUserByUsername(@PathVariable String username) {
	    User existingUser = userRepository.findByUsername(username);
	    if (existingUser == null) {
	      return "/error";
	    }
	    userServiceImpl.deleteUserByUsername(username);
	    
	    return "/success";
	  }
	
	// Update Password
}
