package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FoodlistDTO {

	private int foodListNo;			//번호
	private String user_no;	//유저번호
	private int food_no;	//음식 번호
	private String eat_time; //'morning','lunch','evening' //먹은시간
}
