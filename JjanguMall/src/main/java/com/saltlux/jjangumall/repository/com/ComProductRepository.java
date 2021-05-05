package com.saltlux.jjangumall.repository.com;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.ProductDTO;

@Repository
public class ComProductRepository {

	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> getAllProduct() { //전체 상품정보의 정보를 가져온다
		return sqlSession.selectList("product.getAllProduct",null);
	}

	public ProductDTO getOneProduct(int pno) {
		return sqlSession.selectOne("product.getOneProduct", pno);
	}
	
	
}
