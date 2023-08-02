-- 회원(member) 테이블 생성
CREATE TABLE MEMBER(
	id VARCHAR(16) NOT NULL,
	pw VARCHAR(330) NOT NULL,
	NAME VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	tel VARCHAR(13),
	regdate TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
	POINT INT DEFAULT 0,
	PRIMARY KEY(id));

-- 테이블 목록 보기 	
SHOW TABLES;

-- 테이블 구조 보기 
DESC MEMBER;

-- 더미 데이터 추가
INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES 
('admin', '1234', '관리자', 'admin@edu.com', '010-1000-1000');

INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES 
('shin', '1112', '신승원', 'shin123@edu.com', '010-1000-1000');

INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES 
('hello', '1221', '김성원', 'hi123@edu.com', '010-1000-1000');

INSERT INTO MEMBER(id, pw, NAME, email, tel) VALUES 
('bird', '2221', '우승원', 'wow1212@edu.com', '010-1000-1000');
--회원 테이블 조회
SELECT * FROM MEMBER;

-- 게시판 테이블 생성
CREATE TABLE board(
	bno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(200) NOT NULL,
	content VARCHAR(1000),
	author VARCHAR(16),
	resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	cnt INT DEFAULT 0);

-- 게시판 조회
DESC board;

-- 더미글 생성
INSERT INTO board(title, content, author) VALUES
('더미글1', '여기는 더미글1입니다.', 'admin');
INSERT INTO board(title, content, author) VALUES
('더미글2', '여기는 더미글2입니다.', 'shin');
INSERT INTO board(title, content, author) VALUES
('더미글3', '여기는 더미글3입니다.', 'hello');
INSERT INTO board(title, content, author) VALUES
('더미글4', '여기는 더미글4입니다.', 'bird');
INSERT INTO board(title, content, author) VALUES
('더미글5', '여기는 더미글5입니다.', 'admin');
INSERT INTO board(title, content, author) VALUES
('더미글6', '여기는 더미글6입니다.', 'admin');
INSERT INTO board(title, content, author) VALUES
('더미글7', '여기는 더미글7입니다.', 'admin')
INSERT INTO board(title, content, author) VALUES
('더미글8', '여기는 더미글8입니다.', 'shin')

--게시판 테이블 검색
SELECT * FROM board;

SELECT * FROM member;

DELETE FROM member WHERE id='shin'; -- 아이디가 shin인 회원 삭제 

SELECT * FROM member;

UPDATE board SET author='lee' WHERE bno=5; -- 글번호가 5인 레코드의 작성자 아이디를 lee로 변경한 것 

SELECT * FROM board;

UPDATE board 

COMMIT;

-- 7번 글에 대한 작성자의 이름
SELECT * FROM MEMBER WHERE id='admin';
SELECT author FROM board WHERE bno=7; 

-- 구간 검색
SELECT * FROM board WHERE bno >= 3 AND bno <= 6;
SELECT * FROM board WHERE bno BETWEEN 3 AND 6;
SELECT * FROM board LIMIT 2, 4; -- limit(시작 인덱스, 출력  수)


-- 이중쿼리(=, >=, <=, != ...) : select 문을 이중으로 사용함.
SELECT id, NAME FROM MEMBER WHERE id=(SELECT author FROM board WHERE bno=9);

-- 일치 검색(in)
SELECT id, NAME FROM MEMBER WHERE id IN(SELECT author FROM board);


-- 불일치 검색(not ~ in~)
SELECT id, NAME FROM MEMBER WHERE id NOT IN(SELECT author FROM board);

-- 유사 검색
SELECT * FROM member WHERE NAME LIKE '%승%';
SELECT * FROM member WHERE NAME LIKE '%%원';



--중복성 제거 : 
SELECT DISTINCT author FROM board;

-- 연관쿼리와 join
-- 연관쿼리(alias 활용)
SELECT * FROM member a, board b; -- 7*8 => 56건
SELECT a.id, a.name, a.email, b.bno FROM member a, board b;
SELECT a.id AS pid, a.name AS pname, a.email AS pemail, b.bno AS pno FROM member a, board b;
SELECT a.id AS pid, a.name AS pname, a.email AS pemail, b.bno AS pno FROM member a, board b WHERE a.id=b.author; -- 게시판에 글을 올린 회원의 정보와 글정보 모두 표시

--게시판에 글을 올린 회원정보와 글정보를 모두 표시
-- 내부 join
SELECT a.id, a.name, a.email, b.bno, b.title FROM member a INNER JOIN board b ON a.id=b.author;

-- table 복제 : 키에 대한 복제는 이루어지지 않음 ( primary key 등등)
CREATE TABLE board2 AS SELECT * FROM board; 

ALTER TABLE board2 ADD CONSTRAINT PRIMARY KEY (bno);

ALTER TABLE board2 modify bno INT AUTO_INCREMENT;

SELECT * FROM board2;

DESC board2;

-- 내부 조인을 하나의 뷰로 생성
CREATE VIEW writer_info AS (SELECT a.id AS pid, a.name AS pname, a.email AS pemail, b.bno AS pno FROM member a, board b WHERE a.id=b.author);
-- 생성된 뷰의 결과 출력
SELECT * FROM writer_info;

-- sort(소트) = 분류, 순서정렬
SELECT * FROM board;
SELECT * FROM board ORDER BY author;

-- 집계 (group by - > count, sum, avg, max, min .....)
SELECT author, COUNT(author) FROM board GROUP BY author;



-- 테이블 만들기 및 예시 데이터 추가
-- 테이블명 : 상품(product)
-- 상품코드 : gcode - 정수 / 일련번호(기본키) - 필수입력
-- 상품명 : gname - 문자열(150) - 필수입력
-- 종류 : gcate - 문자열(40) - 필수입력
-- 단가 : gprice - 정수 - 필수입력
-- 수량 : gqty - 정수 - 기본값:0
-- 등록일 : regdate - 날짜 -기본값:오늘날짜 및 시간 

-- 테이블명 : 판매(sales)
-- 판매코드 : pcode - 정수 / 일련번호(기본키) - 필수입력
-- 상품코드 : gcode - 정수 - 필입
-- 구매자 : id - 문자열(16) - 필입
-- 수량 : qty - 정수 - 기본값 1 - 필입
-- 구매단가 : sprice - 정수 - 필입
-- 결제수단 : stype - 정수 - 필입
-- 할인금액 : distotal - 정수
-- 결제금액 : paytotal - 정수 
-- 총 금액 : stotal - 정수
-- 판매일 : saledate - 날짜 - 기본값:오늘 날짜 및 시간 

-- 더미데이터는 본인이 임의로 각자 12건 이상 추가
--상품 데이터는 교육, 서적, 동영상강의 등의 카테고리를 본인이 정하여 추가할 것 
-- 현재 회원과 현존하는 상품  내용을 기준으로 구매한 판매데이터를 추가할 것 

-- 상품 테이블 생성
CREATE TABLE product(
	gcode INT PRIMARY	KEY NOT NULL,
	gname VARCHAR(150) NOT NULL,
	gcate VARCHAR(40) NOT NULL,
	gprice INT NOT NULL,
	gqty INT DEFAULT 0,
	regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

-- 상품 테이블 구조 조회 
DESC product;


-- 더미 데이터 생성
INSERT INTO product(gcode, gname, gcate, gqty, gprice) VALUES
('1000', '초등교육수학', '서적', '10', '18000');

INSERT INTO product(gcode, gname, gcate, gqty, gprice) VALUES
('1001', '자바코딩교육', '동영상강의', '5', '30000');

INSERT INTO product(gcode, gname, gcate, gqty, gprice) VALUES
('1002', '중등교육국어', '교육', '2', '30000');

INSERT INTO product(gcode, gname, gcate, gqty, gprice) VALUES
('1003', '초등교육사회책', '서적', '7', '18000');

INSERT INTO product(gcode, gname, gcate, gqty, gprice) VALUES
('1004', '초등교육과학', '교육', '12', '30000');

-- 상품 테이블 조회 
SELECT * FROM product;


--판매 데이터 생성
CREATE TABLE sales(
	pcode INT PRIMARY	KEY NOT NULL,
	gcode INT NOT NULL,
	id VARCHAR(16) NOT NULL,
	qty INT NOT NULL DEFAULT 1,
	sprice INT NOT NULL,
	stype INT NOT NULL,
	distotal INT,
	paytotal INT,
	stotal INT,
	saledate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
	
-- 판매 테이블 구조 조회
DESC	sales;




-- 더미 데이터 생성 (교육, 서적, 동영상 강의 등 ) 
INSERT INTO sales(pcode, gcode, id, qty, sprice, stype, distotal, paytotal, stotal) VALUES
('2000','1000', );

INSERT INTO sales() VALUES
('2001','1001', );

INSERT INTO sales() VALUES
('2002','1002', );

INSERT INTO sales() VALUES
('2003','1003', );

INSERT INTO sales() VALUES
('2004','1004', );

INSERT INTO sales() VALUES
('2005','1004', );

INSERT INTO sales() VALUES
('2006','1004',);

INSERT INTO sales() VALUES
('2007','1002', );

INSERT INTO sales() VALUES
('2008','1003', );

INSERT INTO sales() VALUES
('2009','1001', );

INSERT INTO sales() VALUES
('2010','1000', );

INSERT INTO sales() VALUES
('2011','1003', );

	member