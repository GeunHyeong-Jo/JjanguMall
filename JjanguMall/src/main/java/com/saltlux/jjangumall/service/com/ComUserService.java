package com.saltlux.jjangumall.service.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.repository.UserRepository;
@Service
public class ComUserService {
	
	@Autowired
	private UserRepository userRepository;
}
