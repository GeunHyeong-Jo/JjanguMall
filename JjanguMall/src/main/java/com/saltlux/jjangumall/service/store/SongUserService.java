package com.saltlux.jjangumall.service.store;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.repository.store.SongUserRepository;

@Service
public class SongUserService {

	@Autowired
	private SongUserRepository userRepository;



	public UserDTO checkId(String userId) {
		return userRepository.checkId(userId);
	}

	public UserDTO checkEmail(String userEmail) {
		return userRepository.checkEmail(userEmail);
	}

	public void join(UserDTO userDTO) {
		userRepository.join(userDTO);
	}
	
	public void updateUserInfo(UserDTO userDTO) {
		userRepository.updateUserInfo(userDTO);
	}
	public void modify(UserDTO dto) {
		userRepository.modify(dto);
	}

	public void delete(String userId) {
		userRepository.delete(userId);
	}

	public UserDTO getUser(UserDTO dto) {
		return userRepository.getUser(dto);
	}	
	
	
}
