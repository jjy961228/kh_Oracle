CREATE TABLE COFFEE(
    PRODUCT_NAME VARCHAR2(20) CONSTRAINT PK_PRODUCTNAME PRIMARY KEY,
    PRICE NUMBER NOT NULL,
    COMPANY VARCHAR2(20) NOT NULL
);

INSERT INTO COFFEE VALUES('맥심커피', '3000', 'MAXIM');
INSERT INTO COFFEE VALUES('카누커피', '5000', 'MAXIM');
INSERT INTO COFFEE VALUES('네스카페커피', '4000', 'NESCAFE');
COMMIT;

SELECT * FROM KHUSER.COFFEE; --SYSTEM계정에서 권한받았으니까 볼 수 있다 
                            --기본적으로 자신(KHUSER)이 만든 테이블(COFFEE)은 자신(KHUSER)만 조회가능하지만
                            --권한부여(GRANT~~) 를 통해서 다른계정 (TEST01)이 조회가능하도록 할 수 있음.
                            --권한부여는 GRANT로 가능

INSERT INTO KHUSER.COFFEE 
VALUES('프렌치카페', 20000 , '남양유업');
COMMIT;