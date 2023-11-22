package com.ppp.user.dto;

import lombok.Data;

@Data
public class UserLoginDto {
	
	private String UserNameOrEmail;
	private String password;
	
}
