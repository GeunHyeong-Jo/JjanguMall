package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class EatTimeDTO {
	private long Morning = 0L;
	private long Lunch = 0L;
	private long Evening = 0L;
}
