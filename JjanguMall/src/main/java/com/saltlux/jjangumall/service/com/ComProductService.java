package com.saltlux.jjangumall.service.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.ProductDTO;
import com.saltlux.jjangumall.repository.com.ComProductRepository;
@Service
public class ComProductService {
	
	@Autowired
	private ComProductRepository productRepository;

	public List<ProductDTO> getAllProduct() {
		return productRepository.getAllProduct(); //전체 상품정보의 정보를 가져온다
	
	}
	
	public ProductDTO getOneProduct(int pno) {
		return productRepository.getOneProduct(pno);
	}
	
}
