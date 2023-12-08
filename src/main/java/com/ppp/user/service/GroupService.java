package com.ppp.user.service;

import java.util.List;

import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.dto.GroupDTO;

public interface GroupService {
	
	List<Groupe> getAllGroupe();
	String addNewGroupe(GroupDTO groupeDto, Groupe groupe) throws GroupeAlreadyExistException;

}
