SET SERVEROUTPUT ON;

--PL/SQL
--> Procedural Language extension to SQL의 약자
--> 오라클 자체에 내장되어 있는 절차적 언어로써, SQL의 단점을 보완하여
-- SQL문장 내에서 변수의 정의, 조건처리, 반복처리 등을 지원함

-- @ PL/SQL 블록 문법
--  DECLARE            : 변수나 상수를 선언하는 부분, (선택)
--          [선언부]
--  BEGIN               : 제어문, 반복문, 함수 정의 등 로직 기술, 필수
--          [실행부]   실행부: INSERT, UPDATE, DELETE
-- EXCEPTION            :예외사항 발생시, 해결하기 위한 문장 기술,(선택)
--          [예외처리부]
-- END;                 : 블록종료, 필수
--  /                   : PL/SQL 종료,필수

BEGIN   
--실행부 필수
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL'); 
    --명령어
END;    
--블록종료
/       

SET SERVEROUTPUT ON;    
--이걸 실행해줘야 BEGIN문이 실행된다





-- 변수 선언
-- 변수형 [CONSTANT] 자료형(바이트크기) [NOT NULL] [:= 초기값];
DECLARE
    EMPNO NUMBER(4);
    TESTEMPNO NUMBER(5) := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(EMPNO);
END;
/

DECLARE
    EMPNO NUMBER := 1001;
    ENAME VARCHAR2(20) := '김사랑';
BEGIN
    DBMS_OUTPUT.PUT_LINE('사번 : '|| EMPNO );
    DBMS_OUTPUT.PUT_LINE('이름 : '|| ENAME );
END;
/

--상수: 일반변수와 유사하나 CONSTANT라는 키워드가 자료형 앞에 붙고
--선언시에 값을 할당해주어야함
DECLARE    
    USER_NAME CONSTANT VARCHAR2(20) := '홍길동'; --상수로 선언
    USER_EMAIL VARCHAR2(50) := 'khuser01@iei.or.kr';
BEGIN
    --USER_NAME := '강호동';   --상수는 변할수 없다
    DBMS_OUTPUT.put_line('상수값 : ' || USER_NAME);
    USER_EMAIL := 'khuser01@gamil.com';
    DBMS_OUTPUT.put_line('변수값 : ' || USER_EMAIL);
END;
/

--PL/SQL 에서 SELECT문
--SQL에서 이용하는 명렁어를 그대로 사용할 수 있으며,SELECT 쿼리 결과로
--나온 값을 변수에 할당하여 사용 가능

--예제1)
--PL/SQL의 SELECT문으로 EMPLOYEE 테이블에서 사번과 이름 조회하기
DECLARE
    VEMPNO EMPLOYEE.EMP_ID % TYPE;
    VENAME EMPLOYEE.EMP_NAME % TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO VEMPNO, VENAME
    FROM EMPLOYEE
    WHERE EMP_NAME= '송중기';
    DBMS_OUTPUT.PUT_LINE('사번 : ' || VEMPNO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || VENAME );
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('데이터음슴...');
    --NO_DATA_FOUND일때, 데이터음슴 이라고 출력해라
END;
/

--예제2
--사원번호를 입력받아서 사원의 사원번호,이름,급여,입사일을 출력하시오
DECLARE
    VEMPNO EMPLOYEE.EMP_ID % TYPE; 
    --EMPLOYEE테이블의 EMP_ID와 같은 타입을 쓰겠다 
    VEMPNAME EMPLOYEE.EMP_NAME % TYPE;
    VSALARY EMPLOYEE.SALARY % TYPE;
    VHIREDATE EMPLOYEE.HIRE_DATE  % TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME,SALARY, HIRE_DATE
    INTO VEMPNO,VEMPNAME,VSALARY,VHIREDATE 
    --값 입력받기
    FROM EMPLOYEE
    WHERE EMP_ID= '&EMPID';
    DBMS_OUTPUT.PUT_LINE('사원번호: ' || VEMPNO);
    DBMS_OUTPUT.PUT_LINE('이름: ' || VEMPNAME);
    DBMS_OUTPUT.PUT_LINE('급여: ' || VSALARY);
    DBMS_OUTPUT.PUT_LINE('입사일: ' || VHIREDATE);
 END; 
 /
 
 --문제1)
--사원 번호를 입력 받아서 받은 사원의 
--사원번호,이름,부서코드,부서명을 출력하도록 하시오
DECLARE
    EMPID EMPLOYEE.EMP_ID % TYPE; 
    --EMPLOYEE테이블의 EMP_ID와 같은 타입을 쓰겠다 
    EMPNAME EMPLOYEE.EMP_NAME % TYPE;
    DEPTCODE EMPLOYEE.DEPT_CODE % TYPE;
    DEPTTITLE DEPARTMENT.DEPT_TITLE % TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME , DEPT_CODE, DEPT_TITLE
    INTO EMPID, EMPNAME, DEPTCODE, DEPTTITLE
    --값을 위에있는 디클레어 에다가 담기
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CDOE = DEPT_ID
    WHERE EMP_ID = '&사원번호';
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || EMPID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || EMPNAME);
    DBMS_OUTPUT.PUT_LINE('부서코드 : ' || DEPTCODE);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || DEPTTITLE);
END;
/

    

