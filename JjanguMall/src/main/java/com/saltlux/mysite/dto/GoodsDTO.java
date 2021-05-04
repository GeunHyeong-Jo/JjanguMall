package com.saltlux.mysite.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class GoodsDTO {
	private int productCode;
	private String productName;
	private int originPrice;
	private int discountPrice;
	private String origin;
	private String manufacturer;
	private String thumbImg;
	private int totalQty;
	private int stockQty;
	private int saleQty;
	private int addQty;
	private int saleStatus;//판매되고있는지여부
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date regDate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date updateDate;
	private int stationery;
	private int living;
	private int travel;
	private int discount;
	private int best;
	private int newP;
	private int deliveryFee;
}
