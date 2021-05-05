package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderlistDTO {
	
	private int no;		//주문 상세번호
	private int productNo;	// 상품 번호	
	private int orderNo;	//주문 번호
	private int no2;	//이미지 번호
	private int count;	//수량
	
}

