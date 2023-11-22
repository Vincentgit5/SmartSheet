package com.ppp.user.service.impl;

import java.util.List;


import com.ppp.user.model.User;

public interface UserService {
	List<User> getAllUser();
	User registerUser(User user) throws Exception;
	String deleteByUsername(String username, User user);
	User findByUsernameOrEmail(String email, String username, User user) ;
	String updateUser(User user, String email, String username);
}
