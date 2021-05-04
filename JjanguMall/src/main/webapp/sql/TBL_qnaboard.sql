use minidb;

-- TBL_CART
ALTER TABLE TBL_QNABOARD
	DROP PRIMARY KEY; -- TBL_user 기본키

-- TBL_CART
DROP TABLE IF EXISTS TBL_QNABOARD;

create table TBL_QNABOARD (userId varchar(35)
			,userEmail varchar(50)
			,userPhone varchar(20)
			,qnaboardCode int auto_increment primary key
			,qnaboardSubject varchar(100)
			,qnaboardContent varchar(500)
			,thumbImg varchar(100)
			,productCode int
			,productName varchar(100)
			,discountPrice int
			,ref int /*문의글 : ref = qnaboardCode / 답변글(관리자글) = 원글의 qnaboardCode*/
			,admin int DEFAULT '0' /* 0 : 유저의 글 / 1 : 관리자의 답글 default 0*/
			,regDate date );
            
            
select * from TBL_QNABOARD;

select * from TBL_QNABOARD order by qnaboardCode desc limit 3;
INSERT INTO `minidb`.`TBL_QNABOARD` (`userId`, `userEmail`, `userPhone`, `qnaboardCode`, `qnaboardSubject`, `qnaboardContent`, `thumbImg`, `productCode`, `productName`, `discountPrice`, `ref`, `admin`) VALUES ('song', 'song', '1234', '1', '테스트제목', '테스트내용', '1.jpg', '1', '테스트', '10000', '1', '0');
