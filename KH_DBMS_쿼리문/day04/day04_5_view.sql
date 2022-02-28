-------------------------------------오라클 객체---------------------------
--SYSTEM 계정에서 권한을 줘야한다
CREATE VIEW V_EMPLOYEE(사번,이름,이메일,번호)
AS SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE;

SELECT * FROM V_EMPLOYEE;
--1)
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') "GENDER"
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--2) CREATAE VIEW로 만들어 놓으면 아예 박제시켜놓을 수있다. -> 코드의 재활용성
CREATE VIEW G_EMPLOYEE AS
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') "GENDER"
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--3)
SELECT * FROM G_EMPLOYEE;

--4)갑자기 여기서 근무년수를 추가하고싶다, 사번,이름,직급,성별,근속년수 추가하고싶다 --> 안댄다 드랍하거 해야한다
CREATE VIEW G_EMPLOYEE (사번,이름,직급,성별,근속년수) AS
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') "GENDER",
EXTRACT( YEAR FROM SYSDATE) - EXTRACT(YEAR FROM JIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--5)
CREATE OR REPLACE VIEW G_EMPLOYEE (사번,이름,직급,성별,근속년수) AS
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') "GENDER",
EXTRACT( YEAR FROM SYSDATE) - EXTRACT(YEAR FROM JIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--뷰를 사용하는 이유?
--1.민감한 정보 숨김 가능 
--2. 가공된 데이터 편리하게 출력 가능
SELECT * FROM USER_VIEWS;           --> VIEW의 모든정보 가지고있다 (VIEW 사전)











-- 오라클 객체!
SELECT * FROM EMPLOYEE;

CREATE VIEW V_EMPLOYEE(사번,이름,이메일,번호)
AS SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE;

SELECT * FROM V_EMPLOYEE;

CREATE VIEW G_EMPLOYEE AS
SELECT 
    EMP_ID, 
    EMP_NAME, 
    JOB_NAME, 
    DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') "GENDER"
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);


CREATE OR REPLACE VIEW G_EMPLOYEE(사원번호, 이름, 직급, 성별, 근속년수) AS
SELECT 
    EMP_ID, 
    EMP_NAME, 
    JOB_NAME, 
    DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여'),
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);
DROP VIEW G_EMPLOYEE;


SELECT * FROM G_EMPLOYEE;
-- 뷰를 쓰는 이유?
-- 1. 민감한 정보 숨김 가능
-- 2. 가공된 데이터 편리하게 출력가능

SELECT * FROM USER_VIEWS; -- View에 대한 모든 정보를 가지고 있음. (데이터 딕셔너리)



--Data Dictionary란?     SELECT * FROM USER_VIEWS;
--> 다양한 정보를 저장하고있고 , 저장하는 시스템
--Data Dictionary는 사용자가 테이블을 생성하거나 사용자를 변경하는 동의
--작업을 할 떄, 데이터 베이스 서버에 의해 자동으로 갱신이 됨.
--사용자는 Data Dioctionary의 내용을 직접 수정하거나 삭제할 수 없고 , 조회만 가능
--Data Dictionary View :    SELECT * FROM USER_VIEWS;
--종류
--1. DBA_XXX :데이터 베이스 관리자만이 접근이 가능한 객체 등에 관한 정보 조회
--2. ALL_XXX : 자신의 계정이 소유하거나 권한을 부여받은 객체 등에 관한 정보 조회
--3. USER_XXX : 자신의 계정이 소유한 객체 등에 관한 정보 조회
SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS;  --USER_CONSTRAINTS라는 VIEW를 통해서 
SELECT USERNAME FROM DBA_USERS;


--관리자 계정
-- 1. SYS(최고의 권한): Oracle 관리자, Super User, Oracal 시스템의 기반이 되는 Data Dictionary 소유자이며,
--                         DB생성과 삭제가능, Oracale 시스템의 총관리자 
--             접속하는법) sys as sysdba
-- 2. SYSTEM: sys와 유사한 권한을 가지고 있지만 DB생성과 삭제는 불가능함
-- 생성된 DB를 운영,관리하기위한 계정
--     접속하는방법): SYSTEM , PASSWORD: 





