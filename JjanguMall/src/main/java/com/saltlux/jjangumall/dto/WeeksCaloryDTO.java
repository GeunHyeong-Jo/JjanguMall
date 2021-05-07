package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class WeeksCaloryDTO {
	private long Sunday = 0L;
	private long Monday = 0L;
	private long Tuesday = 0L;
	private long Wednesday = 0L;
	private long Thursday = 0L;
	private long Friday = 0L;
	private long Saturday = 0L;
}
