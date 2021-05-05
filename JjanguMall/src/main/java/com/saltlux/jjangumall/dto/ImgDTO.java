package com.saltlux.jjangumall.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ImgDTO {

	private int imgNo;		//이미지 번호
	private int productNo; // 상품 번호

}
