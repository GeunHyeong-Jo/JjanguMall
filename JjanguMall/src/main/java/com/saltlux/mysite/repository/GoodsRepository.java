package com.saltlux.mysite.repository;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.GoodsDTO;

@Repository
public class GoodsRepository {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;	


	public List<GoodsDTO> get_goods_list_newP() {
		return sqlSession.selectList("goodsSQL.get_goods_list_newP");
	}
	
	//상품 상세페이지 정보 가져오기	
	public GoodsDTO getGoodsView(int productCode) {
		return sqlSession.selectOne("goodsSQL.getGoodsView", productCode);
	}

	public int productRegist(GoodsDTO goodsDTO) {
		return sqlSession.insert("goodsSQL.productRegist",goodsDTO);
	}

	public int getProductCode() {
		return sqlSession.selectOne("goodsSQL.getProductCode");
	}

	public void productModify(GoodsDTO goodsDTO) {
		sqlSession.update("goodsSQL.productModify",goodsDTO);
	}

	public void productDelete(String productCode) {
		sqlSession.delete("goodsSQL.productDelete",productCode);
	}

}
