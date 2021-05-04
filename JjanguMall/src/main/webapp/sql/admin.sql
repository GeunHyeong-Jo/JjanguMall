use minidb;

-- admin
ALTER TABLE TBL_admin
	DROP PRIMARY KEY; -- admin 기본키

-- admin
DROP TABLE IF EXISTS TBL_admin;


-- admin
CREATE TABLE TBL_admin (
	id VARCHAR(30) NOT NULL -- id,
	,pwd VARCHAR(30) NOT NULL -- pwd,
	,name VARCHAR(30) NOT NULL -- name,
	,phone VARCHAR(30) NULL -- phone
);

-- admin
ALTER TABLE TBL_admin
	ADD CONSTRAINT PK_admin -- admin 기본키
	PRIMARY KEY (
		id -- id
	);
    
select * from tbl_admin;
insert into tbl_admin values('admin','123','song','123456789');    