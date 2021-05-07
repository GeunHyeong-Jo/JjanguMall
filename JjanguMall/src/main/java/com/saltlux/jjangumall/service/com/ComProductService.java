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
	
	public List<ProductDTO> getProductByCategory(String category) { //상품정보를 카테고리별로 가져온다
		return productRepository.getProductByCategory(category);
	
	}
	
	public ProductDTO getOneProduct(int pno) {//선택한 상품의 정보를 가져온다
		return productRepository.getOneProduct(pno);
	}
	
	public void registProduct(ProductDTO productDTO) { //상품등록
		// 넣어야할 데이터
		//name, price, origin, manufacturer, img, totalQty, context, socket, category 
		productRepository.registProduct(productDTO);
	}
	
	public boolean modifyProduct(ProductDTO productDTO) {//상품 정보 수정
		//상품번호, 등록일 제외하고 넣어야 한다
		return productRepository.modifyProduct(productDTO);
	}
	public void deleteProduct(int pno) {
		productRepository.deleteProduct(pno);
		
	}
}
