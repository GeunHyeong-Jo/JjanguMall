//package com.saltlux.calory.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.saltlux.jjangumall.dto.ExerciselistDTO;
//import com.saltlux.jjangumall.dto.UserDTO;
//import com.saltlux.jjangumall.repository.calory.ExerciseRepository;
//
//@Service
//public class ExerciseService {
//  @Autowired
//  private ExerciseRepository exerciseRepository;
//  
//  public List<ExerciselistDTO> findIdAllList(UserDTO vo) {
//    return this.exerciseRepository.findIdAllList(vo);
//  }
//  
//  public boolean insert(ExerciselistDTO vo) {
//    return this.exerciseRepository.insert(vo);
//  }
//  
//  public boolean delete(long no) {
//    return this.exerciseRepository.delete(no);
//  }
//  
//  public boolean update(ExerciselistDTO vo) {
//    return this.exerciseRepository.update(vo);
//  }
//  
//  public ExerciselistDTO findNo(long no) {
//    return this.exerciseRepository.findNo(no);
//  }
//  
//  public List<ExerciselistDTO> findListDays(UserDTO vo, long no) {
//    return this.exerciseRepository.findListDays(vo, no);
//  }
//  
//  public List<ExerciselistDTO> findListweeks(UserDTO vo, long no) {
//    return this.exerciseRepository.findListweeks(vo, no);
//  }
//}
