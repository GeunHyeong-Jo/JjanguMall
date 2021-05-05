package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class ExerciseDTO {
	private int no; //번호
	private String name;//운동기구
	private int calory;//소모 칼로리
}
