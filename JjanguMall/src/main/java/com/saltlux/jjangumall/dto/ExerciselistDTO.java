package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class ExerciselistDTO {
	private int exerciseListNo; 	//번호
	private String user_no;//유저 번호
	private int exerciseNo;//운동 번호
	private int Time;//운동 시간
}
