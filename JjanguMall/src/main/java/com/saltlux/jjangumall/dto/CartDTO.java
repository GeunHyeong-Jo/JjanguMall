package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class CartDTO {
	private int carNo; 	//카트 번호
	private int productNo;//상품 번호
	private int imgNo;	//이미지 번호
	private String userID;//유저ID
	private int count;	// 갯수
}
