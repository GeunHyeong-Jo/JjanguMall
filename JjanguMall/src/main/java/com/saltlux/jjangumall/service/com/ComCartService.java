package com.saltlux.jjangumall.service.com;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.CartDTO;
import com.saltlux.jjangumall.dto.com.CartAndProductDTO;
import com.saltlux.jjangumall.repository.com.ComCartRepository;
@Service
public class ComCartService {
	
	@Autowired
	private ComCartRepository cartRepository;
	
	public List<CartAndProductDTO> getCart(String userID) {
		// 사용자의 아이디를 통한 장바구니번호순 정리
		return cartRepository.getCart(userID);
	}

	public CartAndProductDTO checkCart(String cartno) {
		//선택한 장바구니 상세정보
		return cartRepository.checkCart(cartno);
	}

	public void cartInsert(CartDTO cartDTO) {
		//장바구니 추가  (`productNo`, `imgNo`, `userID`, `count`)넣어주면 됩니다
		cartRepository.cartInsert(cartDTO);
	}

	public void deleteCart(String cartno) {
		//선택한 장바구니 삭제
		cartRepository.deleteCart(cartno);
	}
	
	public void deleteAllCart(String userID) {
		//유저의 장바구니 전체 삭제
		cartRepository.deleteAllCart(userID);
	}
	
	
	public void setCartQTY(CartDTO cartDTO) {
		//UPDATE cart  SET `count`='1'  WHERE  carNo=2 AND productNo=1
		//선택한 카트의 제품의 수량을 변경
		cartRepository.setCartQTY(cartDTO);
	}
	
	public void changeCartQTY(CartDTO cartDTO, int count) {
		//장바구니에 있는 물품 추가 수정
		//update cart SET `count` =`count`+5 where userID = "조" and productNo = 1 and carNo=2
		Map<String, String> map= new HashMap<String, String>();
		map.put("count", Integer.toString(count));
		map.put("userID", cartDTO.getUserID());
		map.put("productNo",  Integer.toString(cartDTO.getProductNo()));
		map.put("carNo",  Integer.toString(cartDTO.getCarNo()));
		cartRepository.changeCartQTY(map);
	}
	
}
