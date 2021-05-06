package com.saltlux.jjangumall.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.jjangumall.dto.GoodsDTO;
import com.saltlux.jjangumall.dto.ProductDTO;
import com.saltlux.jjangumall.repository.store.StoreProductRepository;

@Service
public class StoreProductService {
	
	@Autowired
	private StoreProductRepository StoreProductRepository;

	public List<ProductDTO> get_goods_list() {
		return StoreProductRepository.get_goods_list();
	}

	public ProductDTO getGoodsView(int parseInt) {
		return StoreProductRepository.getGoodsView(parseInt);
	}

}
