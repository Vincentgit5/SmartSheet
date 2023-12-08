package com.ppp.user.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import javax.management.relation.RoleInfoNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Groupe;
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
	public String deleteRole(Long id) throws RoleInfoNotFoundException {
		Optional<Role> existRole = roleRepository.findById(id);
		if(existRole.isPresent()) {
			Role roles = existRole.get();
			roleRepository.deleteById(roles.getId());
		}else {
			throw new RoleInfoNotFoundException("Role not exist");
		}
		
		return "Role deleted successfully ";
	}

	@Override
	public Role saveANewRole(Role role) throws GroupeAlreadyExistException {
		Role existingRole = roleRepository.findByName(role.getName());
		if (existingRole != null) {
		    throw new GroupeAlreadyExistException("Group already exists");
		}

		Role roleToSave = new Role();
		roleToSave.setName(roleToSave.getName());
		roleToSave.setCreatedRoleDate(LocalDateTime.now());
		roleToSave.setDescription(roleToSave.getDescription());
		roleRepository.save(roleToSave);

		return roleToSave;
	}

}
