package com.saltlux.jjangumall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.CartDTO;
import com.saltlux.jjangumall.dto.com.CartAndProductDTO;

@Repository
public class CartRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<CartAndProductDTO> getCart(String userId) {
		return sqlSession.selectList("cartSQL.getCart",userId);
	}

	public int checkCart(CartDTO cartDTO) {
		return sqlSession.selectOne("cartSQL.checkCart", cartDTO);
	}

	public void cartInsert(CartDTO cartDTO) {
		sqlSession.insert("cartSQL.cartInsert", cartDTO);
	}

	public CartAndProductDTO getCartDTO(int cartCode) {
		return sqlSession.selectOne("cartSQL.getCartDTO",cartCode);
	}

	public void deleteCart(CartDTO cartDTO) {
		sqlSession.delete("cartSQL.deleteCart",cartDTO);
	}

	public void allDeleteCart(String userId) {
		sqlSession.delete("cartSQL.allDeleteCart",userId);
	}


	public void cartInsertUpdate(CartDTO cartDTO) {
		sqlSession.update("cartSQL.cartInsertUpdate",cartDTO);
	}

	
	public void deleteAfterBuyCart(String carNo) {
		sqlSession.delete("cartSQL.deleteAfterBuyCart",carNo);
	}	

}
