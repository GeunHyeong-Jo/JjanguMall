package com.saltlux.jjangumall.dto.used;

public class ItemDetailVo {

	private Long no;
	private String userId;
	private String name;
	private String title;
	private String contents;
	private String date;
	private String region;
	private Double avgPoint;
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	@Override
	public String toString() {
		return "ItemDetailVo [no=" + no + ", userId=" + userId + ", name=" + name + ", title=" + title + ", contents="
				+ contents + ", date=" + date + ", region=" + region + ", avgPoint=" + avgPoint + "]";
	}
	
	

	
	
	
}
