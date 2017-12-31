package com.javasree.spring.familytree.model.profile;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PROFILE")
public class Profile implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7441252273092957808L;
	@Id
	@Column(name="profileId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long profileId;
	private String profileName;
	private String firstName;
	private String lastName;
	private String gender;
	private Long parentId;
	
	public Long getProfileId() {
		return profileId;
	}
	public void setProfileId(Long profileId) {
		this.profileId = profileId;
	}
	public String getProfileName() {
		return profileName;
	}
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Long getParentId() {
		return parentId;
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	@Override
	public String toString(){
		return this.toString();
	}
}
