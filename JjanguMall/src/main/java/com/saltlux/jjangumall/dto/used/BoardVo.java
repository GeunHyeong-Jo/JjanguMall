package com.saltlux.jjangumall.dto.used;

public class BoardVo {
	
	private Long no;
	private String userId;
	private String title;
	private String contents;
	private String region;
	private Long status;
	
	
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
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	
	
	@Override
	public String toString() {
		return "BoardVo [no=" + no + ", userId=" + userId + ", title=" + title + ", contents=" + contents + ", region="
				+ region + ", status=" + status + "]";
	}
	

}
