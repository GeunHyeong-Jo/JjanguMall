package com.saltlux.jjangumall.service.com;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.OrderDTO;
import com.saltlux.jjangumall.dto.OrderlistDTO;
import com.saltlux.jjangumall.dto.com.OrderlistAndProductDTO;
import com.saltlux.jjangumall.repository.com.ComOrderRepository;

@Service
public class ComOrderService {

	@Autowired
	private ComOrderRepository orderRepository;

	// 주문 조회
	// SELECT * FROM orders WHERE `userID`=#{userID } order by orderNo DESC
	public List<OrderDTO> getOrder(String userID) {
		return orderRepository.getOrder(userID);
	}

	// 관리자의 전체 주문조회
	public List<OrderDTO> getAllOrder() {
		return orderRepository.getAllOrder();
	}

	// id와 orderNo에 따른 주문 상세내역 조회 (해당 주문번호를 눌렀을때 상세 내역을 볼수있다)
	public List<OrderlistAndProductDTO> getOrderList(String userID, String orderNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userID", userID);
		map.put("orderNo", orderNo);
		return orderRepository.getOrderList(map);

	}

	// 관리자의 전체 주문 상세 조회
	public List<OrderlistAndProductDTO> getAllOrderList() {
		return orderRepository.getAllOrderList();
	}

	public void addOrder(OrderDTO orderDTO) {// 주문추가(날짜는 now로 들어감)
		orderRepository.addOrder(orderDTO);
	}

	public void cancelOrder(int orderNo) { // 주문 취소
		orderRepository.cancelOrder(orderNo);
	}

	public void chageOrderState(String state, int orderNo) { // 주문 상태변경(관리자)

		Map<String, String> map = new HashMap<String, String>();
		map.put("state", state);
		map.put("orderNo", Integer.toString(orderNo));
		orderRepository.changeOrderState(map);
	}

	public OrderDTO getOneOrder(String userId, String orderNo) { //주문번호에 따른 DTO 하나 반환
		Map<String, String> map = new HashMap<String, String>();
		map.put("userID", userId);
		map.put("orderNo", orderNo);
		
		return orderRepository.getOneOrder(map);
	}

	public String getMaxOrderNo(String userId) {
		return orderRepository.getMaxOrderNo(userId);
	}

	public void addOrderlist(OrderlistDTO orderlistDTO) {
		orderRepository.addOrderlist(orderlistDTO);
	}
}
