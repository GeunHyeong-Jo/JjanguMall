package com.saltlux.jjangumall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.CartDTO;
import com.saltlux.jjangumall.dto.com.CartAndProductDTO;
import com.saltlux.jjangumall.repository.CartRepository;


@Service
public class CartService {
	@Autowired
	private CartRepository cartRepository;

	public List<CartAndProductDTO> getCart(String userId) {
		return cartRepository.getCart(userId);
	}

	public int checkCart(CartDTO cartDTO) {
		return cartRepository.checkCart(cartDTO);
	}

	public void cartInsert(CartDTO cartDTO) {
		cartRepository.cartInsert(cartDTO);
	}

	public CartAndProductDTO getCartDTO(int cartCode) {
		return cartRepository.getCartDTO(cartCode);
	}

	public void deleteCart(CartDTO cartDTO) {
		cartRepository.deleteCart(cartDTO);
	}

	public void allDeleteCart(String userId) {
		cartRepository.allDeleteCart(userId);
	}

	
	public void cartInsertUpdate(CartDTO cartDTO) {
		cartRepository.cartInsertUpdate(cartDTO);
	}

	
	public void deleteAfterBuyCart(String carNo) {
		cartRepository.deleteAfterBuyCart(carNo);
	}
}
