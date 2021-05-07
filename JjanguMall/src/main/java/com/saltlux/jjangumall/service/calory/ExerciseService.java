package com.saltlux.jjangumall.service.calory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.ExerciseDTO;
import com.saltlux.jjangumall.dto.ExerciselistDTO;
import com.saltlux.jjangumall.repository.calory.ExerciseRepository;

@Service
public class ExerciseService {
	@Autowired
	private ExerciseRepository exerciseRepository;

	public ExerciseDTO findNo(int exerciseNo) {
		return exerciseRepository.findNo(exerciseNo);
	}

	public int findName(String name) {
		return exerciseRepository.findName(name);
	}
}
