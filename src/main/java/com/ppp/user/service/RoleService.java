package com.ppp.user.service;

import java.util.List;

import javax.management.relation.RoleInfoNotFoundException;

import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Role;

public interface RoleService {
	
	Role saveANewRole(Role role) throws GroupeAlreadyExistException;
	List<Role> getAllRoles();
	String deleteRole(Long id) throws RoleInfoNotFoundException;

}
