SET SERVEROUTPUT ON;
-- PL/SQL 반복문
-- BASIC LOOP : 조건없이 무한반복
-- 1 ~ 5까지 반복 출력하기
DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N+1;
        IF N>10 THEN EXIT;
        END IF;
    END LOOP;
END;
/

-- FOR LOOP
--> FOR LOOP문에서 카운트용 변수는 자동 선언되므로
--> 따로 변수 선언할 필요가 없음
--> 카운트 값은 자동으로 1씩 증가함
--> REVERSE는 1씩 감소함
BEGIN
    FOR N IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/
-- REVERSE
BEGIN
    FOR N IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/
-- 반복문을 이용하여 사원테이블에서 사원번호, 이름, 입사일을 출력하시오
-- 단, 사원번호가 200, 201, 202, 203, 204인 사원을 모두 출력하시오.
DECLARE
    USERINFO EMPLOYEE%ROWTYPE;
BEGIN
    FOR N IN 0..4 LOOP
        SELECT *
        INTO USERINFO
        FROM EMPLOYEE
        WHERE EMP_ID = 200 + N;
        DBMS_OUTPUT.put_line('사번 : '||USERINFO.EMP_ID);
        DBMS_OUTPUT.put_line('이름 : '||USERINFO.EMP_NAME);
        DBMS_OUTPUT.put_line('입사일 : '||USERINFO.HIRE_DATE);
        DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;
END;
/

-- 문제) 1 ~ 10까지 반복하여 KH_PLSQL 테이블에 저장되게 하시오.
CREATE TABLE KH_PLSQL(
    PL_NUM NUMBER UNIQUE,
    CONTENTS VARCHAR2(100),
    PL_DATE DATE
);

BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO KH_PLSQL VALUES(i, NULL, SYSDATE);
    END LOOP;
END;
/

SELECT COUNT(*) FROM KH_PLSQL;
SELECT PL_NUM FROM KH_PLSQL
WHERE PL_NUM < 11
ORDER BY 1;


-- WHILE LOOP
--> 제어 조건이 TRUE인 동안만 문장이 반복 실행됨
--> LOOP를 실행할 때 조건이 처음부터 FALSE이면 한번도 수행되지 않을 수 있음
DECLARE
    N NUMBER:=1;
BEGIN
    WHILE N <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/
