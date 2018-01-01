package com.javasree.spring.familytree.web;

import static com.javasree.spring.familytree.web.utils.URLConstant.FAMILY_TREE_VIEW;
import static com.javasree.spring.familytree.web.utils.URLConstant.PROFILE_VIEW;
import static com.javasree.spring.familytree.web.utils.URLConstant.SAVE_PROFILE;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javasree.spring.familytree.model.profile.Profile;
import com.javasree.spring.familytree.web.dto.TreeNode;
import com.javasree.spring.familytree.web.service.ProfileService;

@Controller
public class ProfileController {
	
	private static final Logger log = LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping(value=PROFILE_VIEW, method=RequestMethod.GET)
	public String viewProfile(Model model){
		Profile profile = new Profile();
		profile.setProfileId(Long.valueOf(0));
		model.addAttribute("profile", profile);
		return "profilePage";
	}
	
	@RequestMapping(value=SAVE_PROFILE, method = RequestMethod.POST, 
			consumes = MediaType.APPLICATION_JSON_VALUE , produces= MediaType.APPLICATION_JSON_VALUE)
	public String saveProfile(@ModelAttribute("profile") Profile profile,BindingResult result,Model model){
		Profile newProfile = profileService.save(profile);
		model.addAttribute("profile", newProfile);
		return "profilePage";
	}
	
	@RequestMapping(value=FAMILY_TREE_VIEW, method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public String viewFamilyTree(Model model){
		List<TreeNode> nodesList = null;
		nodesList = getNodes();
		ObjectMapper jsonMapper = new ObjectMapper();
		try {
			model.addAttribute("items", jsonMapper.writeValueAsString(nodesList));
			model.addAttribute("profile", new Profile());
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		return "familyTree";
	}
	
	private TreeNode getTreeNodeFromProfile(Profile profile){
		TreeNode node = new TreeNode();
		node.setId(profile.getProfileId());
		node.setTitle(profile.getFirstName());
		node.setDescription(profile.getProfileName());
		node.setParent(profile.getParentId());
		
		return node;
	}
	
	public List<TreeNode> getNodes(){
		List<TreeNode> nodes = new ArrayList<>();
		
		List<Profile> profiles = profileService.findAll();
		if(profiles!=null && !profiles.isEmpty()){
			profiles.forEach( profile -> {
				TreeNode node = getTreeNodeFromProfile(profile);
				nodes.add(node);
			});
		}
		else{
			Profile rootProfile = new Profile();
			rootProfile.setParentId(null);
			rootProfile.setProfileName("Profile full Name");
			rootProfile.setFirstName("First Name");
			rootProfile.setLastName("Last Name");
			rootProfile.setGender("male");
			Profile newRootProfile = profileService.save(rootProfile);
			
			TreeNode node = getTreeNodeFromProfile(newRootProfile);
			nodes.add(node);
		}
		return nodes;
	}
}
