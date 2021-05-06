package com.saltlux.jjangumall.service.com;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.repository.com.ComCartRepository;
@Service
public class ComOrderService {
	
	@Autowired
	private ComCartRepository cartRepository;
}
