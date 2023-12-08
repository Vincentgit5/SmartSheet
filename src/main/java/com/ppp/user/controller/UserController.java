package com.ppp.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ppp.user.exceptions.UserAlreadyExistException;
import com.ppp.user.exceptions.UserNotFoundException;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.User;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.UserRepository;
import com.ppp.user.service.UserService;

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

	// Login controller
	@GetMapping("/login")
	public String login() {
		
		return "user_auth/login";
	}

	// Logout controller
	@GetMapping("/logout")
	public String Logout() {
		return "user_auth/login";
	}

	@Secured("ROLE_ADMIN")
	@GetMapping("/create-user")
	public String showRegistrationForm(Model model) {
		model.addAttribute("user", new User());
		List<Groupe> groups = groupRepository.findAll();
		model.addAttribute("groups", groups);
		return "user/create-user";
	}

	@PostMapping("create-user")
	public String saveUser(@ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		try {
			User registeredUser = userService.registerUser(user);
			model.addAttribute("user", registeredUser);
			userRepository.save(registeredUser);
			return "user/list-users";
		} catch (UserAlreadyExistException e) {
			result.rejectValue("email", "error.user", "Email already exists");
			return "register";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@GetMapping("/list-users")
	public String listUsers(Model model) {
		List<User> listOfUser = userService.getAllUser();
		model.addAttribute("users", listOfUser);
		return "user/list-users";
	}

	@DeleteMapping("delete-user/{username}")
	public ResponseEntity<String> deleteUserByUsername(@PathVariable String username) throws UserNotFoundException {
		try {
			userService.deleteUserByUsername(username);
			return new ResponseEntity<>("L'utilisateur a été supprimé avec succès.", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<>("An error occurred while deleting the user.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// User profile
		@GetMapping("/find/{email}/{username}")
	    public String findByUsernameOrEmail( @PathVariable("email") String email, @PathVariable("username") String username
	    ) throws UserNotFoundException {
	        User existingUser = userRepository.findByUsernameOrEmail(email, username);
	        if (existingUser == null) {
	            throw new UserNotFoundException("User not found: " + email);
	        }
	        return "user/user-profile";
	    }
}
