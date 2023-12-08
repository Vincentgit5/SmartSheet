package com.ppp.user.controller;

import java.util.List;
import java.util.Optional;

import javax.management.relation.RoleInfoNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ppp.user.model.Role;
import com.ppp.user.repository.RoleRepository;
import com.ppp.user.service.RoleService;

@Controller
@RequestMapping
public class RoleController {
	
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private RoleService roleService;
	
	@GetMapping("/create-role")
	public String showRoleRegistrationForm(Model model) {
		model.addAttribute("role", new Role());
		return "user/create-role";
	}
	
	@PostMapping("/create-role")
	public String saveAnewRole(@ModelAttribute("role") 
								 Role role, ModelMap model, BindingResult result) {
		model.addAttribute("role", role);
		System.out.println(role);
		roleRepository.save(role);
		return "user/list-roles";
	}
	
	@GetMapping("/list-roles")
	public String listAlltheRoles(Model model) {
		List<Role> getAllRoles = roleService.getAllRoles();
		model.addAttribute("roles", getAllRoles);
		System.out.println(getAllRoles);
		return "user/list-roles";
	}
	
	@GetMapping("delete-role/{id}")
	public String deleteRole(@PathVariable Long id) {
		try {
			 roleService.deleteRole(id);
			 return " deleted sucessfully";
		} catch (RoleInfoNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/list-roles";
	}

}
