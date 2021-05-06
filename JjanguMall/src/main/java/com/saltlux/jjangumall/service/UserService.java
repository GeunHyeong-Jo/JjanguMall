package com.saltlux.jjangumall.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.UserDTO;

import com.saltlux.jjangumall.repository.store.StoreUserRepository;

@Service
public class UserService {

	@Autowired
	private StoreUserRepository userRepository;



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

	public void addCartCount(String userId) {
		userRepository.addCartCount(userId);
	}

	public void subCartCount(String userId) {
		userRepository.subCartCount(userId);
	}

	public void allDeleteCartCount(String userId) {
		userRepository.allDeleteCartCount(userId);
	}

	public void modify(Map<String, String> map) {
		userRepository.modify(map);
	}

	public void memberDelete(Map<String, String> map) {
		userRepository.memberDelete(map);
	}

	public UserDTO getUser(UserDTO userDTO) {
		return userRepository.getUser(userDTO);

	}
	
}
