package com.saltlux.jjangumall.dto.used;

public class ImageVo {
	
	private Long no;
	private Long boardNo;
	Long imgNo;
	
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public Long getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Long boardNo) {
		this.boardNo = boardNo;
	}
	public Long getImgNo() {
		return imgNo;
	}
	public void setImgNo(Long imgNo) {
		this.imgNo = imgNo;
	}
	
	
	@Override
	public String toString() {
		return "ImageVo [no=" + no + ", boardNo=" + boardNo + ", imgNo=" + imgNo + "]";
	}
	
	
	

}
