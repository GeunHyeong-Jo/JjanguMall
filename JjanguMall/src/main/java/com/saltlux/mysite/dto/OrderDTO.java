package com.saltlux.mysite.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Component
@Data
public class OrderDTO {
	private String orderCode;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date orderDate;
	private String userId; 
	private String userName;
	private String thumbImg; 
	private int productCode;
	private String productName;
	private int discountPrice;
	private int purchaseQty; 		// 상품구매수량
	private int totalPrice;			// discountPrice*purchaseQty
	private int paymentType; 		// 0:신용카드 / 1:핸드폰
	private int totalPayment; 		// 해당주문번호에 대한 총 결제금액
	private int orderState;			//0 : 주문취소 1 : 주문접수 2 : 배송준비 3 : 배송중 4 : 배송완료 5 : 주문완료
	private int cancel;				//취소여부  0 : 취소미신청 / 1 : 취소신청(취소는 신청과 동시에 자동 완료됨 / 전체취소만 됨)
	private int cancelQty; 			//취소상품개수
	private int cancelAmount;		//취소 총금액
	private int exchange; 			//교환여부
	private int exchangeQty; 		//교환상품개수
	private int refund;				//환불여부
	private int refundQty;			//환불상품개수
	private int refundAmount; 		//환불금액
}

