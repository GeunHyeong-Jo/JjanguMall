package com.saltlux.jjangumall.repository.com;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.CartDTO;
import com.saltlux.jjangumall.dto.com.CartAndProductDTO;

@Repository
public class ComCartRepository {

	@Autowired
	private SqlSession sqlSession;

	public List<CartAndProductDTO> getCart(String userID) {
		return sqlSession.selectList("cart.getCart", userID);
	}

	public CartAndProductDTO checkCart(String cartno) {
		return sqlSession.selectOne("cart.checkCart", cartno);
	}

	public void cartInsert(CartDTO cartDTO) {
		sqlSession.insert("cart.cartInsert", cartDTO);
	}

	public void deleteCart(String cartno) {
		sqlSession.delete("cart.deleteCart", cartno);
	}

	public void deleteAllCart(String userID) {
		sqlSession.delete("cart.deleteAllCart", userID);
		
	}

	public void setCartQTY(CartDTO cartDTO) {
		sqlSession.update("cart.setCartQTY", cartDTO);
		
	}

	public void changeCartQTY(Map<String, String> map) {
		sqlSession.update("cart.changeCartQTY", map);
		
	}

	

	
	
}
