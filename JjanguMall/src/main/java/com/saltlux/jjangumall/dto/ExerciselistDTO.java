package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class ExerciselistDTO {
	private int no; 	//번호
	private String user_no;//유저 번호
	private int Ex_no;//운동 번호
	private int Time;//운동 시간
}
