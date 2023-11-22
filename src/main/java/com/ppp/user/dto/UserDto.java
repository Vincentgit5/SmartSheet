package com.ppp.user.dto;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

	@Column(nullable = false, length = 255)
	private String firstName;
	
	@Column(nullable = false, length = 255)
	private String lastName;
	
	@Column(nullable = false, unique = true, length = 255)
	private String email;
	
	@Column(nullable = false, length = 255)
	private String password;
	
	@Column(nullable = false, length = 15)
	private String mobile;
	
	@Column(nullable = false, length = 255)
	private String address;
	
	@Column(nullable = false, length = 255)
	private String username;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss ")
	private LocalDateTime createAt;

}
