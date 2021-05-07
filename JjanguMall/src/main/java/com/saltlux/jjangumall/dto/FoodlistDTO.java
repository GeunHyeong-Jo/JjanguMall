package com.saltlux.jjangumall.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class FoodlistDTO {

	private int foodListNo;			//번호
	private String userNo;	//유저번호
	private int foodNo;	//음식 번호
	private String eatTime; //'morning','lunch','evening' //먹은시간
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date reg_date;		//가입일
}
