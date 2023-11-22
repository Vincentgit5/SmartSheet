package com.ppp.user.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Groupe;
import com.ppp.user.repository.GroupRepository;

@Service
public class GroupeServiceImpl implements GroupService {
	
	@Autowired
	private GroupRepository groupeRepository;

	@Override
	public Groupe addNewGroupe(Groupe groupe) throws GroupeAlreadyExistException {
		Optional<Groupe> existingGroup = groupeRepository.findByName(groupe.getName());
		if (existingGroup != null) {
			throw new GroupeAlreadyExistException("The groupe already exist please check to select");
		}
		
		Groupe newGroup = new Groupe();
		newGroup.setName(newGroup.getName());
		newGroup.setDescription(newGroup.getDescription());
		
		return groupeRepository.save(newGroup);
	}

	@Override
	public List<Groupe> getAllGroupe() {
		return groupeRepository.findAll();
	}

}
