package com.saltlux.jjangumall.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	
	
	private int orderNo;			//주문 번호
	private int totalPrice;	//총 가격
	private String userID; //유저ID
	private String rAddress;// 받는 사람 주소
	private String rPhone;	//받는 사람 전화번호
	private String rName; //수령인
	private String rZipcode; //우편번호
	private String state;	//배송상태
	private Date orderDate;//  주문일
	
	
}

