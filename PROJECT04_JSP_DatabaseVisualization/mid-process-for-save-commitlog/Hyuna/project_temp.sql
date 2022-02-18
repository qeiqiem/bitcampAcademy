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

create table mountain(
 loc VARCHAR(100) NOT NULL COMMENT '위치',
 mtname VARCHAR(255) NOT NULL COMMENT '산이름',
 trans VARCHAR(255) NULL COMMENT '교통편',
 exp VARCHAR(255) NULL COMMENT '설명',
 photo LONGBLOB NULL COMMENT '사진'
)
COMMENT '산정보';

ALTER TABLE mountain ADD CONSTRAINT PK_LOC
	PRIMARY KEY(loc);

create table booking(
 bno INTEGER NOT NULL COMMENT '글번호',
 mno 	INTEGER NOT NULL COMMENT '회원번호',
 header VARCHAR(12) NOT NULL COMMENT '말머리', 
 title VARCHAR(255) NOT NULL COMMENT '글제목',
 nname VARCHAR(50) NOT NULL COMMENT '작성자',
 cre_date DATETIME NOT NULL COMMENT '작성일',
 nop INTEGER NOT NULL COMMENT '인원수',
 rdate DATETIME NOT NULL COMMENT '예약일정',
 content TEXT NOT NULL COMMENT '내용',
 mark INTEGER NOT NULL COMMENT '찜하기',
 comm INTEGER NOT NULL COMMENT '댓글',
 loc VARCHAR(100) NOT NULL COMMENT '위치',
 picture BLOB NOT NULL COMMENT "사진"
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
    
ALTER TABLE gallery ADD CONSTRAINT FK_LOC
	FOREIGN KEY(loc) REFERENCES mountain(loc);

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

INSERT INTO board(header,mno,title,nname,content,cre_date)
VALUES('[잡담]',1,'제목1','IU','내용1',NOW());
INSERT INTO board(header,mno,title,nname,content,cre_date)
VALUES('[질문]',2,'제목2','SANA','내용2',NOW());
INSERT INTO board(header,mno,title,nname,content,cre_date)
VALUES('[공지]',3,'제목3','JENI','내용3',NOW());
COMMIT;









