package com.saltlux.jjangumall.service.used;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.used.TradeVo;
import com.saltlux.jjangumall.dto.used.UserVo;
import com.saltlux.jjangumall.repository.used.UsedUserRepository;

@Service
public class UsedUserService {

	@Autowired
	UsedUserRepository userRepository;

	public int signUp(UserVo vo) {

		return userRepository.signUp(vo);
	}

	public UserVo login(UserVo vo) {

		return userRepository.findByIdAndPassword(vo);
	}

	public UserVo getUserById(String id) {

		return userRepository.findById(id);
	}

	public String getRole(String id) {

		return userRepository.getRole(id);
	}

	public UserVo seller(String id) {

		UserVo vo = userRepository.seller(id);
		vo.setAvgPoint(userRepository.sellerPoint(id));
		return vo;
	}
	
	public List<TradeVo> tradeList(String id) {
		
		return userRepository.tradeList(id);
	}

}
