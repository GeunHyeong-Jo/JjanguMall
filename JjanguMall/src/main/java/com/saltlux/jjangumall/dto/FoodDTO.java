package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FoodDTO {

	private int no;//번호
	private String name;//이름
	private int calory;//칼로리
}
