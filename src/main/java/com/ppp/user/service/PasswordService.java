package com.ppp.user.service;


import com.ppp.user.model.User;

public interface PasswordService {
	
	void updatePassword(User user, String hashedPassword);

}
