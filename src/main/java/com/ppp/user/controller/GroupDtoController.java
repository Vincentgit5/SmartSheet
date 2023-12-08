package com.ppp.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.ppp.user.model.dto.GroupDTO;
import com.ppp.user.service.impl.GroupDtoServiceImpl;

@Controller
public class GroupDtoController {
	
	@Autowired
	private GroupDtoServiceImpl groupDtoServiceImpl;
	
	@PostMapping("/create-group-dto")
	public String createGroupeDto(@RequestBody GroupDTO groupDTO) {
		String createdGroupDto = groupDtoServiceImpl.saveGroupDTO(groupDTO);
		
		return "ok";
	}

}
