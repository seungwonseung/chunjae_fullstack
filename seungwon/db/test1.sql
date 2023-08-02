-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.0.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- edu 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `edu` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `edu`;

-- 테이블 edu.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `resdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.board:~9 rows (대략적) 내보내기
INSERT INTO `board` (`bno`, `title`, `content`, `author`, `resdate`, `cnt`) VALUES
	(1, '더미글1', '여기는 더미글1입니다.', 'admin', '2023-07-28 01:09:32', 0),
	(2, '더미글1', '여기는 더미글1입니다.', 'admin', '2023-07-28 01:13:14', 0),
	(3, '더미글2', '여기는 더미글2입니다.', 'admin', '2023-07-28 01:13:17', 0),
	(4, '더미글3', '여기는 더미글3입니다.', 'admin', '2023-07-28 01:13:20', 0),
	(5, '더미글4', '여기는 더미글4입니다.', 'lee', '2023-07-28 01:13:24', 0),
	(6, '더미글5', '여기는 더미글5입니다.', 'admin', '2023-07-28 01:13:27', 0),
	(7, '더미글6', '여기는 더미글6입니다.', 'admin', '2023-07-28 01:13:31', 0),
	(8, '더미글7', '여기는 더미글7입니다.', 'admin', '2023-07-28 01:13:33', 0),
	(9, '더미글8', '여기는 더미글8입니다.', 'shin', '2023-07-28 01:30:50', 0);

-- 테이블 edu.board2 구조 내보내기
CREATE TABLE IF NOT EXISTS `board2` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `author` varchar(16) DEFAULT NULL,
  `resdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.board2:~9 rows (대략적) 내보내기
INSERT INTO `board2` (`bno`, `title`, `content`, `author`, `resdate`, `cnt`) VALUES
	(1, '더미글1', '여기는 더미글1입니다.', 'admin', '2023-07-28 01:09:32', 0),
	(2, '더미글1', '여기는 더미글1입니다.', 'admin', '2023-07-28 01:13:14', 0),
	(3, '더미글2', '여기는 더미글2입니다.', 'admin', '2023-07-28 01:13:17', 0),
	(4, '더미글3', '여기는 더미글3입니다.', 'admin', '2023-07-28 01:13:20', 0),
	(5, '더미글4', '여기는 더미글4입니다.', 'lee', '2023-07-28 01:13:24', 0),
	(6, '더미글5', '여기는 더미글5입니다.', 'admin', '2023-07-28 01:13:27', 0),
	(7, '더미글6', '여기는 더미글6입니다.', 'admin', '2023-07-28 01:13:31', 0),
	(8, '더미글7', '여기는 더미글7입니다.', 'admin', '2023-07-28 01:13:33', 0),
	(9, '더미글8', '여기는 더미글8입니다.', 'shin', '2023-07-28 01:30:50', 0);

-- 테이블 edu.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `id` varchar(16) NOT NULL,
  `pw` varchar(330) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `POINT` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 edu.member:~3 rows (대략적) 내보내기
INSERT INTO `member` (`id`, `pw`, `NAME`, `email`, `tel`, `regdate`, `POINT`) VALUES
	('admin', '1234', '관리자', 'admin@edu.com', '010-1000-1000', '2023-07-28 00:48:40', 0),
	('bird', '2221', '우승원', 'wow1212@edu.com', '010-1000-1000', '2023-07-28 01:13:09', 0),
	('hello', '1221', '김성원', 'hi123@edu.com', '010-1000-1000', '2023-07-28 01:13:06', 0);

-- 뷰 edu.writer_info 구조 내보내기
-- VIEW 종속성 오류를 극복하기 위해 임시 테이블을 생성합니다.
CREATE TABLE `writer_info` (
	`pid` VARCHAR(16) NOT NULL COLLATE 'utf8mb4_general_ci',
	`pname` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`pemail` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`pno` INT(11) NOT NULL
) ENGINE=MyISAM;

-- 뷰 edu.writer_info 구조 내보내기
-- 임시 테이블을 제거하고 최종 VIEW 구조를 생성
DROP TABLE IF EXISTS `writer_info`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `writer_info` AS (SELECT a.id AS pid, a.name AS pname, a.email AS pemail, b.bno AS pno FROM member a, board b WHERE a.id=b.author) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
