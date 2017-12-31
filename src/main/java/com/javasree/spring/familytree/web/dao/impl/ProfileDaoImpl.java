package com.javasree.spring.familytree.web.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasree.spring.familytree.model.profile.Profile;
import com.javasree.spring.familytree.web.dao.ProfileDao;
import com.javasree.spring.familytree.web.jpa.ProfileRepository;

@Service
public class ProfileDaoImpl implements ProfileDao{

	@Autowired
	private ProfileRepository profileRepository;
	
	public ProfileDaoImpl(){
		super();
	}
	
	@Override
	public Profile save(Profile profile) {
		Profile newProfile =profileRepository.save(profile);
		return newProfile;
	}

	@Override
	public List<Profile> findAll() {
		return profileRepository.findAll();
	}

}
