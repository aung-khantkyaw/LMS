package com.Entity;

public class Users {

	@Override
	public String toString() {
		return "Users [Id=" + Id + ", username=" + username + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", profile=" + profile + ", password=" + password + ", registration_date=" + registration_date + "]";
	}

	public Users(String id, String username, String phone, String email, String address, String profile, String password, String registration_date) {
		super();
		Id = id;
		this.username = username;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.profile = profile;
		this.password = password;
		this.registration_date = registration_date;
	}
	
	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}


	private String Id;
	private String username;
	private String phone;
	private String email;
	private String address;
	private String profile;
	private String password;
	private String registration_date;
	
}
