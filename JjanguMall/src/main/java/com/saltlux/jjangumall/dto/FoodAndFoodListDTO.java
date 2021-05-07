package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class FoodAndFoodListDTO {

	private FoodlistDTO foodlistDTO;
	private FoodDTO foodDTO;

}
