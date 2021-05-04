package com.saltlux.mysite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.saltlux.mysite.dto.GoodsDTO;
import com.saltlux.mysite.repository.GoodsRepository;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsRepository goodsRepository;

	public List<GoodsDTO> get_goods_list_newP() {
		return goodsRepository.get_goods_list_newP();
	}

	public GoodsDTO getGoodsView(int parseInt) {
		return goodsRepository.getGoodsView(parseInt);
	}

	public int productRegist(GoodsDTO goodsDTO) {
		return goodsRepository.productRegist(goodsDTO);
	}

	public int getProductCode() {
		return goodsRepository.getProductCode();
	}

	public void productModify(GoodsDTO goodsDTO) {
		goodsRepository.productModify(goodsDTO);
	}

	public void productDelete(String productCode) {
		goodsRepository.productDelete(productCode);
	}

	

}
