package com.ppp.user.service;

import java.util.List;


import com.ppp.user.model.Role;
import com.ppp.user.model.dto.RoleDTO;

public interface RoleService {
	
	List<Role> getAllRoles();
	Role viewRoleDetails(String name);

}
