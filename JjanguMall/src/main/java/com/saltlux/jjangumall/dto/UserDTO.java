package com.saltlux.jjangumall.dto;


import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class UserDTO {

	private String userId; 		//유저아이디
	private String userName;	//유저이름
	private String password;    //비밀번호
	private String gender;		//성별
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date reg_date;		//가입일
	private String email;		//유저이메일
	private String cellNumber;  //유저전화번호
	private int totalCalory;	//총 칼로리??
	private String auth;		//권한(사용자인지, 관리자인지)
	
}
