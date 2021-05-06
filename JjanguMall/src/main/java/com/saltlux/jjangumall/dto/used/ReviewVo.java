package com.saltlux.jjangumall.dto.used;

public class ReviewVo {
	
	private Long no;
	private Long point;
	private String review;
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getPoint() {
		return point;
	}
	public void setPoint(Long point) {
		this.point = point;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	
	@Override
	public String toString() {
		return "ReviewVo [no=" + no + ", point=" + point + ", review=" + review + "]";
	}
	
	

	
}
