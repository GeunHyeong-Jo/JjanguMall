use minidb;

-- TBL_CART
ALTER TABLE TBL_CART
	DROP PRIMARY KEY; -- TBL_user 기본키

-- TBL_CART
DROP TABLE IF EXISTS TBL_CART;

-- TBL_user
create table TBL_CART(cartCode int not Null auto_increment primary key
		,userId varchar(35)
		,userEmail varchar(30)
		,productCode int
		,productName varchar(100)
		,thumbImg varchar(50)
		,discountPrice int
		,productQty int 
		);

select * from TBL_CART;


insert into tbl_cart(userId,
							userEmail,
							productCode,
							productName,
							thumbImg,
							discountPrice,
							productQty)
							values('song','song',1,'테스트','1.jpg',10000,2
									);