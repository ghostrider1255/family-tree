package com.javasree.spring.familytree.web.service;

import java.util.List;

import com.javasree.spring.familytree.model.profile.Profile;

public interface ProfileService {
	
	public Profile save(Profile profile);
	
	public List<Profile> findAll();
}
