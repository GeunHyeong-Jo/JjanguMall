package com.saltlux.mysite.dto;


import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class UserDTO {
	
	private String userId; 		//유저아이디
	private String userPwd; 	//유저비밀번호 - 스프링시큐리티로 들어감
	private String userName;	//유저이름
	private String userEmail;	//유저이메일
	private String userPhone;   //유저전화번호
	private int productInCart;	//장바구니물건수 - 굳이,,,필요없음,,,
	private String receiverName;	//받는사람이름
	private String receiverZipcode;	//받는사람우편번호
	private String receiverAddr1,receiverAddr2;	//받는사람주소
	private String receiverPhone;	//받는사람전화번호
	private String deliveryOption;	//배달옵션
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date joinDate;			//가입일
	private int totalPayment; //총구매액 - 없어도됨....
}
