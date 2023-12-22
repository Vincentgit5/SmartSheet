package com.ppp.user.controller;

import java.util.List;

import javax.management.relation.RoleInfoNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppp.user.model.Role;
import com.ppp.user.model.User;
import com.ppp.user.model.dto.RoleDTO;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.RoleService;
import com.ppp.user.service.impl.RoleServiceImpl;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private RoleService roleService;
	
//	@PreAuthorize("hasAuthority('ROLE_LIST_ROLES')")
	@GetMapping("/list-roles")
	public String listAlltheRoles(Model model) {
		List<Role> getAllRoles = roleService.getAllRoles();
		model.addAttribute("roles", getAllRoles);
		
		return "user/list-roles";
	}
	
	@GetMapping("/view-role-details/{name}")
	public String viewRoleDetails(@PathVariable String name, Model model) {
			Role roleFind = roleRepository.findByName(name);
			model.addAttribute("roleFind", roleFind);
			if(roleFind  == null) {
				return "errors/role-not-found";
			}
	    return "user/role-details";
	}

}
