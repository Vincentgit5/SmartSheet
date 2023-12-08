package com.ppp.user.exceptions;

@SuppressWarnings("serial")
public class UserNotFoundException extends Exception {
	public UserNotFoundException(String message) {
        super(message);
    }

}
