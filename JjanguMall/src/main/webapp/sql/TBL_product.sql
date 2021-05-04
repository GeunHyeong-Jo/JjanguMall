use minidb;
-- TBL_product
ALTER TABLE TBL_product
	DROP PRIMARY KEY; -- TBL_product 기본키

-- TBL_product
DROP TABLE IF EXISTS TBL_product;

DELETE FROM _cub_schema_comments WHERE table_name = 'TBL_product';

-- TBL_product
CREATE TABLE TBL_product (
	productCode INT NOT NULL auto_increment primary key-- productCode,
	,productName VARCHAR(100) NULL -- productName,
	,originPrice INT NULL -- originPrice,
	,discountPrice INT NULL -- discountPrice,
	,origin VARCHAR(20) NULL -- origin,
	,manufacturer VARCHAR(20) NULL -- manufacturer,
	,thumbImg VARCHAR(50) NULL -- thumbImg,
	,detailedImg VARCHAR(50) NULL -- detailedImg,
	,totalQty INT NULL -- totalQty,
	,stockQty INT NULL -- stockQty,
	,saleQty INT DEFAULT '0' -- saleQty,
	,saleStatus INT DEFAULT '1' -- saleStatus,
	,regDate DATE  -- regDate,
	,updateDate DATE  -- updateDate,
	,productOption INT DEFAULT '0' -- productOption,
	,stationery INT DEFAULT '0' -- 문구,
	,living INT DEFAULT '0' -- 리빙,
	,travel INT DEFAULT '0' -- 여행,
    ,newP INT
	,deliveryFee INT DEFAULT '2500' -- 배달료
);

-- TBL_product
ALTER TABLE TBL_product
	ADD CONSTRAINT PK_TBL_product -- TBL_product 기본키
	PRIMARY KEY (
		productCode -- productCode
	);
    
select * from tbl_product;

insert into tbl_product values(1,'테스팅',10000,10000,'한국','송원컴퍼니','1.jpg','1d.jpg',100,100,0,1,now(),now(),0,1,0,0,1,2500);
insert into tbl_product values(2,'테스팅2',20000,20000,'한국','송원컴퍼니','2.jpg','2d.jpg',100,100,0,1,now(),now(),0,1,0,0,1,2500);
insert into tbl_product values(3,'테스팅3',30000,30000,'한국','송원컴퍼니','3.jpg','3d.jpg',100,100,0,1,now(),now(),0,1,0,0,1,2500);

alter table tbl_product drop productOption;
select productCode from TBL_product order by productCode desc limit 1;