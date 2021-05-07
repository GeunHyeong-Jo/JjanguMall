package com.saltlux.jjangumall.repository.store;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.GoodsDTO;
import com.saltlux.jjangumall.dto.ProductDTO;

@Repository
public class StoreProductRepository {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;	

	//메인페이지 상품출력
	public List<ProductDTO> get_goods_list() {
		return sqlSession.selectList("product.get_goods_list");
	}
	
	//상품 상세페이지 정보 가져오기	
	public ProductDTO getGoodsView(int productCode) {
		return sqlSession.selectOne("product.getGoodsView", productCode);
	}

	public int getProductNo() {
		// TODO Auto-generated method stub
		if(sqlSession.selectOne("product.getProductNo")==null)
			return 0;
		else
			return sqlSession.selectOne("product.getProductNo");
	}

	public int productRegist(ProductDTO productDTO) {
		return sqlSession.insert("product.productRegist",productDTO);
	}

	public void productModify(ProductDTO productDTO) {
		sqlSession.update("product.productModify",productDTO);
	}

	public void productDelete(String productNo) {
		sqlSession.delete("product.productDelete",productNo);
	}

	public List<ProductDTO> get_store_list() {
		return sqlSession.selectList("product.get_store_list");
	}
}
