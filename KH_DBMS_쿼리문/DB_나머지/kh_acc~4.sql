------------------------------TCL--------------------------------------
--TCL(Transaction Control Language)
--ex)ATM : (카드삽입>메뉴선택>출금>금액>비번>돈수령) 과 같은 한꺼번에 처리해야하는 것
--      중간에 비번을 틀리면 처음으로 돌아가게~

CREATE TABLE KH_TRANSACTION(
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL
    );

INSERT INTO KH_TRANSACTION
VALUES(1, 'khuser01', 'pass01');

INSERT INTO KH_TRANSACTION
VALUES(2, 'khuser02', 'pass02');

INSERT INTO KH_TRANSACTION
VALUES(3, 'khuser03', 'pass03');
COMMIT;
--> INSERT,UPDATE,DELETE 를 사용하면 트렌젝션이 걸려있는 상태이고 , COMMIT OR ROLLBACK을 해줘야한다
--> COMMIT OR ROLLBACK을 해줘여한다

INSERT INTO KH_TRANSACTION
VALUES(4, 'khuser04', 'pass04');
SAVEPOINT SP1;                  --SAVEPOINT: 임시저장해준다 

INSERT INTO KH_TRANSACTION
VALUES(5, 'khuser05', 'pass05');

ROLLBACK to SP1;            -- SP1로 돌아간다         

ROLLBACK;                                --마지막으로 COMMIT한 시점으로 되돌림



--TEST 01에서 KH_TRANSACTION 에게 테이블 볼 수 있는 권한주기
--1)SYSTEM 계정에서 권한주기 : GRANT SELECT ON KH.KH_TRANSACTION TO TEST01;
--2)TEST01 계정에서 출력하기 : SELECT * FROM KH.KH_TRANSACTION;
--3)SYSTEM 계정에서 권한뺏기 : REVOKE SELECT ON KH.KH_TRANSACTION FROM TEST01

 

