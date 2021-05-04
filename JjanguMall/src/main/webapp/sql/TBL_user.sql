use minidb;

-- TBL_user
ALTER TABLE TBL_user
	DROP PRIMARY KEY; -- TBL_user 기본키

-- TBL_user
DROP TABLE IF EXISTS TBL_user;

-- TBL_user
CREATE TABLE TBL_user (
	userId VARCHAR(35) NOT NULL -- userId,
	,userpwd VARCHAR(100) NOT NULL -- userpwd,
	,username VARCHAR(30) NOT NULL -- username,
	,useremail VARCHAR(30) NOT NULL -- useremail,
	,userphone VARCHAR(30) NULL -- userphone,
	,userpoint INT DEFAULT '0' -- userpoint,
	,productincart INT DEFAULT '0' -- productincart,
	,receiverName VARCHAR(30) NULL -- recievername,
	,receiverzipcode VARCHAR(20) NULL -- recieverzipcode,
	,receiveraddr1 VARCHAR(500) NULL -- recieveraddr1,
	,receiveraddr2 VARCHAR(500) NULL -- recieveraddr2,
	,receiverphone VARCHAR(30) NULL -- recieverphone,
    ,deliveryMsg VARCHAR(500) NULL
	,deliveryoption VARCHAR(20) DEFAULT '기본배송' -- deliveryoption,
	,joindate DATE -- joindate,
	,totalpayment INT NULL -- 총구매
);

-- TBL_user
ALTER TABLE TBL_user
	ADD CONSTRAINT PK_TBL_user -- TBL_user 기본키
	PRIMARY KEY (
		userId -- userId
	);
    
    
select * from TBL_user;

alter table TBL_user change recieverName receiverName VARCHAR(30);
alter table TBL_user change recieverzipcode receiverzipcode VARCHAR(20);
alter table TBL_user change recieveraddr1 receiveraddr1 VARCHAR(500);
alter table TBL_user change recieveraddr2 receiveraddr2 VARCHAR(500);
alter table TBL_user change recieverphone receiverphone VARCHAR(30);