package com.javasree.spring.familytree.web;

import static com.javasree.spring.familytree.web.utils.URLConstant.FAMILY_TREE_VIEW;
import static com.javasree.spring.familytree.web.utils.URLConstant.PROFILE_VIEW;
import static com.javasree.spring.familytree.web.utils.URLConstant.SAVE_PROFILE;

import java.util.ArrayList;
import java.util.List;

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
	
	@Autowired
	private ProfileService profileService;
	
	@RequestMapping(value=PROFILE_VIEW, method=RequestMethod.GET)
	public String viewProfile(Model model){
		Profile profile = new Profile();
		profile.setProfileId(new Long(0));
		model.addAttribute("profile", profile);
		return "profilePage";
	}
	
	@RequestMapping(value=SAVE_PROFILE, method = RequestMethod.POST)
	public String addProfile(@ModelAttribute("profile") Profile profile,BindingResult result,Model model){
		profile.setGender("MALE");
		profileService.save(profile);
		return "profilePage";
	}
	
	@RequestMapping(value=FAMILY_TREE_VIEW, method=RequestMethod.GET, produces= MediaType.APPLICATION_JSON_VALUE)
	public String viewFamilyTree(Model model){
		List<TreeNode> nodesList = getNodesList();
		ObjectMapper jsonMapper = new ObjectMapper();
		try {
			model.addAttribute("items", jsonMapper.writeValueAsString(nodesList));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "familyTree";
	}
	
	private List<TreeNode> getNodesList(){
		
		List<TreeNode> nodesList = new ArrayList<>();
		
		TreeNode node = new TreeNode();
		node.setId(0);
		node.setTitle("Parent");
		node.setParent(null);
		node.setDescription("Parent");
		node.setPhone("999-999-9999");
		node.setEmailId("abc@xyz.com");
		nodesList.add(node);

		node = new TreeNode();
		node.setId(1);
		node.setParent(new Long(0));
		node.setTitle("Child One");
		node.setDescription("Child One");
		node.setPhone("888-888-8888");
		node.setEmailId("bcd@xyz.com");
		nodesList.add(node);
		
		node = new TreeNode();
		node.setId(2);
		node.setParent(new Long(0));
		node.setTitle("Child TWo");
		node.setDescription("Child Two");
		node.setPhone("777-777-7777");
		node.setEmailId("efg@xyz.com");
		nodesList.add(node);
		
		node = new TreeNode();
		node.setId(4);
		node.setParent(new Long(0));
		node.setTitle("Child Three");
		node.setDescription("Child Three");
		node.setPhone("666-666-6666");
		node.setEmailId("ttt@xyz.com");
		nodesList.add(node);
		
		node = new TreeNode();
		node.setId(3);
		node.setParent(new Long(2));
		node.setTitle("grand child");
		node.setDescription("Grand Child");
		node.setPhone("777-777-5555");
		node.setEmailId("efg@xyz.com");
		nodesList.add(node);
		
		return nodesList;
	}

}
