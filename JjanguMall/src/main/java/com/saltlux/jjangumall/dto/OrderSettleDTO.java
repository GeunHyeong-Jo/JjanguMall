package com.saltlux.jjangumall.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class OrderSettleDTO {
	
	private String userName;
	private String userPhone;
	private String userEmail;
	private String rName;
	private String rZipcode;
	private String receiverAddr1;
	private String receiverAddr2;
	private String rPhone;
	private String checkedValueStr;
	private int totalPrice;

}

