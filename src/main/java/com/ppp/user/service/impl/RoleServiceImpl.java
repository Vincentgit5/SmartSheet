package com.ppp.user.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppp.user.model.Role;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;
	
	
		@Override
	public List<Role> getAllRoles() {
		return roleRepository.findAll();
	}

	@Override
	public Role viewRoleDetails(String name) {
		return roleRepository.findByName(name);
	}
}
