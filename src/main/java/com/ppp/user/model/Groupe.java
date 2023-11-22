package com.ppp.user.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

 @Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "groupe")
public class Groupe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false, length = 50)
	private String name;
	
	@Column(nullable = true)
	private String description;
	
	//@OneToMany(fetch = FetchType.LAZY, orphanRemoval = true,  mappedBy = "groupe")
	@OneToMany(fetch = FetchType.LAZY,  mappedBy = "groupe")
	private List<User> users;
	
	@OneToMany(fetch = FetchType.LAZY, orphanRemoval = true, mappedBy = "groupe")
	private List<GroupeRole> groupRoles;


}
