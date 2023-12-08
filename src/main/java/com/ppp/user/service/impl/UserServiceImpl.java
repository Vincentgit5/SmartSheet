package com.ppp.user.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ppp.user.exceptions.UserAlreadyExistException;
import com.ppp.user.exceptions.UserNotFoundException;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.Role;
import com.ppp.user.model.User;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.GroupRoleRepository;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.repository.UserRepository;
import com.ppp.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private GroupRepository groupRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private GroupRoleRepository groupRoleRepository;

	
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
	    public void deleteUserByUsername(String username) {
	        User user = userRepository.findByUsername(username);
	        if (user != null) {
	            Groupe groupe = user.getGroupe();
	            Role role = groupRoleRepository.findRoleByGroupe(groupe);

	            groupe.getUsers().remove(user);
	            groupRoleRepository.deleteByGroupe(groupe);

	            userRepository.delete(user);
	            groupRepository.delete(groupe);
	            roleRepository.delete(role);
	        }
	    }

	@Override
	public User findByUsernameOrEmail(String email, String username, User user) throws UserNotFoundException{
		User existingUser = userRepository.findByUsernameOrEmail(email, username);
		if(existingUser == null) {
			throw new UsernameNotFoundException("User not found : " + user.getEmail());
		}
		return (existingUser);
	}

	@Override
	public String updateUser(User user, String email, String username) throws UserNotFoundException {
		User existingUser = userRepository.findByUsernameOrEmail(email, username);
				if(existingUser == null) {
					throw new UserNotFoundException("User not found : " + user.getEmail());
				}
		User updateUser = new User();
		updateUser.setUsername(user.getUsername());
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setAddress(user.getAddress());
		updateUser.setEmail(user.getEmail());
		updateUser.setMobile(user.getMobile());
		updateUser.setCreatedAt(LocalDate.now());
	        userRepository.save(updateUser);
		return null;
	}


}
