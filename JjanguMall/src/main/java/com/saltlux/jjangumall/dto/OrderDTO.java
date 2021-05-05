package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	
	
	private int no;			//주문 번호
	private int totalPrice;	//총 가격
	private String userID; //유저ID
	private String rAddress;// 받는 사람 주소
	private String rPhone;	//받는 사람 전화번호
	private String rName; //수령인
	private String rZipcode; //우편번호
	private String state;	//배송상태
	//private Date time;//  주문 시간 // 이게 필요하지 않나 생각됨
	
	
}

