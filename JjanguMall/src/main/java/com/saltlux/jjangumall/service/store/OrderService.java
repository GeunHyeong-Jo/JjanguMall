package com.saltlux.jjangumall.service.store;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.store.GoodsDTO;
import com.saltlux.jjangumall.dto.store.OrderDTO;
import com.saltlux.jjangumall.dto.store.OrderlistDTO;
import com.saltlux.jjangumall.repository.store.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;

	public int setOrderInfo(OrderDTO orderDTO) {
		return orderRepository.setOrderInfo(orderDTO);
	}

	public List<OrderlistDTO> getOrderListInfo(String userId) {
		return orderRepository.getOrderListInfo(userId);
	}

	public void reduceSaleProduct(Map<String, Object> map) {
		orderRepository.reduceSaleProduct(map);
	}

	public void orderCancel(String userId) {
		orderRepository.orderCancel(userId);
	}

	public List<OrderDTO> getOrderProduct(String userId) {
		return orderRepository.getOrderProduct(userId);
	}

	public int insertOrderlist(Map<String, Object> map) {
		return orderRepository.insertOrderlist(map);
	}

	public List<OrderlistDTO> getOrderListAllInfo() {
		return orderRepository.getOrderListAllInfo();
	}

	public void OrderReady(Map<String, Object> map) {
		orderRepository.OrderReady(map);
	}

	public int getOrderListCode() {
		return orderRepository.getOrderListCode();
	}

	public List<OrderDTO> getOrder(String orderCode) {
		return orderRepository.getOrder(orderCode);
	}
	
}
