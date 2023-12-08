package com.ppp.user.service.impl;


import org.springframework.stereotype.Service;

import com.ppp.user.model.dto.GroupDTO;
import com.ppp.user.service.GroupDtoService;

@Service
public class GroupDtoServiceImpl implements GroupDtoService {
	

	@Override
	public String saveGroupDTO(GroupDTO groupeDTO) {
		GroupDTO newGroupDto = new GroupDTO();
		newGroupDto.setName(newGroupDto.getName());
		newGroupDto.setDescription(newGroupDto.getDescription());
		newGroupDto.setIds(newGroupDto.getIds());
		
		return "ok";
	}

}
