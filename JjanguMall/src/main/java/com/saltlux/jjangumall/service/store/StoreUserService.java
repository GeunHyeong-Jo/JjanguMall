package com.saltlux.jjangumall.service.store;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.UserDTO;
import com.saltlux.jjangumall.repository.store.StoreUserRepository;


@Service
public class StoreUserService {

	@Autowired
	private StoreUserRepository storeUserRepository;

	public UserDTO checkId(String userId) {
		return storeUserRepository.checkId(userId);
	}

	public UserDTO checkEmail(String userEmail) {
		return storeUserRepository.checkEmail(userEmail);
	}

	public void join(UserDTO userDTO) {
		storeUserRepository.join(userDTO);
	}
	
	public void updateUserInfo(UserDTO userDTO) {
		storeUserRepository.updateUserInfo(userDTO);
	}
	public void modify(UserDTO dto) {
		storeUserRepository.modify(dto);
	}

	public void delete(String userId) {
		storeUserRepository.delete(userId);
	}

	public UserDTO getUser(UserDTO dto) {
		return storeUserRepository.getUser(dto);
	}	
	
	public UserDTO adminLogin(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return storeUserRepository.adminLogin(map);
	}

	public String getAuth(String userId) {
		return storeUserRepository.getAuth(userId);
	}
}
