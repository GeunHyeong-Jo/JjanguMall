use minidb;

-- TBL_ORDER
ALTER TABLE TBL_ORDER
	DROP PRIMARY KEY; -- TBL_user 기본키

-- TBL_ORDER
DROP TABLE IF EXISTS TBL_ORDER;

create table TBL_ORDER(
			orderCode int 
			,orderDate Date
			,userId  varchar(35)
			,userName varchar(30)
			,thumbImg varchar(50)
			,productCode int
			,productName varchar(100)
			,discountPrice int
			,purchaseQty int 		-- 상품구매수량
			,totalPrice int			-- discountPrice*purchaseQty
			,paymentType int 		-- 0:신용카드 / 1:핸드폰
			,totalPayment int 		-- 총결제금액 : 해당주문번호에 대한 총 결제금액
			,orderState int 	default 1		-- 0: 주문취소 1: 주문접수 2: 배송준비 3: 배송중 4: 배송완료 5:교환접수 6:교환완료 7:환불접수 8: 환불완료
		
			);	


-- TBL_ORDER
ALTER TABLE TBL_ORDERLIST
	DROP PRIMARY KEY; -- TBL_user 기본키

-- TBL_ORDER
DROP TABLE IF EXISTS TBL_ORDERLIST;

create table TBL_ORDERLIST(
			orderCode int primary key auto_increment
			,orderDate Date
			,userId varchar(35)
			,userName varchar(30)
			,totalProductPayment int 		-- 상품합계금액 : 배송료를 제외한 상품을 합한 금액 : 총주문금액
			,paymentType int 		-- 결제방법 (1 : 신용카드 / 2 : 핸드폰)
			,deliveryFee int
			,totalPayment int 		-- 총결제금액 ( = 상품합계금액 + 배송비) 해당주문번호에 대한 총 결제금액
			,orderState int 			-- 주문상태
			);
            

 select * from TBL_ORDER;
 select * from TBL_ORDERLIST;
 
