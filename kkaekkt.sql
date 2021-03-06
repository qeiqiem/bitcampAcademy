CREATE TABLE `Member` (
	`mno`	INTEGER	NOT NULL,
	`mname`	VARCHAR(40)	NULL,
	`phone`	VARCHAR(15)	NULL,
	`birth`	VARCHAR(10)	NULL,
	`address`	VARCHAR(100)	NULL,
	`email`	VARCHAR(40)	NULL
);

CREATE TABLE `Account` (
	`mno`		INTEGER	NOT NULL,
	`id`		VARCHAR(20)	NULL,
	`password`	VARCHAR(20)	NULL
);

CREATE TABLE `Business` (
	`bno`		INTEGER	NOT NULL,
	`mno`		INTEGER	NOT NULL,
	`bname`		VARCHAR(40) NOT NULL,
   	`phone` 		VARCHAR(15) NOT NULL,
	`bkno`   	 	INTEGER NOT NULL,
	`acno`     	VARCHAR(20) NOT NULL,
	`address`		VARCHAR(100) NOT NULL,
	`email`		VARCHAR(40)	NULL,
	`comment`	VARCHAR(255)	NULL,
	`typeNum`	INTEGER NULL
);

CREATE TABLE `Payment` (
	`pno`	INTEGER	NOT NULL,
	`pname`	VARCHAR(20)	NULL
);

CREATE TABLE `Bank` (
	`bkno`	INTEGER	NOT NULL,
	`bkname`	VARCHAR(30)	NULL
);

CREATE TABLE `Laundry_type` (
	`lno`	INTEGER	NOT NULL,
	`lname`	VARCHAR(20)	NULL,
	`prno`	INTEGER	NULL
);

CREATE TABLE `Period` (
	`prno`	INTEGER	NOT NULL,
	`prname`	VARCHAR(15)	NULL
);

CREATE TABLE `Bsn_Laundry` (
	`bno`	INTEGER	NOT NULL,
	`lno`	INTEGER	NULL,
	`price`	INTEGER	NULL
);

CREATE TABLE `Equipment` (
	`eno`	INTEGER	NOT NULL,
	`ename`	VARCHAR(25)	NULL
);

CREATE TABLE `Bsn_Equipment` (
	`bno`	INTEGER	NOT NULL,
	`eno`	INTEGER	NULL,
    `cnt`   INTEGER NULL,
    `price` INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE `Reservation` (
	`rno`	INTEGER	NOT NULL,
	`mno`	INTEGER	NOT NULL,
	`bno`	INTEGER	NULL,
	`rdate`	date	NULL,
	`ddate`	date	NULL,
	`stno`	INTEGER	NULL
);

CREATE TABLE `Rsv_Laundry` (
	`rno`	INTEGER	NOT NULL,
	`lno`	INTEGER	NULL,
	`cnt`	INTEGER	NULL,
	`stno`	INTEGER	NULL
);

CREATE TABLE `Rsv_Payment` (
    `rno`    INTEGER    NOT NULL,
    `pno`    INTEGER    NULL,
    `price`    INTEGER    NULL
);

CREATE TABLE `State` (
	`stno`	INTEGER	NOT NULL,
	`stname`	VARCHAR(20)	NULL
);

CREATE TABLE `Comment` (
	`cno`	INTEGER	NOT NULL,
	`mno`	INTEGER	NULL,
	`bno`	INTEGER	NOT NULL,
	`comment`	VARCHAR(255)	NULL,
	`order`	INTEGER	NULL,
	`depth`	INTEGER	NULL,
	`groupNum`	INTEGER	NULL
);

CREATE TABLE `Evaluation` (
	`mno`	INTEGER	NOT NULL,
	`bno`	INTEGER	NOT NULL,
	`grade`	INTEGER	NULL
);

CREATE TABLE `Like` (
	`bno`	INTEGER	NOT NULL,
	`mno`	INTEGER	NOT NULL
);

CREATE TABLE `Cancel` (
	`cancelNum`	INTEGER	NOT NULL,
	`reason`	VARCHAR(50)	NULL
);

CREATE TABLE `bizType` (
	`typeNum`	INTEGER	NOT NULL,
	`typename`	VARCHAR(20)	NULL
);
CREATE TABLE `Schedule` (
	`schno`	INTEGER	NOT NULL,
	`wkname`	VARCHAR(10)	NULL
);

CREATE TABLE `Bsn_schedule` (
	`bno`	INTEGER	NOT NULL,
	`schno`	INTEGER	NOT NULL,
	`time`	VARCHAR(15)	NULL
);

CREATE TABLE `Etc` (
	`etcno` INTEGER NOT NULL,
	`etcname` VARCHAR(30) NOT NULL
);

CREATE TABLE `Bsn_Etc` (
	`etcno` INTEGER NULL,
	`bno` INTEGER NOT NULL,
	`price` INTEGER NOT NULL
);

ALTER TABLE `Account` ADD CONSTRAINT `PK_ACCOUNT` PRIMARY KEY (
	`mno`
);
ALTER TABLE `Account` MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Business` ADD CONSTRAINT `PK_BUSINESS` PRIMARY KEY (
	`bno`
);
ALTER TABLE `Business` MODIFY COLUMN bno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Payment` ADD CONSTRAINT `PK_PAYMENT` PRIMARY KEY (
	`pno`
);
ALTER TABLE `Payment` MODIFY COLUMN pno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Bank` ADD CONSTRAINT `PK_BANK` PRIMARY KEY (
	`bkno`
);
ALTER TABLE `Bank` MODIFY COLUMN bkno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Laundry_type` ADD CONSTRAINT `PK_LAUNDRY_TYPE` PRIMARY KEY (
	`lno`
);
ALTER TABLE `Laundry_type` MODIFY COLUMN lno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Period` ADD CONSTRAINT `PK_PERIOD` PRIMARY KEY (
	`prno`
);
ALTER TABLE `Period` MODIFY COLUMN prno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Equipment` ADD CONSTRAINT `PK_EQUIPMENT` PRIMARY KEY (
	`eno`
);
ALTER TABLE `Equipment` MODIFY COLUMN eno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`rno`
);
ALTER TABLE `Reservation` MODIFY COLUMN rno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `State` ADD CONSTRAINT `PK_STATE` PRIMARY KEY (
	`stno`
);

ALTER TABLE `Schedule` ADD CONSTRAINT `PK_SCHEDULE` PRIMARY KEY (
	`schno`
);
ALTER TABLE `Schedule` MODIFY COLUMN schno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `State` MODIFY COLUMN stno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`cno`
);
ALTER TABLE `Comment` MODIFY COLUMN cno INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Cancel` ADD CONSTRAINT `PK_CANCEL` PRIMARY KEY (
	`cancelNum`
);
ALTER TABLE `Cancel` MODIFY COLUMN cancelNum INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `bizType` ADD CONSTRAINT `PK_bizType` PRIMARY KEY (
	`typeNum`
);
ALTER TABLE `bizType` MODIFY COLUMN typeNum INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `Etc` ADD CONSTRAINT `PK_ETCNO` PRIMARY KEY (
	`etcno`
);
ALTER TABLE `Etc` MODIFY COLUMN etcno INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE `Member` ADD CONSTRAINT `FK_Account_TO_Member_1` FOREIGN KEY (
	`mno` 
)
REFERENCES `Account` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `Business` ADD CONSTRAINT `FK_Account_TO_Business_1` FOREIGN KEY (
	`mno`
)
REFERENCES `Account` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `Business` ADD CONSTRAINT `FK_bizType_TO_Business_1` FOREIGN KEY (
	`typeNum`
)
REFERENCES `bizType` (
	`typeNum`
) ON DELETE SET NULL;

ALTER TABLE `Business` ADD CONSTRAINT `FK_Bank_TO_Business_1` FOREIGN KEY (
	`bkno`
)
REFERENCES `Bank` (
	`bkno`
) ON DELETE SET NULL;

ALTER TABLE `Laundry_type` ADD CONSTRAINT `FK_Period_TO_Laundry_type_1` FOREIGN KEY (
	`prno`
)
REFERENCES `Period` (
	`prno`
) ON DELETE SET NULL;

ALTER TABLE `Rsv_Payment` ADD CONSTRAINT `FK_Reservation_TO_Rsv_Payment_1` FOREIGN KEY (
    `rno`
)
REFERENCES `Reservation` (
    `rno`
) ON DELETE CASCADE;

ALTER TABLE `Rsv_Payment` ADD CONSTRAINT `FK_Payment_TO_Rsv_Payment_1` FOREIGN KEY (
    `pno`
)
REFERENCES `Payment` (
    `pno`
) ON DELETE SET NULL;

ALTER TABLE `Bsn_Laundry` ADD CONSTRAINT `FK_Business_TO_Bsn_Laundry_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `Bsn_Laundry` ADD CONSTRAINT `FK_Laundry_type_TO_Bsn_Laundry_1` FOREIGN KEY (
	`lno`
)
REFERENCES `Laundry_type` (
	`lno`
) ON DELETE SET NULL;

ALTER TABLE `Bsn_Equipment` ADD CONSTRAINT `FK_Business_TO_Bsn_Equipment_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `Bsn_Equipment` ADD CONSTRAINT `FK_Equipment_TO_Bsn_Equipment_1` FOREIGN KEY (
	`eno`
)
REFERENCES `Equipment` (
	`eno`
) ON DELETE SET NULL;

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_Member_TO_Reservation_1` FOREIGN KEY (
	`mno`
)
REFERENCES `Member` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_Business_TO_Reservation_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE SET NULL;

ALTER TABLE `Reservation` ADD CONSTRAINT `FK_State_TO_Reservation_1` FOREIGN KEY (
	`stno`
)
REFERENCES `State` (
	`stno`
) ON DELETE SET NULL;

ALTER TABLE `Rsv_Laundry` ADD CONSTRAINT `FK_Reservation_TO_Rsv_Laundry_1` FOREIGN KEY (
	`rno`
)
REFERENCES `Reservation` (
	`rno`
) ON DELETE CASCADE;

ALTER TABLE `Rsv_Laundry` ADD CONSTRAINT `FK_Laundry_type_TO_Rsv_Laundry_1` FOREIGN KEY (
	`lno`
)
REFERENCES `Laundry_type` (
	`lno`
) ON DELETE SET NULL;

ALTER TABLE `Rsv_Laundry` ADD CONSTRAINT `FK_State_TO_Rsv_Laundry_1` FOREIGN KEY (
	`stno`
)
REFERENCES `State` (
	`stno`
) ON DELETE SET NULL;

ALTER TABLE `Comment` ADD CONSTRAINT `FK_Member_TO_Comment_1` FOREIGN KEY (
	`mno`
)
REFERENCES `Member` (
	`mno`
) ON DELETE SET NULL;

ALTER TABLE `Comment` ADD CONSTRAINT `FK_Business_TO_Comment_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `Evaluation` ADD CONSTRAINT `FK_Member_TO_Evaluation_1` FOREIGN KEY (
	`mno`
)
REFERENCES `Member` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `Evaluation` ADD CONSTRAINT `FK_Business_TO_Evaluation_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `Like` ADD CONSTRAINT `FK_Business_TO_Like_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `Like` ADD CONSTRAINT `FK_Member_TO_Like_1` FOREIGN KEY (
	`mno`
)
REFERENCES `Member` (
	`mno`
) ON DELETE CASCADE;

ALTER TABLE `Bsn_schedule` ADD CONSTRAINT `FK_Business_TO_Bsn_schedule_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
	`bno`
) ON DELETE CASCADE;

ALTER TABLE `Bsn_schedule` ADD CONSTRAINT `FK_Schedule_TO_Bsn_schedule_1` FOREIGN KEY (
	`schno`
)
REFERENCES `Schedule` (
	`schno`
) ON DELETE CASCADE;

ALTER TABLE `Bsn_Etc` ADD CONSTRAINT `FK_Etc_TO_Bsn_Etc_1` FOREIGN KEY (
	`etcno`
)
REFERENCES `Etc` (
	`etcno`
) ON DELETE SET NULL;

ALTER TABLE `Bsn_Etc` ADD CONSTRAINT `FK_business_TO_Bsn_Etc_1` FOREIGN KEY (
	`bno`
)
REFERENCES `Business` (
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

-- 결제수단
INSERT INTO Payment (pname) VALUES ("카드");
-- 은행
INSERT INTO Bank (bkname) VALUES ("KB국민은행");
INSERT INTO Bank (bkname) VALUES ("신한은행");
INSERT INTO Bank (bkname) VALUES ("하나은행");
INSERT INTO Bank (bkname) VALUES ("우리은행");
INSERT INTO Bank (bkname) VALUES ("IBK기업은행");
INSERT INTO Bank (bkname) VALUES ("NH농협은행");
INSERT INTO Bank (bkname) VALUES ("카카오뱅크");
-- 기간
INSERT INTO Period (prname)VALUES("1일~3일");
INSERT INTO Period (prname)VALUES("4일~7일");

-- 취급 품목
INSERT INTO laundry_type (lname,prno) values("일반의류",1);
INSERT INTO laundry_type (lname,prno) values("와이셔츠",1);
INSERT INTO laundry_type (lname,prno) values("이불",1);
INSERT INTO laundry_type (lname,prno) values("운동화",1);
INSERT INTO laundry_type (lname,prno) values("가죽모피",2);
INSERT INTO laundry_type (lname,prno) values("명품가방",2);
INSERT INTO laundry_type (lname,prno) values("아웃도어",2);
INSERT INTO laundry_type (lname,prno) values("기타",2);

-- 진행상태
INSERT INTO state (stname) values("취소");
INSERT INTO state (stname) values("작업 전");
INSERT INTO state (stname) values("작업 완료");
INSERT INTO state (stname) values("전달 완료");

-- 취소사유 (업체용)
INSERT INTO cancel (reason) values("고객 요청으로 취소합니다.");
INSERT INTO cancel (reason) values("취급하는 품목이 아닙니다.(기타)");
INSERT INTO cancel (reason) values("기간 내에 작업을 완료할 수 없습니다.");
INSERT INTO cancel (reason) values("가게 내부 사정으로 취소합니다.");

-- 업체유형
INSERT INTO bizType (typename) values("일반 세탁소");
INSERT INTO bizType (typename) values("코인 세탁소");

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