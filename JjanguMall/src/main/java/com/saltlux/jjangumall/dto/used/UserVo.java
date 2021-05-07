package com.saltlux.jjangumall.dto.used;

public class UserVo {
	
	private String userId;
	private String password;
	private String userName;
	private String region;
	private Double avgPoint;
	private String role;
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
		return "UserVo [userId=" + userId + ", password=" + password + ", userName=" + userName + ", region=" + region
				+ ", avgPoint=" + avgPoint + ", role=" + role + "]";
	}
	
	
	
	
	
}
