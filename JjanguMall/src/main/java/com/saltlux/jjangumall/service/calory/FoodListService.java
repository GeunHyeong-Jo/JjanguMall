package com.saltlux.jjangumall.service.calory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.FoodlistDTO;
import com.saltlux.jjangumall.repository.calory.FoodListRepository;

@Service
public class FoodListService {
	@Autowired
	private FoodListRepository foodListRepository;

	public List<FoodlistDTO> findIdAllList(String vo) {
		return foodListRepository.findIdAllList(vo);
	}

	public boolean insert(FoodlistDTO vo) {
		return this.foodListRepository.insert(vo);
	}

	public boolean delete(int no) {
		return this.foodListRepository.delete(no);
	}

	public boolean update(FoodlistDTO vo) {
		return this.foodListRepository.update(vo);
	}

	public FoodlistDTO findNo(long no) {
		return this.foodListRepository.findNo(no);
	}

	public List<FoodlistDTO> findListDays(String vo, int no) {
		return this.foodListRepository.findListDays(vo, no);
	}

	public List<FoodlistDTO> findListweeks(String vo, int no) {
		return this.foodListRepository.findListweeks(vo, no);
	}
}
