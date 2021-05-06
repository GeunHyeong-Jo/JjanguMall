package com.saltlux.jjangumall.dto.used;

public class TradeVo {

	
	private Long no;
	private Long itemNo;
	private String sellerId;
	private String buyerId;
	private String title;
	private Long status;
	private Long point;
	private String review;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getItemNo() {
		return itemNo;
	}
	public void setItemNo(Long itemNo) {
		this.itemNo = itemNo;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
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
		return "TradeVo [no=" + no + ", itemNo=" + itemNo + ", sellerId=" + sellerId + ", buyerId=" + buyerId
				+ ", title=" + title + ", status=" + status + ", point=" + point + ", review=" + review + "]";
	}
	
	
	
	
	
	
	
	
}
