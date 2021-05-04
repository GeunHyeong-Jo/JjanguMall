package com.saltlux.mysite.repository;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.dto.OrderDTO;
import com.saltlux.mysite.dto.OrderlistDTO;

@Repository
public class OrderRepository {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private DataSource dataSource;

	public int setOrderInfo(OrderDTO orderDTO) {
		return sqlSession.insert("orderSQL.setOrderInfo", orderDTO);
	}

	public List<OrderlistDTO> getOrderListInfo(String userId) {
		return sqlSession.selectList("orderSQL.getOrderListInfo",userId);
	}

	public void reduceSaleProduct(Map<String, Object> map) {
		sqlSession.update("orderSQL.reduceSaleProduct",map);
	}

	public void orderCancel(String userId) {
		sqlSession.delete("orderSQL.orderCancel",userId);
	}

	public List<OrderDTO> getOrderProduct(String userId) {
		return sqlSession.selectList("orderSQL.getOrderProduct",userId);
	}

	public int insertOrderlist(Map<String, Object> map) {
		return sqlSession.insert("orderSQL.insertOrderlist",map);
	}

	public List<OrderlistDTO> getOrderListAllInfo() {
		return sqlSession.selectList("orderSQL.getOrderListAllInfo");
	}

	public void OrderReady(Map<String, Object> map) {
		sqlSession.update("orderSQL.OrderReady",map);
	}

	public int getOrderListCode() {
		return sqlSession.selectOne("orderSQL.getOrderListCode");
	}

	public List<OrderDTO> getOrder(String orderCode) {
		return sqlSession.selectList("orderSQL.getOrder",orderCode);
	}	

}
