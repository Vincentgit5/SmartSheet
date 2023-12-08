package com.ppp.user.service;

import java.util.List;

import com.ppp.user.exceptions.UserNotFoundException;
import com.ppp.user.model.User;

public interface UserService {
	List<User> getAllUser();
	User registerUser(User user) throws Exception;
	User findByUsernameOrEmail(String email, String username, User user) throws UserNotFoundException ;
	String updateUser(User user, String email, String username) throws UserNotFoundException;
	void deleteUserByUsername(String username);
}
