package com.ppp.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import com.ppp.user.model.Groupe;
import com.ppp.user.repository.GroupRepository;

@Controller
public class GroupeController {
	
	@Autowired
	private GroupRepository  groupRepository;

	@GetMapping("/pages-groupe-register")
	public String showGroupeRegistrationForm(Model model) {
		model.addAttribute("groupe", new Groupe());
		return "pages-groupe-register";
	}
	
	@PostMapping("pages-groupe-register/save")
	public String saveGroupe(@ModelAttribute("groupe") Groupe group, 
							 ModelMap model, BindingResult result) {
		model.addAttribute("groupe", group);
		groupRepository.save(group);
		
		return "index";
	}
	
	@GetMapping("/getAll")
	public String listAllGroupes() {
		List<Groupe>  groupes = groupRepository.findAll();
		System.out.println(groupes);
		return "list-all";
	}
	
}
