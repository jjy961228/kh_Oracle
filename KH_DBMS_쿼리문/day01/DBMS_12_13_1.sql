--NOT NULL : ID와 PW같이 꼭 들어가야하는 데이터에 NOT NULL을 써준다
DROP TABLE STUDENT_NOTNULL;
CREATE TABLE STUDENT_NOTNULL(
    STUDENT_ID VARCHAR2(20) NOT NULL,
    STUDENT_PWD VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL,
    STUDENT_GENDER VARCHAR2(3),
    STUDENT_ADDRESS VARCHAR2(500)
    );

INSERT INTO STUDENT_NOTNULL
VALUES(NULL,NULL,NULL,NULL,NULL);   --cannot insert NULL into : NULL이 들어갈 수 없다  : 자주나오는 오류니까 외워두기

INSERT INTO STUDENT_NOTNULL
VALUES('KHUSER01','PASS01','일용자',NULL,NULL);        --다른곳에선 NULL이 들어갈 수 있다
COMMIT;



DROP TABLE STUDNET_UNIQUE;
CREATE TABLE STUDNET_UNIQUE(
    STUDENT_ID VARCHAR2(10) UNIQUE,
    STUDENT_PWD VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL,
    STUDENT_GENDER VARCHAR2(3) CHECK(STUDENT_GENDER IN ('남','여')),
    SUTDNET_ADDRESS VARCHAR2(500)
    );
INSERT INTO STUDNET_UNIQUE VALUES('KHUSER01','PASS01','일용자','남',NULL);      --unique constraint : 유니크 갑이라 'KHUSER01' 같은걸 넣을 수 없다, 
                                                                                --즉,unique는 중복을 허용하지않는다
INSERT INTO STUDNET_UNIQUE VALUES('KHUSER02','PASS02','이용자','여',NULL);
INSERT INTO STUDNET_UNIQUE VALUES('KHUSER03','PASS02','삼용자','M',NULL);        --check constraint
                                                                                --CHECK에 의해 '남','여' 만 들어가야하는데 다른게 들어가 서 오류났다 










                                                                                
CREATE TABLE STUDENT_PRIMARYKEY(
    STUDENT_ID VARCHAR2(20) PRIMARY KEY,
    STUDENT_PWD VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL,
    STUDENT_GENDER VARCHAR2(3),
    STUDENT_ADDRESS VARCHAR2(500)
);

INSERT INTO STUDENT_PRIMARYKEY                  --unique constraint:                                               
VALUES('KHUSER01','PASS01','일용자','남','서울'); --2번입력시나오는 오류  : PRIMARY KEY와 같은 오류이다







DROP TABLE USER_GRADE;

CREATE TABLE USER_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT INTO USER_GRADE VALUES(10,'일반회원');
INSERT INTO USER_GRADE VALUES(20,'우수회원');
INSERT INTO USER_GRADE VALUES(30,'특별회원');
COMMIT;

DROP TABLE USER_FOREIGHKEY;

CREATE TABLE USER_FOREIGHKEY(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_WPD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(3),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODEN NUMBER REFERENCES USER_GRADE(GRADE_CODE)        --(GRADE_CODE)생략가능 
    );
    
INSERT INTO USER_FOREIGHKEY
VALUES(1,'USER01', 'PASS01', '홍길동', '남', '010-1234-5678', 'HONG123@KH.OR.KR',10);

INSERT INTO USER_FOREIGHKEY
VALUES(2,'USER02', 'PASS02', '이순신', '남', '010-5678-9012', 'LEE123@KH.OR.KR',20);

INSERT INTO USER_FOREIGHKEY
VALUES(3,'USER03', 'PASS03', '유관순', '여', '010-9999-3131', 'YOO123@KH.OR.KR',30);
COMMIT;

INSERT INTO USER_FOREIGHKEY
VALUES(4,'USER04', 'PASS04', '임꺽정', '남', '010-3222-2323', 'LIM123',40);     --USER_GRADE에는 40이 없다 -> USER_FOREIGHKEY 에는 40이 있다 
                                                                            --이를 방지하기위해 부모(USER_GRADE) -> 자식(USER_FOREIGHKEY) 순으로 만든다
COMMIT;
                                                                                --자식테이블의 컬럼의 값을 부모테이블의 컬람값으로 사용하도록 설정하는 제약조건: 외래키(FOREIGN KEY)
DROP TABLE USER_FOREIGHKEY;

    


    