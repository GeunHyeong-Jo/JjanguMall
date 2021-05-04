package com.saltlux.mysite.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.mysite.dto.CartDTO;
import com.saltlux.mysite.repository.CartRepository;


@Service
public class CartService {
	@Autowired
	private CartRepository cartRepository;

	public List<CartDTO> getCart(String userId) {
		return cartRepository.getCart(userId);
	}

	public int checkCart(CartDTO cartDTO) {
		return cartRepository.checkCart(cartDTO);
	}

	public void cartInsert(CartDTO cartDTO) {
		cartRepository.cartInsert(cartDTO);
	}

	public CartDTO getCartDTO(int cartCode) {
		return cartRepository.getCartDTO(cartCode);
	}

	public void deleteCart(Map<String, String> map) {
		cartRepository.deleteCart(map);
	}

	public void allDeleteCart(String userId) {
		cartRepository.allDeleteCart(userId);
	}

	public void cartUpdate(CartDTO cartDTO) {
		cartRepository.cartUpdate(cartDTO);
	}

	public void cartInsertUpdate(CartDTO cartDTO) {
		cartRepository.cartInsertUpdate(cartDTO);
	}

	public void deleteCartAfterPay(int cartCode) {
		cartRepository.deleteCartAfterPay(cartCode);
	}
}
