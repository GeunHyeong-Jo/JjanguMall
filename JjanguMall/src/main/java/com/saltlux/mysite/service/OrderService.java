package com.saltlux.mysite.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.dto.OrderDTO;
import com.saltlux.mysite.dto.OrderlistDTO;
import com.saltlux.mysite.repository.OrderRepository;

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
