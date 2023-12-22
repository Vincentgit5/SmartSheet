package com.ppp.user.service.impl;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.hibernate.Filter;
import org.hibernate.Session;
import javax.persistence.EntityManager;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.User;
import com.ppp.user.model.dto.UserDTO;
import com.ppp.user.repository.GroupRepository;
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
	private EntityManager entityManager;

//<-----------------List user------------------------>
	@Override
	public Iterable<User> getAllUser(boolean isDeleted) {
	   Session session = entityManager.unwrap(Session.class);
	   Filter filter = session.enableFilter("deletedUsertFilter");
	   filter.setParameter("isDeleted", isDeleted);
       Iterable<User> users =  userRepository.findAll();
       session.disableFilter("deletedUsertFilter");
		return userRepository.findAll();
	}

//<-----------------Create user <useing userDTO------------------->
	@Override
	public User createUser(UserDTO userDTO) {
		User newUser = new User();
	    newUser.setUsername(userDTO.getUsername());
	    newUser.setFirstName(userDTO.getFirstName());
	    newUser.setLastName(userDTO.getLastName());
	    newUser.setAddress(userDTO.getAddress());
	    newUser.setEmail(userDTO.getEmail());
	    newUser.setPassword(passwordEncoder.encode(userDTO.getPassword()));
	    newUser.setMobile(userDTO.getMobile());
	    newUser.setCreatedAt(LocalDate.now());
	    String getGroup = userDTO.getGroupe();
	    Groupe groupe = groupRepository.findByName(getGroup);
	    newUser.setGroupe(groupe);
	    
	   userRepository.save(newUser);
	   return newUser;	
	}

	@Override
	public User findUserByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public void deleteUserByUsername(String username) {
		userRepository.deleteByUsername(username);
		
	}

//<---------------Get user by username using DTO objet------------------->	
	public UserDTO getUserByUsername(String username) {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            return null;
        }
        UserDTO userDTO = new UserDTO();
        userDTO.setFirstName(user.getFirstName());
        userDTO.setLastName(user.getLastName());
        userDTO.setAddress(user.getAddress());
        userDTO.setMobile(user.getMobile());
        userDTO.setMobile(user.getMobile());
        userDTO.setPassword(user.getPassword());
        userDTO.setUsername(user.getUsername());
        userDTO.setEmail(user.getEmail());

        return userDTO;
    }

	@Override
	public String updateUser(UserDTO updatedUserDTO) {
		User existingUser = userRepository.findByUsername(updatedUserDTO.getUsername());
		if(existingUser == null) {
			return "error";
		}
		existingUser.setFirstName(updatedUserDTO.getFirstName());
		existingUser.setLastName(updatedUserDTO.getLastName());
		existingUser.setUsername(updatedUserDTO.getUsername());
		existingUser.setEmail(updatedUserDTO.getEmail());
		existingUser.setAddress(updatedUserDTO.getAddress());
		existingUser.setMobile(updatedUserDTO.getMobile());
		 userRepository.save(existingUser);
		
		return " success";
	}
}
