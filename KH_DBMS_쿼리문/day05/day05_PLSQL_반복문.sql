--PL/SQL IF문
--PL/SQL의 선택문
--> 모든 문장들은 기술한 순서대로 순차적으로 수행됨
--> 문장을 선택적으로 수행하려면 IF문을 사용하면됨

--예제) 사원번호를 가지고 사원의 사번,이름,급여,보너스율을
--      출력하고 보너수율이 없으면 '보너스를 지급받지 않는 사원입니다'를 출력하시오

SELECT NVL(BONUS,0) FROM EMPLOYEE;      --보너스가 NULL이면 0으로 출력

DECLARE
    EMPID EMPLOYEE.EMP_ID % TYPE;
    EMPNAME EMPLOYEE.EMP_NAME % TYPE;
    SALARY EMPLOYEE.SALARY % TYPE;
    BONUS EMPLOYEE.BONUS % TYPE;

BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY, NVL(BONUS,0)
    INTO EMPID,EMPNAME,SALARY,BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = '&EMP_ID';   
    --거의 마지막에 입력받는곳 써준다
    DBMS_OUTPUT.put_line('사원번호: ' || EMPID);
    DBMS_OUTPUT.put_line('이름: ' || EMPNAME);
    DBMS_OUTPUT.put_line('급여: ' || SALARY);
    DBMS_OUTPUT.put_line('보너스율: ' || BONUS);
    --이것도 주석처리해야지 ELSE햇을때 완벽한문장이다
    IF(BONUS = 0)
    THEN DBMS_OUTPUT.put_line('보너스를 지급받지않는 사원입니다');
    --ELSE DBMS_OUTPUT.put_line('보너스율: ' || BONUS * 100 || '%');
    END IF;
    --보너스가 0이면 '보너스를 지급받지않는 사원입니다' 출력
END;
/
-- 사원코드를 입력받았을 때, 사번, 이름, 직급코드, 직급명, 소속 값을 출력하시오
-- 단, 소속값은 J1,J2는 임원진, 그외에는 일반직원으로 출력되게 하시오.
--1)
DECLARE
    EMPID EMPLOYEE.EMP_ID%TYPE;
    EMPNAME EMPLOYEE.EMP_NAME%TYPE;
    JOBCODE EMPLOYEE.JOB_CODE%TYPE;
    JOBNAME JOB.JOB_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
    INTO EMPID, EMPNAME, JOBCODE, JOBNAME
    FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    WHERE EMP_ID = 202;
    DBMS_OUTPUT.PUT_LINE('사원번호 : '||EMPID);
    DBMS_OUTPUT.PUT_LINE('이름 : '||EMPNAME);
    DBMS_OUTPUT.PUT_LINE('직급코드 : '||JOBCODE);
    DBMS_OUTPUT.PUT_LINE('직급명 : '||JOBNAME);
    IF(JOBCODE IN ('J1','J2'))  --IF문 두개안써도 된다 
    THEN DBMS_OUTPUT.PUT_LINE('소속 : 임원진');
    ELSE DBMS_OUTPUT.PUT_LINE('소속 : 일반직원');
    END IF;
END;
/
--2)이게 깔끔하다
DECLARE
    EMPID EMPLOYEE.EMP_ID%TYPE;
    EMPNAME EMPLOYEE.EMP_NAME%TYPE;
    JOBCODE EMPLOYEE.JOB_CODE%TYPE;
    JOBNAME JOB.JOB_NAME%TYPE;
    ETEAM VARCHAR2(20);
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
    INTO EMPID, EMPNAME, JOBCODE, JOBNAME
    FROM EMPLOYEE
    JOIN JOB USING(JOB_CODE)
    WHERE EMP_ID = '&EMPID';
    
    IF(JOBCODE IN ('J1','J2'))
    THEN ETEAM := '임원진';
    ELSE ETEAM := '일반직원';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : '||EMPID);
    DBMS_OUTPUT.PUT_LINE('이름 : '||EMPNAME);
    DBMS_OUTPUT.PUT_LINE('직급코드 : '||JOBCODE);
    DBMS_OUTPUT.PUT_LINE('직급명 : '||JOBNAME);
    DBMS_OUTPUT.PUT_LINE('소속 : '||ETEAM);
END;
/

-- IF~ ELSIF ~ ELSE ~ END IF
--사번을 입력 받은 후 급여에 따라 등급을 나누어 출력하도록 하시오 
--그때 출력 값은 사번,이름,급여,급여등급을 출력하시오

--0만원 ~ 99만원 : F
--100만원 ~ 199만원 : E
--200만원 ~ 299만원 : D
--300만원 ~ 399만원 : C
--400만원 ~ 499만원 : B
--500만원 이상(그외) : A
--CASE로 한 코드 
DECLARE
    EMPID EMPLOYEE.EMP_ID%TYPE;
    EMPNAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    SALGRADE VARCHAR2(3);
BEGIN
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO EMPID, EMPNAME, SALARY
    FROM EMPLOYEE
    WHERE EMP_ID = '&EMPID';
    
    SALARY := SALARY / 10000;
    
    CASE FLOOR(SALARY/100)
        WHEN 0 THEN SALGRADE := 'F';
        WHEN 1 THEN SALGRADE := 'E';
        WHEN 2 THEN SALGRADE := 'D';
        WHEN 3 THEN SALGRADE := 'C';
        WHEN 4 THEN SALGRADE := 'B';
        ELSE SALGRADE := 'A';
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('사원번호 : '||EMPID);
    DBMS_OUTPUT.PUT_LINE('이름 : '||EMPNAME);
    DBMS_OUTPUT.PUT_LINE('급여 : '||SALARY*10000);
    DBMS_OUTPUT.PUT_LINE('급여등급 : '||SALGRADE);
END;
/

---------------------for문--------------------------------------
DECLARE
    USERINFO EMPLOYEE%ROWTYPE;
BEGIN
    FOR N IN 0..4 LOOP
        SELECT *
        INTO USERINFO
        FROM EMPLOYEE
        WHERE EMP_ID = 200 + N;
        DBMS_OUTPUT.PUT_LINE('사번 : '||USERINFO.EMP_ID);
        DBMS_OUTPUT.PUT_LINE('이름 : '||USERINFO.EMP_NAME);
        DBMS_OUTPUT.PUT_LINE('입사일 : '||USERINFO.HIRE_DATE);
        DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;
END;
/

--문제1) 1~1-10까지 반복하여 KH_PKSQL 테이블에 데이터 저장되게하시오.
CREATE TABLE KH_PLSQL(
    PL_NUM NUMBER UNIQUE,
    CONTENTS VARCHAR2(100),
    PL_DATE DATE
    );

DROP TABLE KH_PLSQL;

BEGIN
    FOR i IN 1..10000 LOOP          --10000개 인서트하기
        INSERT INTO KH_PLSQL VALUES(i,null,SYSDATE);
    END LOOP;
END;
/
SELECT COUNT(*) FROM KH_PLSQL;
SELECT PL_NUM FROM KH_PLSQL
WHERE PL_NUM < 11
ORDER BY 1;

--WHILE LOOP
--> 제어조건이 TRUE인 동안만 문장이 반복됨
-->LOOP를 실행할때 조건이 처음부터 FALSE이면 한번도 수행되지 않을 수 있음
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

    

