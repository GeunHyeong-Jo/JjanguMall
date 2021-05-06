package com.saltlux.jjangumall.dto.com;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class OrderlistAndProductDTO {
	
	private int odrderdetailNo;		//주문 상세번호
	private int productNo;	// 상품 번호	
	private int orderNo;	//주문 번호
	private int oderNo;	//이미지 번호
	private int count;	//수량
	private int price;		//상품 각겨
	private String origin;	//원산지
	private String manufacturer;	//제조사
	private int img;	//이미지
	private int totalQty;	//총수량
	private int saleQty;	//판매량
	private int stockQty;	//재고량
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date reg_date;	//등록일
	private String context;	//상세설명
	private String socket;	//소켓
}

