package com.saltlux.jjangumall.service.calory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.ExerciselistDTO;
import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.repository.calory.ExerciseListRepository;
import com.saltlux.jjangumall.repository.calory.ExerciseRepository;

@Service
public class ExerciseListService {
	@Autowired
	private ExerciseListRepository exerciseListSRepository;

	public List<ExerciselistDTO> findIdAllList(String vo) {
		return exerciseListSRepository.findIdAllList(vo);
	}

	public boolean insert(ExerciselistDTO vo) {
		return exerciseListSRepository.insert(vo);
	}

	public boolean delete(long no) {
		return this.exerciseListSRepository.delete(no);
	}

	public boolean update(ExerciselistDTO vo) {
		return this.exerciseListSRepository.update(vo);
	}
//  
//  public ExerciselistDTO findNo(long no) {
//    return this.exerciseRepository.findNo(no);
//  }
//  
  public List<ExerciselistDTO> findListDays(String vo, long no) {
    return this.exerciseListSRepository.findListDays(vo, no);
  }

  public List<ExerciselistDTO> findListweeks(String vo, long no) {
    return this.exerciseListSRepository.findListweeks(vo, no);
  }
}
