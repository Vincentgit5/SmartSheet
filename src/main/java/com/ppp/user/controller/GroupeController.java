package com.ppp.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppp.user.model.Groupe;
import com.ppp.user.model.Role;
import com.ppp.user.model.dto.GroupDTO;
import com.ppp.user.repository.GroupRepository;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.GroupService;
import com.ppp.user.service.impl.GroupeServiceImpl;

@Controller
@RequestMapping("/group")
public class GroupeController {

	@Autowired
	private GroupeServiceImpl groupeServiceImpl;
	@Autowired
	private GroupService groupService;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private GroupRepository groupRepository;

//	@PreAuthorize("hasAuthority('ROLE_ADD_GROUP')")
	@GetMapping("/add-group")
	public String showGroupeRegistrationForm(Model model) {
	List<Role> roles = roleRepository.findAll();
		model.addAttribute("roles", roles);
		model.addAttribute("groupDTO", new GroupDTO());
		return "user/add-group";
	}
	
	@PostMapping("/add-group")
	public String saveGroupe(@RequestBody GroupDTO groupDTO, String name){
			Groupe existingGroup = groupRepository.findByName(name);
			String newGroupe = groupeServiceImpl.addNewGroupe(groupDTO);
			if(newGroupe != null) {
				return "/groupe-already-exist";
			}
	    return "user/list-groups";
	}

//	@PreAuthorize("hasAuthority('ROLE_LIST_GROUPS')")
	@GetMapping("/list-groups")
	public String listAllGroupes(Model model) {
		List<Groupe> groups = groupService.getAllGroupe();
		model.addAttribute( "groups", groups);
		return "user/list-groups";
	}

}
