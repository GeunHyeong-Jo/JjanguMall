package com.saltlux.mysite.repository;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.CartDTO;

@Repository
public class CartRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;

	public List<CartDTO> getCart(String userId) {
		return sqlSession.selectList("cartSQL.getCart",userId);
	}

	public int checkCart(CartDTO cartDTO) {
		return sqlSession.selectOne("cartSQL.checkCart", cartDTO);
	}

	public void cartInsert(CartDTO cartDTO) {
		sqlSession.insert("cartSQL.cartInsert", cartDTO);
	}

	public CartDTO getCartDTO(int cartCode) {
		return sqlSession.selectOne("cartSQL.getCartDTO",cartCode);
	}

	public void deleteCart(Map<String, String> map) {
		sqlSession.delete("cartSQL.deleteCart",map);
	}

	public void allDeleteCart(String userId) {
		sqlSession.delete("cartSQL.allDeleteCart",userId);
	}

	public void cartUpdate(CartDTO cartDTO) {
		sqlSession.update("cartSQL.cartUpdate",cartDTO);
	}

	public void cartInsertUpdate(CartDTO cartDTO) {
		sqlSession.update("cartSQL.cartInsertUpdate",cartDTO);
	}

	public void deleteCartAfterPay(int cartCode) {
		sqlSession.delete("cartSQL.deleteCartAfterPay",cartCode);
	}	

}
