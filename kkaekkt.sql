CREATE TABLE `member` (
	`mno`	INTEGER	NOT NULL comment '회원번호',
	`mname`	VARCHAR(40)	NULL comment '회원이름',
	`phone`	VARCHAR(15)	NULL comment '연락처',
	`birth`	VARCHAR(10)	NULL comment '생년월일',
	`address`	VARCHAR(100)	NULL comment '주소',
	`email`	VARCHAR(40)	NULL comment '이메일'
);

CREATE TABLE `account` (
	`mno`		INTEGER	NOT NULL comment '회원번호',
	`id`		VARCHAR(20)	NULL ,
	`password`	VARCHAR(20)	NULL ,
	`mtype` 	VARCHAR(10) NULL comment '회원유형구분(일반, 업체)'
);

CREATE TABLE `business` (
	`bno`		INTEGER	NOT NULL comment '사업자번호',
	`mno`		INTEGER	NOT NULL comment '회원번호',
	`bname`		VARCHAR(40) NOT NULL comment '업체명',
   	`phone` 		VARCHAR(15) NOT NULL comment '연락처',
	`bkno`   	 	INTEGER NULL comment '코드_은행',
	`acno`     	VARCHAR(20) NOT NULL comment '계좌번호',
	`address`		VARCHAR(100) NOT NULL comment '주소',
	`email`		VARCHAR(40)	NULL comment '이메일',
	`comment`	VARCHAR(255)	NULL comment '기업소개',
	`typeNum`	INTEGER NULL comment '가입유형'
);

CREATE TABLE `bank` (
	`bkno`	INTEGER	NOT NULL comment '은행번호',
	`bkname`	VARCHAR(30)	NULL comment '은행명'
);

CREATE TABLE `laundry_type` (
	`lno`	INTEGER	NOT NULL comment '품목번호',
	`lname`	VARCHAR(20)	NULL comment '품목명',
	`period`	VARCHAR(10)	NULL comment '1~3일/4~7일'
);

CREATE TABLE `bsn_laundry` (
	`bno`	INTEGER	NOT NULL comment '사업자번호',
	`lno`	INTEGER	NULL comment '품목번호',
	`price`	INTEGER	NULL comment '가격'
);

CREATE TABLE `equipment` (
	`eno`	INTEGER	NOT NULL comment '설비번호',
	`ename`	VARCHAR(25)	NULL comment '설비명'
);

CREATE TABLE `bsn_equipment` (
	`bno`	INTEGER	NOT NULL comment '사업자번호',
	`eno`	INTEGER	NULL comment '[코드]설비',
    `cnt`   INTEGER NULL comment '개수',
    `price` INTEGER NOT NULL DEFAULT 0 comment '이용금액'
);

CREATE TABLE `reservation` (
	`rno`	INTEGER	NOT NULL comment '예약번호',
	`mno`	INTEGER	NOT NULL comment '회원번호',
	`bno`	INTEGER	NULL comment '사업자번호',
	`rdate`	date	NULL comment '등록일자',
	`ddate`	date	NULL comment '마감일자',
	`stno`	INTEGER	NULL comment '상태번호'
);

CREATE TABLE `rsv_laundry` (
	`rno`	INTEGER	NOT NULL comment '예약번호',
	`lno`	INTEGER	NULL comment '품목번호',
	`cnt`	INTEGER	NULL comment '개수',
	`stno`	INTEGER	NULL comment '상태번호'
);

CREATE TABLE `rsv_payment` (
    `rno`    INTEGER    NOT NULL comment '예약번호',
    `price`    INTEGER    NULL comment '결제금액',
    `payment` VARCHAR(10) NULL comment '결제수단'
);

CREATE TABLE `state` (
	`stno`	INTEGER	NOT NULL comment '상태번호',
	`stname`	VARCHAR(20)	NULL comment '상태명'
);

CREATE TABLE `comment` (
	`cno`	INTEGER	NOT NULL comment '댓글번호',
	`mno`	INTEGER	NULL comment '회원번호',
	`bno`	INTEGER	NOT NULL comment '사업자번호',
	`comment`	VARCHAR(255)	NULL comment '내용',
	`order`	INTEGER	NULL comment '순서',
	`depth`	INTEGER	NULL comment '깊이',
	`groupNum`	INTEGER	NULL comment '소속'
);

CREATE TABLE `evaluation` (
	`mno`	INTEGER	NOT NULL comment '회원번호',
	`bno`	INTEGER	NOT NULL comment '사업자번호',
	`grade`	INTEGER	NULL comment '점수'
);

CREATE TABLE `like` (
	`bno`	INTEGER	NOT NULL comment '사업자번호',
	`mno`	INTEGER	NOT NULL comment '회원번호'
);

CREATE TABLE `cancel` (
	`cancelNum`	INTEGER	NOT NULL comment '취소번호',
	`reason`	VARCHAR(50)	NULL comment '사유'
);

CREATE TABLE `biztype` (
	`typeNum`	INTEGER	NOT NULL comment '업체유형번호',
	`typename`	VARCHAR(20)	NULL comment '[유형]-1:일반업체, 2:코인업체'
);
CREATE TABLE `schedule` (
	`schno`	INTEGER	NOT NULL comment '스케쥴번호',
	`wkname`	VARCHAR(10)	NULL comment '요일'
);

CREATE TABLE `bsn_schedule` (
	`bno`	INTEGER	NOT NULL comment'사업자번호',
	`schno`	INTEGER	NOT NULL comment'스케쥴번호',
	`time`	VARCHAR(15)	NULL comment'08:00~23:00'
);

CREATE TABLE `etc` (
	`etcno` INTEGER NOT NULL comment '부가서비스번호',
	`etcname` VARCHAR(30) NOT NULL comment '서비스명'
);

CREATE TABLE `bsn_etc` (
	`etcno` INTEGER NULL comment '부가서비스 번호',
	`bno` INTEGER NOT NULL comment '사업자번호',
	`price` INTEGER NOT NULL comment '이용금액'
);

ALTER TABLE `account` ADD CONSTRAINT `PK_ACCOUNT` PRIMARY KEY (
	`mno`
);
ALTER TABLE `account` MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `business` ADD CONSTRAINT `PK_BUSINESS` PRIMARY KEY (
	`bno`
);
ALTER TABLE `business` MODIFY COLUMN bno INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE `bank` ADD CONSTRAINT `PK_BANK` PRIMARY KEY (
	`bkno`
);
ALTER TABLE `bank` MODIFY COLUMN bkno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `laundry_type` ADD CONSTRAINT `PK_LAUNDRY_TYPE` PRIMARY KEY (
	`lno`
);
ALTER TABLE `laundry_type` MODIFY COLUMN lno INTEGER NOT NULL AUTO_INCREMENT;


ALTER TABLE `equipment` ADD CONSTRAINT `PK_EQUIPMENT` PRIMARY KEY (
	`eno`
);
ALTER TABLE `equipment` MODIFY COLUMN eno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`rno`
);
ALTER TABLE `reservation` MODIFY COLUMN rno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `state` ADD CONSTRAINT `PK_STATE` PRIMARY KEY (
	`stno`
);

ALTER TABLE `schedule` ADD CONSTRAINT `PK_SCHEDULE` PRIMARY KEY (
	`schno`
);
ALTER TABLE `schedule` MODIFY COLUMN schno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `state` MODIFY COLUMN stno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`cno`
);
ALTER TABLE `comment` MODIFY COLUMN cno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `cancel` ADD CONSTRAINT `PK_CANCEL` PRIMARY KEY (
	`cancelnum`
);
ALTER TABLE `cancel` MODIFY COLUMN cancelNum INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `biztype` ADD CONSTRAINT `PK_BIZTYPE` PRIMARY KEY (
	`typenum`
);
ALTER TABLE `biztype` MODIFY COLUMN typenum INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `etc` ADD CONSTRAINT `PK_ETCNO` PRIMARY KEY (
	`etcno`
);
ALTER TABLE `etc` MODIFY COLUMN etcno INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE `member` ADD CONSTRAINT `FK_ACCOUNT_TO_MEMBER_1` FOREIGN KEY (
	`mno` 
)
REFERENCES `account` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `business` ADD CONSTRAINT `FK_ACCOUNT_TO_BUSINESS_1` FOREIGN KEY (
	`mno`
)
REFERENCES `account` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `business` ADD CONSTRAINT `FK_BIZTYPE_TO_BUSINESS_1` FOREIGN KEY (
	`typenum`
)
REFERENCES `biztype` (
	`typenum`
) ON DELETE SET NULL;

ALTER TABLE `business` ADD CONSTRAINT `FK_BANK_TO_BUSINESS_1` FOREIGN KEY (
	`bkno`
)
REFERENCES `bank` (
	`bkno`
) ON DELETE SET NULL;

ALTER TABLE `rsv_payment` ADD CONSTRAINT `FK_RESERVATION_TO_RSV_PAYMENT_1` FOREIGN KEY (
    `rno`
)
REFERENCES `reservation` (
    `rno`
) ON DELETE CASCADE;

ALTER TABLE `bsn_laundry` ADD CONSTRAINT `FK_BUSINESS_TO_BSN_LAUNDRY_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `bsn_laundry` ADD CONSTRAINT `FK_LAUNDRY_TYPE_TO_BSN_LAUNDRY_1` FOREIGN KEY (
	`lno`
)
REFERENCES `laundry_type` (
	`lno`
) ON DELETE SET NULL;

ALTER TABLE `bsn_equipment` ADD CONSTRAINT `FK_BUSINESS_TO_BSN_EQUIPMENT_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `bsn_equipment` ADD CONSTRAINT `FK_EQUIPMENT_TO_BSN_EQUIPMENT_1` FOREIGN KEY (
	`eno`
)
REFERENCES `equipment` (
	`eno`
) ON DELETE SET NULL;

ALTER TABLE `reservation` ADD CONSTRAINT `FK_MEMBER_TO_RESERVATION_1` FOREIGN KEY (
	`mno`
)
REFERENCES `member` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `reservation` ADD CONSTRAINT `FK_BUSINESS_TO_RESERVATION_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE SET NULL;

ALTER TABLE `reservation` ADD CONSTRAINT `FK_STATE_TO_RESERVATION_1` FOREIGN KEY (
	`stno`
)
REFERENCES `state` (
	`stno`
) ON DELETE SET NULL;

ALTER TABLE `rsv_laundry` ADD CONSTRAINT `FK_RESERVATION_TO_RSV_LAUNDRY_1` FOREIGN KEY (
	`rno`
)
REFERENCES `reservation` (
	`rno`
) ON DELETE CASCADE;

ALTER TABLE `rsv_laundry` ADD CONSTRAINT `FK_LAUNDRY_TYPE_TO_RSV_LAUNDRY_1` FOREIGN KEY (
	`lno`
)
REFERENCES `laundry_type` (
	`lno`
) ON DELETE SET NULL;

ALTER TABLE `rsv_laundry` ADD CONSTRAINT `FK_STATE_TO_RSV_LAUNDRY_1` FOREIGN KEY (
	`stno`
)
REFERENCES `state` (
	`stno`
) ON DELETE SET NULL;

ALTER TABLE `comment` ADD CONSTRAINT `FK_MEMBER_TO_COMMENT_1` FOREIGN KEY (
	`mno`
)
REFERENCES `member` (
	`mno`
) ON DELETE SET NULL;

ALTER TABLE `comment` ADD CONSTRAINT `FK_BUSINESS_TO_COMMENT_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `evaluation` ADD CONSTRAINT `FK_MEMBER_TO_EVALUATION_1` FOREIGN KEY (
	`mno`
)
REFERENCES `member` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `evaluation` ADD CONSTRAINT `FK_BUSINESS_TO_EVALUATION_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `like` ADD CONSTRAINT `FK_BUSINESS_TO_LIKE_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `like` ADD CONSTRAINT `FK_MEMBER_TO_LIKE_1` FOREIGN KEY (
	`mno`
)
REFERENCES `member` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `bsn_schedule` ADD CONSTRAINT `FK_BUSINESS_TO_BSN_SCHEDULE_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `bsn_schedule` ADD CONSTRAINT `FK_SCHEDULE_TO_BSN_SCHEDULE_1` FOREIGN KEY (
	`schno`
)
REFERENCES `schedule` (
	`schno`
) ON DELETE CASCADE;

ALTER TABLE `bsn_etc` ADD CONSTRAINT `FK_ETC_TO_Bsn_ETC_1` FOREIGN KEY (
	`etcno`
)
REFERENCES `etc` (
	`etcno`
) ON DELETE SET NULL;

ALTER TABLE `bsn_etc` ADD CONSTRAINT `FK_BUSINESS_TO_BSN_ETC_1` FOREIGN KEY (
	`bno`
)
REFERENCES `business` (
	`bno`
) ON DELETE CASCADE;

-- 설비
INSERT INTO equipment (ename) VALUES ("세탁기(중형)");
INSERT INTO equipment (ename) VALUES ("세탁기(대형)");
INSERT INTO equipment (ename) VALUES ("세탁기(특대형)");
INSERT INTO equipment (ename) VALUES ("건조기");

-- 부가서비스
INSERT INTO etc (etcname) VALUES("향균세탁");
INSERT INTO etc (etcname) VALUES("특수세제(울/유아용등)");
INSERT INTO etc (etcname) VALUES("섬유유연제");
INSERT INTO etc (etcname) VALUES("픽업봉투");

-- 은행
INSERT INTO bank (bkname) VALUES ("KB국민은행");
INSERT INTO bank (bkname) VALUES ("신한은행");
INSERT INTO bank (bkname) VALUES ("하나은행");
INSERT INTO bank (bkname) VALUES ("우리은행");
INSERT INTO bank (bkname) VALUES ("IBK기업은행");
INSERT INTO bank (bkname) VALUES ("NH농협은행");
INSERT INTO bank (bkname) VALUES ("카카오뱅크");

-- 취급 품목
INSERT INTO laundry_type (lname,period) values("일반의류",'1일~3일');
INSERT INTO laundry_type (lname,period) values("와이셔츠",'1일~3일');
INSERT INTO laundry_type (lname,period) values("이불",'1일~3일');
INSERT INTO laundry_type (lname,period) values("운동화",'1일~3일');
INSERT INTO laundry_type (lname,period) values("가죽모피",'4일~7일');
INSERT INTO laundry_type (lname,period) values("명품가방",'4일~7일');
INSERT INTO laundry_type (lname,period) values("아웃도어",'4일~7일');
INSERT INTO laundry_type (lname,period) values("기타",'4일~7일');

-- 진행상태
INSERT INTO state (stname) values("세탁 전");
INSERT INTO state (stname) values("세탁 완료");
INSERT INTO state (stname) values("전달 완료");
INSERT INTO state (stname) values("취소");

-- 취소사유 (업체용)
INSERT INTO cancel (reason) values("고객 요청으로 취소합니다.");
INSERT INTO cancel (reason) values("취급하는 품목이 아닙니다.(기타)");
INSERT INTO cancel (reason) values("기간 내에 작업을 완료할 수 없습니다.");
INSERT INTO cancel (reason) values("가게 내부 사정으로 취소합니다.");

-- 업체유형
INSERT INTO biztype (typename) values("일반 세탁소");
INSERT INTO biztype (typename) values("코인 세탁소");

-- 요일 선택 스케쥴
INSERT INTO schedule (wkname) values("월");
INSERT INTO schedule (wkname) values("화");
INSERT INTO schedule (wkname) values("수");
INSERT INTO schedule (wkname) values("목");
INSERT INTO schedule (wkname) values("금");
INSERT INTO schedule (wkname) values("토");
INSERT INTO schedule (wkname) values("일");
INSERT INTO schedule (wkname) values("매일");
INSERT INTO schedule (wkname) values("평일");
INSERT INTO schedule (wkname) values("주말");

-- 더미 데이터
INSERT INTO account (id,password,mtype) VALUES ('testps','test',1);
INSERT INTO member VALUES ((SELECT MAX(mno) FROM account),'테스터','010-1111-2222','920110','서울시 용산구','test@naver.com');

INSERT INTO account (id,password,mtype) VALUES ('testbs','test',2);
INSERT INTO business (mno,bname,address,phone,bkno,acno,email,typeNum) 
VALUES((SELECT MAX(mno) FROM account),'테스트업체','서울시 용산구','010-111-2222',1,'110-111-1111','test@naver.com',1);
INSERT INTO bsn_schedule VALUES ((SELECT MAX(bno) FROM business), 8,'08:00~22:00');
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 1,1200);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 2,1500);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 3,1800);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 4,2000);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 5,2000);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 6,2000);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 7,2000);
INSERT INTO bsn_laundry VALUES ((SELECT MAX(bno) FROM business), 8,2000);

INSERT INTO account (id,password) values ('testbs2','test');
INSERT INTO business (mno,bname,address,phone,bkno,acno,email,typeNum) 
values((SELECT MAX(mno) FROM account),'테스트업체2','서울시 강남구','010-222-3333',2,'110-111-1111','test@naver.com',2);
INSERT INTO bsn_schedule VALUES ((SELECT MAX(bno) FROM business), 8,'09:00~22:00');
INSERT INTO bsn_schedule VALUES ((SELECT MAX(bno) FROM business), 9,'04:00~18:00');
INSERT INTO bsn_equipment VALUES ((SELECT MAX(bno) FROM business), 1,3,1500);
INSERT INTO bsn_equipment VALUES ((SELECT MAX(bno) FROM business), 2,2,1800);
INSERT INTO bsn_etc VALUES ((SELECT MAX(bno) FROM business), 2, 500);
-- INSERT INTO bsn_etc VALUES ((SELECT MAX(bno) FROM business), 3, 800); 이거 왜 안되는지 이유를 모르겠음 

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/05','2021/03/09',1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',3);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,2,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,1,1);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,1);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 5,2,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 4,3,2);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');

INSERT INTO reservation (mno, bno, rdate,ddate,stno) VALUES (1,1,'2021/03/02','2021/03/06',2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 1,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 2,2,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 3,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 4,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 5,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 6,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 7,3,2);
INSERT INTO rsv_laundry VALUES ((SELECT MAX(rno) FROM reservation), 8,3,2);

INSERT INTO rsv_payment VALUES ((SELECT MAX(rno) FROM reservation), 9300, '카드');