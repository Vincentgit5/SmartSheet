package com.ppp.user.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ppp.user.exceptions.GroupNotFoundExeption;
import com.ppp.user.exceptions.GroupeAlreadyExistException;
import com.ppp.user.model.Groupe;
import com.ppp.user.model.GroupeRole;
import com.ppp.user.model.Role;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.GroupRoleRepository;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.GroupService;

@Controller
public class GroupeController {

	@Autowired
	private GroupRepository groupRepository;
	@Autowired
	private GroupRoleRepository groupRoleRepository;
	@Autowired
	private GroupService groupService;
	@Autowired
	private RoleRepository roleRepository;

	@GetMapping("/create-group")
	public String showGroupeRegistrationForm(Model model) {
		List<Role> roles = roleRepository.findAll();
		model.addAttribute("roles", roles);
		model.addAttribute("groupe", new Groupe());
		return "user/create-group";
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/create-group")
	public String saveGroupe(@ModelAttribute("groupe") Groupe group, 
	                         ModelMap model, BindingResult result ) throws GroupNotFoundExeption, GroupeAlreadyExistException {
		
	    model.addAttribute("groupe", group);
	    groupService.addNewGroupe(group);

	    return "user/list-groupsu";
	}

	
	@GetMapping("/list-groups")
	public String listAllGroupes(Model model) {
		List<Groupe> groups = groupService.getAllGroupe();
		model.addAttribute( "groups", groups);
		System.out.println(groups);
		return "user/list-groups";
	}

}
