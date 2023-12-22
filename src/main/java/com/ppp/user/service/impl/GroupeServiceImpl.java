package com.ppp.user.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppp.user.model.Groupe;
import com.ppp.user.model.GroupeRole;
import com.ppp.user.model.Role;
import com.ppp.user.model.dto.GroupDTO;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.GroupRoleRepository;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.GroupService;

@Service
public class GroupeServiceImpl implements GroupService {
	
	@Autowired
	private GroupRepository groupeRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	public GroupRoleRepository groupRoleRepository;

	@Override
	public String addNewGroupe(GroupDTO groupDTO) {
	    Groupe newGroup = new Groupe();
	    newGroup.setName(groupDTO.getName());
	    newGroup.setDescription(groupDTO.getDescription());
	    newGroup.setCreatedAt(LocalDateTime.now());
	    newGroup.setGroupRoles(newGroup.getGroupRoles());
	    List<String> selectedRoles = groupDTO.getIds();
	    
	    groupeRepository.save(newGroup);

	    for (String roleName : selectedRoles) {
	        Role role = roleRepository.findByName(roleName);
	        GroupeRole groupeRole = new GroupeRole();
	        groupeRole.setGroupe(newGroup);
	        groupeRole.setRole(role);
	        groupRoleRepository.save(groupeRole);
	    }
	    return  "sucess";
	}
	

	@Override
	public List<Groupe> getAllGroupe() {
		return groupeRepository.findAll();
	}

}
