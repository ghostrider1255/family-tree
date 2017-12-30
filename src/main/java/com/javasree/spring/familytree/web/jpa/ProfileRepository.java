package com.javasree.spring.familytree.web.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.javasree.spring.familytree.model.profile.Profile;

public interface ProfileRepository extends JpaRepository<Profile, Long>{

}
