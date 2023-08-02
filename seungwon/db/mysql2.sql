USE shop;

SHOW TABLES;

SELECT * FROM customer;

INSERT INTO customer VALUES('AK-10880', 'Alien Kim', 'Consumer', 'South korea', 'Seoul', 'Seoul', 18517, 'West');

SELECT * from customer WHERE customername LIKE '%kim%' AND city='seoul';
SELECT COUNT(*) AS cnt FROM customer WHERE customername LIKE '%kim%' AND city='seoul';

Customer cus = NEW customer();
cus.setCustomer

-- 회원 등록
INSERT INTO customer VALUES(?, ?, ?, ?, ?, ?, ?, ?);
psmt.setString(1, cus.getCustomerid()); -- 1번째 물음표는 id 입니다.
psmt.setString(2, cus.getCustomename());
psmt.setString(3, cus.getCustomertype));
psmt.setString(4, cus.getCountry());
psmt.setString(5, cus.getCity());
psmt.setString(6, cus.getState());
psmt.setInt(7, cus.getPostcode());
psmt.setString(8, cus.getRegiontype());

-- 고객정보 변경
UPDATE customer SET country='America',city='LosAngels',state='LosAngels' WHERE cutomerid='AK-10880';

-- 웹에서 데이터 변경
UPDATE customer SET country=?, city=?, state=? WHERE custoemrid=?
pstmt.setString (1, cus);

SELECT * FROM buy;

-- customerid 별로 그룹화하여 customerid, 제품거래건수, 총수량, 평균 할인율을 출력하라

SELECT customerid, COUNT(productid) AS '제품거래건수', SUM(quantity) AS '총수량', AVG(discount) AS '평균할인율' FROM buy GROUP BY customerid;

-- buy 테이블에서 할인율이 가장 작은 거래 정보를 출력하시오.
SELECT * FROM buy WHERE discount = (SELECT MIN(discount) FROM buy) ORDER BY quantity DESC, oderdatae ASC;

-- 배송일(shipdate)의 년도별로 총수량의 합계와 총수량의 평균, 총수량의 최대값을 집계하시오. (년도를 추출하는 함수는 year)
SELECT * FROM buy WHERE 