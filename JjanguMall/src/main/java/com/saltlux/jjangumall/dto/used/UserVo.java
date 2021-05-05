package com.saltlux.jjangumall.dto.used;

public class UserVo {
	
	private String id;
	private String password;
	private String name;
	private String region;
	private Double avgPoint;
	private String role;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name; 
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Double getAvgPoint() {
		return avgPoint;
	}
	public void setAvgPoint(Double avgPoint) {
		this.avgPoint = avgPoint;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "UserVo [id=" + id + ", password=" + password + ", name=" + name + ", region=" + region + ", avgPoint="
				+ avgPoint + ", role=" + role + "]";
	}
	
	
	
	
	
	
	
	
}
