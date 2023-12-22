package com.ppp.user.service;

import java.util.List;

import javax.swing.GroupLayout.Group;

import com.ppp.user.model.Groupe;
import com.ppp.user.model.dto.GroupDTO;

public interface GroupService {
	
	List<Groupe> getAllGroupe();
	String addNewGroupe(GroupDTO groupDto);

}
