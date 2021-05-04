package com.saltlux.jjangumall.service.used;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.used.TradeVo;
import com.saltlux.jjangumall.repository.used.TradeRepository;

@Service
public class TradeService {
	
	
	@Autowired
	TradeRepository tradeRepository;
	
	public int apply(TradeVo vo) {
		
		return tradeRepository.apply(vo);
	}

	public int cancle(Long no) {
		// TODO Auto-generated method stub
		return tradeRepository.cancle(no);
	}

	public int sucsess(Long no) {
		// TODO Auto-generated method stub
		return tradeRepository.succsess(no);
	}
}
