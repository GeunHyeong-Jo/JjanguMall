package com.saltlux.jjangumall.service.calory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.FoodDTO;
import com.saltlux.jjangumall.repository.calory.FoodRepository;

@Service
public class FoodService {

	@Autowired
	private FoodRepository foodRepository;

	public FoodDTO findNo(int foodNo) {
		return foodRepository.findNo(foodNo);
	}

	public int findName(String name) {
		// TODO Auto-generated method stub
		return foodRepository.findName(name);
		
	}
}
