package com.saltlux.mysite.dto;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class CartDTO {
	private int cartCode;//카트번호
	private String userId; //유저아이디
	private String userEmail;//유저이메일
	private int productCode;//상품번호
	private String productName;//상품이름
	private String thumbImg;//썸네일
	private int discountPrice; //가격
	private int productQty; //장바구니에 담은 상품수량
}
