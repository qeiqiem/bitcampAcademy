CREATE TABLE members(
	mno 	INTEGER NOT NULL COMMENT '회원번호',
    mname	VARCHAR(50) NOT NULL COMMENT '이름',
    id 	VARCHAR(40) NOT NULL COMMENT '아이디',
    pwd		VARCHAR(100) NOT NULL COMMENT '비밀번호',
    rrn VARCHAR(15) NOT NULL COMMENT '주민번호',
    phone VARCHAR(13) NULL COMMENT '전화번호',
    address VARCHAR(30) NULL COMMENT '주소',
    nname	VARCHAR(50) NOT NULL COMMENT '닉네임',
    cre_date DATETIME NOT NULL COMMENT '가입일'
)
COMMENT '회원기본정보';

ALTER TABLE members
	ADD CONSTRAINT members_pk_mno 
		PRIMARY KEY(mno);
        
CREATE UNIQUE INDEX members_uix_id
	ON members(id asc);

-- 시퀀스 대신 사용, 자동으로 1씩 증가
ALTER TABLE members
	MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT
    COMMENT '회원일련번호';

-- 게시판 테이블 생성 SQL
create table board(
 bno INTEGER NOT NULL COMMENT '글번호',
 header VARCHAR(12) NOT NULL COMMENT '말머리',
 mno 	INTEGER NOT NULL COMMENT '회원번호',
 title VARCHAR(255) NOT NULL COMMENT '글제목',
 nname VARCHAR(50) NOT NULL COMMENT '작성자',
 content TEXT NOT NULL COMMENT '내용',
 cre_date DATETIME NOT NULL COMMENT '생성일'
)
COMMENT '게시판';

-- bno를 pk로 정하자
ALTER TABLE board ADD CONSTRAINT PK_BNO
	PRIMARY KEY(bno);

ALTER TABLE board ADD CONSTRAINT FK_MNO
	FOREIGN KEY(mno) REFERENCES members(mno);

-- bno컬럼에 대해 자동 증가 일련번호 기능 설정
ALTER TABLE board MODIFY COLUMN
	bno INTEGER NOT NULL AUTO_INCREMENT COMMENT '글번호';

create table booking(
 bno INTEGER NOT NULL COMMENT '글번호',
 mno 	INTEGER NOT NULL COMMENT '회원번호',
 header VARCHAR(12) NOT NULL COMMENT '말머리', 
 title VARCHAR(255) NOT NULL COMMENT '글제목',
 nname VARCHAR(50) NOT NULL COMMENT '작성자',
 cre_date DATETIME NOT NULL COMMENT '작성일',
 nop INTEGER NOT NULL COMMENT '최대인원수',
 min_nop INTEGER NOT NULL COMMENT '참가인원수',
 rdate DATETIME NOT NULL COMMENT '예약일정',
 content TEXT NOT NULL COMMENT '내용',
 mark INTEGER COMMENT '조회수',
 book INTEGER COMMENT '찜하기',
 comm INTEGER COMMENT '댓글',
 loc VARCHAR(100) NOT NULL COMMENT '위치'
)
COMMENT '일정등록';

-- bno를 pk로 정하자
ALTER TABLE booking ADD CONSTRAINT PK_BNO
	PRIMARY KEY(bno);

ALTER TABLE booking ADD CONSTRAINT FK_MNO2
	FOREIGN KEY(mno) REFERENCES members(mno);

-- bno컬럼에 대해 자동 증가 일련번호 기능 설정
ALTER TABLE booking MODIFY COLUMN
	bno INTEGER NOT NULL AUTO_INCREMENT COMMENT '글번호';
    
create table mountain(
 mtno INTEGER NOT NULL COMMENT '번호', 
 loc VARCHAR(100) NOT NULL COMMENT '위치',
 mtname VARCHAR(255) NOT NULL COMMENT '산이름',
 trans VARCHAR(255) NULL COMMENT '교통편',
 exp TEXT NULL COMMENT '설명',
 locimg TEXT NOT NULL COMMENT '산이미지',
 loclink TEXT NOT NULL COMMENT '산링크'
)
COMMENT '산정보';

ALTER TABLE mountain ADD CONSTRAINT PK_mtno
	PRIMARY KEY(mtno);
    
ALTER TABLE mountain MODIFY COLUMN
mtno INTEGER NOT NULL AUTO_INCREMENT COMMENT '번호';

    
create table bookComm(
bno INTEGER NOT NULL COMMENT '글번호',
cno INTEGER NOT NULL COMMENT '댓글번호',
ccon TEXT NOT NULL COMMENT '글내용',
c_date DATETIME NOT NULL COMMENT '작성시간'
)
COMMENT '일정댓글';

-- cno를 pk로정하고
-- bno를 fk로정하자
ALTER TABLE bookComm ADD CONSTRAINT PK_CNO
	PRIMARY KEY(cno);
ALTER TABLE bookComm ADD CONSTRAINT FK_bno2
	FOREIGN KEY(bno) REFERENCES booking(bno);

create table gallery(
 bno INTEGER NOT NULL COMMENT '글번호',
 mno 	INTEGER NOT NULL COMMENT '회원번호',
 loc VARCHAR(100) NOT NULL COMMENT '위치',
 nname VARCHAR(50) NOT NULL COMMENT '작성자',
 cre_date DATETIME NOT NULL COMMENT '작성일',
 photo LONGBLOB NOT NULL COMMENT '사진', 
 mark INTEGER NOT NULL COMMENT '찜하기',
 comm INTEGER NOT NULL COMMENT '댓글' 
);

ALTER TABLE gallery ADD CONSTRAINT PK_BNO
	PRIMARY KEY(bno);
    
ALTER TABLE gallery ADD CONSTRAINT FK_MNO3
	FOREIGN KEY(mno) REFERENCES members(mno);

INSERT INTO members(mno,mname,id,pwd,rrn,phone,address,nname,cre_date)
VALUES (1,'이지은','IU','1111','960615-2018875','010-4578-1572','서울 강남구 타워팰리스','IU',NOW());
INSERT INTO members(mno,mname,id,pwd,rrn,phone,address,nname,cre_date)
VALUES (2,'사나','SANA','1111','970710-2045785','010-2487-1573','인천 서구 가정동','SANA',NOW());
INSERT INTO members(mno,mname,id,pwd,rrn,phone,address,nname,cre_date)
VALUES (3,'제니','JENI','1111','980110-2015724','010-2457-1573','서울 용산구 한남동','JENI',NOW());
INSERT INTO members(mno,mname,id,pwd,rrn,phone,address,nname,cre_date)
VALUES (4,'차은우','CHA','1111','990512-1018574','010-5425-1573','광주 광산구 임곡동','CHA',NOW());
INSERT INTO members(mno,mname,id,pwd,rrn,phone,address,nname,cre_date)
VALUES (5,'박보검','PARK','1111','000154-1013572','010-2347-1564','부산 북구 금곡대로116','보검복지부',NOW());

COMMIT;









