package com.ppp.user.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ppp.user.exceptions.UserAlreadyExistException;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.User;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private GroupRepository groupRepository;

	
	@Override
	public List<User> getAllUser() {
		
		return userRepository.findAll();
	}

	@Override
	public User registerUser(User user) throws Exception {
		User existUser = userRepository.findByEmail(user.getEmail());
		if(existUser != null) {
            throw new UserAlreadyExistException("Email alredy exist: "
              + user.getEmail());
        }
		User newUser = new User();
	    newUser.setUsername(user.getUsername());
	    newUser.setFirstName(user.getFirstName());
	    newUser.setLastName(user.getLastName());
	    newUser.setAddress(user.getAddress());
	    newUser.setEmail(user.getEmail());
	    newUser.setPassword(passwordEncoder.encode(user.getPassword()));
	    newUser.setMobile(user.getMobile());
	    newUser.setCreatedAt(LocalDate.now());
	    newUser.setGroupe(user.getGroupe());
	      
    return userRepository.save(newUser);
		
	}
 
	@Override
	public String deleteByUsername(String username, User user){
		User userExist = userRepository.findByUsername(username);
		if(userExist == null) {
			throw new RuntimeException("User not found : " + user.getUsername());
		}
		userRepository.delete(userExist);
		
		return " The user was deleted successfully";
	}

	@Override
	public User findByUsernameOrEmail(String email, String username, User user){
		User existingUser = userRepository.findByUsernameOrEmail(email, username);
		if(existingUser == null) {
			throw new RuntimeException("User not found : " + user.getEmail());
		}
		return (existingUser);
	}

	@Override
	public String updateUser(User user, String email, String username) {
		User existingUser = userRepository.findByUsernameOrEmail(email, username);
				if(existingUser == null) {
					throw new RuntimeException("User not found : " + user.getEmail());
				}
		User updateUser = new User();
		updateUser.setUsername(user.getUsername());
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setAddress(user.getAddress());
		updateUser.setEmail(user.getEmail());
		updateUser.setPassword(passwordEncoder.encode(user.getPassword()));
		updateUser.setMobile(user.getMobile());
		updateUser.setCreatedAt(LocalDate.now());
	        userRepository.save(updateUser);
		return null;
	}


}
