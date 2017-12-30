package com.javasree.spring.familytree.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasree.spring.familytree.model.profile.Profile;
import com.javasree.spring.familytree.web.dao.impl.ProfileDaoImpl;
import com.javasree.spring.familytree.web.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	private ProfileDaoImpl profileDao;

	@Override
	public void save(Profile profile) {
		profileDao.save(profile);
	}

}
