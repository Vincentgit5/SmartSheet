package com.ppp.user.service.impl;

import java.util.List;

import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Groupe;

public interface GroupService {
	
	Groupe addNewGroupe(Groupe groupe) throws GroupeAlreadyExistException;
	List<Groupe> getAllGroupe();

}
