package com.saltlux.jjangumall.dto;

import lombok.Data;

import org.springframework.stereotype.Component;

@Component
@Data
public class ExerciseAndExerciseListDTO {
	private ExerciselistDTO exerciselistDTO;
	private ExerciseDTO exerciseDTO;
}
