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
		return sqlSession.selectList("product.get_goods_list",null);
	}
	
	public List<ProductDTO> getProductByCategory(String category) {// 카테고리로 상품을 조회한다
		return sqlSession.selectList("product.getProductByCategory",category);
	}
	

	public ProductDTO getOneProduct(int pno) {//선택한 상품의 정보를 가져온다
		return sqlSession.selectOne("product.getGoodsView", pno);
	}

	public void registProduct(ProductDTO productDTO) { //상품등록
		sqlSession.insert("product.productRegist",productDTO);
		
	}

	public boolean modifyProduct(ProductDTO productDTO) { //상품 정보 수정
		int result = sqlSession.update("product.productModify", productDTO);
		return result ==1;
		
	}

	public void deleteProduct(int pno) {
		sqlSession.delete("product.productDelete", pno);
	}


}
