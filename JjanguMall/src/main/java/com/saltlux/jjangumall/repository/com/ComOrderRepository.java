package com.saltlux.jjangumall.repository.com;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.OrderDTO;
import com.saltlux.jjangumall.dto.com.OrderlistAndProductDTO;

@Repository
public class ComOrderRepository {

	@Autowired
	private SqlSession sqlSession;

	public List<OrderDTO> getOrder(String userID) {
		return sqlSession.selectList("order.getOrder", userID);
		
	}
	public List<OrderDTO> getAllOrder() {
		return sqlSession.selectList("order.getAllOrder");
	}
	public List<OrderlistAndProductDTO> getOrderList(Map<String, String> map) {
		return sqlSession.selectList("order.getOrderList", map);
	}
	public List<OrderlistAndProductDTO> getAllOrderList() {
		return sqlSession.selectList("order.getAllOrderList");
	}
	public void addOrder(OrderDTO orderDTO) {
		sqlSession.insert("order.addOrder",orderDTO);
		
	}
	public void cancelOrder(int orderNo) {
		sqlSession.delete("order.cancelOrder", orderNo);
		
	}
	public void changeOrderState(Map<String, String> map) {
		sqlSession.update("order.changeOrderState", map);
		
	}
	
	
	
}
