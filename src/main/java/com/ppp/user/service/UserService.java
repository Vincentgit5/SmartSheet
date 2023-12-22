package com.ppp.user.service;


import com.ppp.user.model.User;
import com.ppp.user.model.dto.UserDTO;

public interface UserService {
	Iterable<User> getAllUser(boolean isDeleted);
	User createUser(UserDTO userDTO);
	void deleteUserByUsername(String username);
	User findUserByUsername(String username);
	String updateUser(UserDTO updatedUserDTO);
}
