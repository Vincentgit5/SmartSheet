package com.ppp.user.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.GroupeRole;
import com.ppp.user.model.Role;
import com.ppp.user.model.dto.GroupDTO;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.GroupService;

@Service
public class GroupeServiceImpl implements GroupService {
	
	@Autowired
	private GroupRepository groupeRepository;
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public String addNewGroupe(GroupDTO groupDTO, Groupe groupe) {
	    Optional<Groupe> existingGroup = groupeRepository.findByName(groupe.getName());
	    if (existingGroup.isPresent()) {
	        return "/group-already-exist";
	    }

	    Groupe newGroup = new Groupe();
	    newGroup.setName(groupDTO.getName());
	    newGroup.setDescription(groupDTO.getDescription());
	    newGroup.setCreatedAt(LocalDateTime.now());
	    List<String> selectedRoles = groupDTO.getIds();

	    for (List<String> role : selectedRoles) {
	        GroupeRole groupeRole = new GroupeRole();
	        groupeRole.setGroupe(newGroup);
	        groupeRole.setRole(role);
	        newGroup.getGroupRoles().add(groupeRole);
	    }
	    
	    	groupeRepository.save(newGroup);

	    return "/succes";
	}

	@Override
	public List<Groupe> getAllGroupe() {
		return groupeRepository.findAll();
	}

}
