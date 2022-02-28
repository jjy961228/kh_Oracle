

-- 실습문제3
-- EMPLOYEE 테이블의 모든 직원의 이름, 주민번호, EMAIL을 출력하시오
-- 단, 출력시 EMAIL의 주소를 kh.or.kr에서 iei.or.kr로 변경하여 출력하시오.
-- 단, id에 kh가 있으면 변경되지 않도록 하시오(id: @앞부분)
--      id안에 kh가 있다면 그것도 iei로 바뀌기때문에 생각해줘야한다
SELECT * FROM EMPLOYEE;
--1)ID의 문자갯수는 @의 위치에따라 달라진다 -> INSTR 이용해서 @의 위치를 추적
SELECT 
    EMP_NAME,
    EMP_NO,
    INSTR(EMAIL,'@')
FROM EMPLOYEE;
--2)SUBSTR 이용해서 @부터 잘라서 가져온다
SELECT 
    EMP_NAME,
    EMP_NO,
    SUBSTR(EMAIL ,INSTR(EMAIL,'@'))     --EMAIL에서, @부터 모두 잘라서 가져온다
FROM EMPLOYEE;
--3)REPLACE 이용해 KH -> IEI 로 바꿔준다
SELECT 
    EMP_NAME,
    EMP_NO,
    REPLACE(SUBSTR(EMAIL ,INSTR(EMAIL,'@')),'kh','iei')     --EMAIL에서, @부터 모두 잘라서 가져온다
FROM EMPLOYEE;
--4)
SELECT 
    EMP_NAME,
    EMP_NO,
    SUBSTR(EMAIL,1,(INSTR(EMAIL,'@')-1)) ||              --SUBSTR이용해서 EMAIL의/ 1번째부터/@앞까지 가져온다
    REPLACE(SUBSTR(EMAIL ,INSTR(EMAIL,'@')),'kh','iei')    
FROM EMPLOYEE;

--TRIM: 원하는 문자 지운다  
--LTRIM('EMAIL', '@') : EMAIL에서 왼쪽부터 @ 제거 
--RTRIM
SELECT TRIM ('1' FROM '123123KH123123123') FROM DUAL;   --TRIM은 문자를 단 한개밖에 못지운다
SELECT LTRIM('123123KH123123','123') FROM DUAL; --왼쪽부터 1,2,3씩 제거하다가 KH(지울게 없을때)만나면 끝낸다
SELECT RTRIM('ACABACCKH' , 'ABC') FROM DUAL;    --오른쪽부터 바로 지울게없는걸 만나서 지우지않는다
SELECT LTRIM('ACABACCKH' , 'ABC') FROM DUAL;    --왼쪽부터 A,B,C순으로 지운다, KH만나면 멈춘다


--LENGTH(컬럼): 주어진 컬림 값,문자열의 갯수를 반환하는 함수
--LENGTHB(컬럼) : 갯수를 BYTE값으로 반환한다  -> 한글 1글자: 3Byte      영어 1글자: 1byte
SELECT
    EMP_NAME,
    LENGTHB(EMP_NAME),
    EMAIL,
    LENGTHB(EMAIL)
FROM EMPLOYEE;

--LPAD,RPAD(컬럼,공간크기,'채울값')
--LPAD(EMAIL,20,'#'): EMAIL의 / 공간을 20/ 왼쪽부터 빈공간을 #으로 채운다
--RPAD(EMAIL,20,'#'): EMAIL의 / 공간을 20/ 오른쪽부터 빈공간을 #으로 채운다 
SELECT  LPAD(EMAIL,20 ,'#') FROM EMPLOYEE;
SELECT RPAD(EMAIL,30,'%') FROM EMPLOYEE;

----TRIM 실습문제
-- 실습 문제 1
-- Hello KH Java 문자열을 Hello KH 가 출력되게 하여라.
SELECT 'HELLO KH JAVA' FROM DUAL;
SELECT RTRIM('HELLO KH JAVA' ,'JAVA') FROM DUAL;

-- 실습 문제 3 (TRIM으로 해보세요)
-- DEPARTMENT 테이블에서 DEPT_TITLE을 출력하여라
-- 이때, 마지막 '부' 글자를 빼고 출력되도록 하여라 / ex)회계관리부 -> 회계관리
SELECT DEPT_TITLE FROM DEPARTMENT;
SELECT RTRIM(DEPT_TITLE, '부') FROM DEPARTMENT;

-- 실습 문제 4(*)
-- 다음문자열에서 앞뒤 모든 숫자를 제거하세요.
-- '982341678934509hello89798739273402'
SELECT RTRIM(LTRIM ('982341678934509hello89798739273402' , '0123456789'),'0123456789') FROM DUAL;
                    ----LTRIM:왼쪽의 0123456789 제거 후 ,   RTRIM: 오른쪽의 0123456789
  
                    
--LOWER: 소문자로 변환
--UPPER: 대문자로 변환
--INITCAP : 초기글자를 대문자로 변환
SELECT INITCAP(EMAIL) FROM EMPLOYEE;
                    
                    
----------------------숫자처리함수------------------
--EX) 123.456 -> -3/-2/-1/   .   /0/1/2
-- 
               1  2 3     .    4 5 6    
--ABS: 절댓갓
--MOD: 나머지값 반환      MOD(11.3) ->2
--ROUND: 반올림            ROUND(123.456): 소수점 첫재짜리에서 반올림 -> 123       ROUND(123,456 ,1) : 소수점 둘쨋자리에서 반올림
--FLOOR: 소수점아래 버림
--TRUNC : 특정자릿수 버림
--CEIL: 특정자릿수 올림

---------------------날짜처리함수---------------------
--SYSDATE : 현재날짜 반환
--NEXT_DAY(SYSDATE,'월요일'): 현재시각 날짜~ 다음주 월요일을 'YY'-'MM'-'DD'로 나타낸다
--                             다음주~
SELECT NEXT_DAY(SYSDATE, 1) FROM DUAL;      -- 1:일요일 ~ 7:토요일
SELECT NEXT_DAY(SYSDATE, '일') FROM DUAL;
--LAST_DAY(SYSDATE): 해당 달 의 마지막일이 몇일인가 -> 21/12/31
--                      이번달~
SELECT LAST_DAY(SYSDATE) FROM DUAL;   
--EXTRACT(YEAR FROM SYSDATE) : 해당 날짜의 YEAR,MONTH,DAY 를 쪼개서 출력 가능하다
--EXTRACT(MONTH FROM SYSDATE)
--EXTRACT(DAY FROM SYSDATE)
SELECT 
    EXTRACT(YEAR FROM HIRE_DATE) FROM EMPLOYEE;
--MONTHS_BETWEEN(SYSDATE,HIRE_DATE) : 현재~입사일 사이의 개월수 조회
SELECT MONTHS_BETWEEN(SYSDATE,HIRE_DATE) FROM EMPLOYEE;
--ADD_MONTHS(HIRE_DATE, 6) : 입사일~ / 6개월 후 날짜조회
SELECT ADD_MONTHS(HIRE_DATE,6) FROM EMPLOYEE;

-------- EXTRACT, MONTH_BETWEEN, ADD_MONTHS, NEXT_DAY, LAST_DAY 연습문제
 -- @ 실습문제 1
-- EMPLOYEE 테이블에서 사원의 이름,입사일,년차를 출력하여라. 
-- 단, 입사일은 YYYY년M월D일로 출력하도록 하여라.
-- 년차 출력은 소수점 일경우 올림으로 하여 출력하여라. (28.144 -> 29년차)
-- (출력시 정렬은 입사일 기준으로 오름차순)
SELECT 
    EMP_NAME,
    EXTRACT(YEAR FROM HIRE_DATE) || '년'
    ||EXTRACT(MONTH FROM HIRE_DATE) || '월'
    ||EXTRACT(DAY FROM HIRE_DATE) || '일' AS 입사일,
    CEIL((SYSDATE-HIRE_DATE)/365)
FROM EMPLOYEE;

-- @ 실습문제 2(*)
-- 특별 보너스를 지급하기 위하여 자료가 필요하다
-- 입사일을 기점으로 다음달 1일 부터 6개월을 계산하여 
-- 출력하시오 (이름,입사일,기준일,기준일+6,기준달(월))
-- ex) 90년2월6일 입사 -> 90년3월1일 부터 계산
-- ex) 90년2월26일 입사 -> 90년3월1일 부터 계산
-- ex) 97년12월1일 입사 -> 98년1월1일 부터 계산
-- 출력시 입사일 기준으로 정렬하시오
-- LAST DAY: 달의 마지막날이 나온다        +1   -> 다음 달 1일이 나온다
-- ADD_MONTH(기준일,6) : 기준일로부터 6개월 지난달
SELECT EMP_NAME, HIRE_DATE, 
    LAST_DAY(HIRE_DATE)+1 "기준일", 
    ADD_MONTHS(LAST_DAY(HIRE_DATE)+1,6) "기준일+6",
    EXTRACT(MONTH FROM ADD_MONTHS(LAST_DAY(HIRE_DATE)+1,6)) "기준(월)"
FROM EMPLOYEE;

/*  (*)
    만약에 자신이 오늘 군대에 간다고 합시다.
    군복무 기간은 1년 6개월이라고 가정하면
    1. 제대일자가 언제인지 구하고
    2. 제대일자까지 먹어야하는 짬밥의 그릇수를 구해보세요
    (단, 1일 3끼 무조건 먹는다고 가정합니다)
    테이블은 DUAL로 하세요.
*/
SELECT 
    SYSDATE, 
    ADD_MONTHS(SYSDATE,18) "전역일",
    (ADD_MONTHS(SYSDATE, 18) - SYSDATE)*3 "남은짬밥수"
FROM DUAL;



------------------------------------형변환 함수-----------------------------------
----------형식문자------------
-- 문자 -> DATE  OR  DATE -> 문자  변환할때 많이쓴다
--정해진 형식(YYYY,MM,DD,HH,MI,SS,FM을 가장 많이쓴다)
--YYYY : 년도표현(4자리)       YY: 년도표현(2자리)
--MONTH: 월표시 ,            MM:월을 숫자로 표시,         MON: 월을 한글로표시 
--DD: 일표현
--D: 요일표현(숫자로 1:일요일) ,      DAY:요일표현,        DY:요일 약어
--HH,HH12 : 시간표현(12시간으로표현),     HH24(24시간으로 표현)
--MI: 분     SS:초
--FM: 월,일,시,분,초,앞의 0을 제거    EX)2021-09-06  --> 2021-9-6     SPRING에서 쓸때가많다
--YYYY/MM/MM HH:MI:SS   : 연/월/일 시:분:초

---------------------------------------------------------------------
--1)DATE -> 문자
--TO_CHAR(HIRE_DATE) -> DATE를 문자형으로만 바꿈
--TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') -> DATE를 / 'YYYY-MM-DD' 형식의 문자열로 바꿈
SELECT 
    HIRE_DATE,
    TO_CHAR(HIRE_DATE , 'YYYY-MM-DD'),
    TO_CHAR(HIRE_DATE , 'YYYY/MM/DD'),
    TO_CHAR(HIRE_DATE , 'YY/MM/DD')
    FROM EMPLOYEE;
--2)문자 -> DATE :  ~년도이후를 조회할때 사용
SELECT EMP_NO,
    EMP_NAME,
    HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE >= TO_DATE('1/12/31', 'YY/MM/DD');  
---------------------------------------------------------------
--1)문자 -> 숫자 ????
SELECT 
TO_NUMBER('-1,000,000' , '999,999,999.') - TO_NUMBER('550,000' , '999,999,999.') 
FROM DUAL;

SELECT '1000000' - '550000' FROM DUAL;  --이건 굳이 TO_NUMBER안해도 자동 형변환으로 인해 계산이 가능하다

--  , (9,999,999) : 콤마형식으로 변환
--  . (99.99)       : 소수점 형식으로 변환
--0 : 맨 왼쪽에 0을 삽입
--9 : 존재하는 숫자만 표현

--NULL 처리함수
--NULL(BONUS,0) : BONUS값이 NULL이면 0으로 바꿔줘~
--ex1)
SELECT 
    EMP_NO, EMP_NAME, SALARY, NVL(BONUS,0), (SALARY + SALARY*NVL(BONUS,0)) *12
FROM EMPLOYEE;
--ex2)
SELECT NVL(MANAGER_ID, '매니저 없음') , NVL(DEPT_CODE , '미지정')
FROM EMPLOYEE;
------------------------------선택함수---------------------------------
--DECODE: IF문과 비슷하다 ,일치하는 값 ?
--EX) 1 남/ 2 여/ 3 남/ 4 여/ 출력
SELECT SUBSTR(EMP_NO,8,1) FROM EMPLOYEE;    --주민번호에서 필요한 성별만 추출 후 가져오기   
SELECT
    DECODE(SUBSTR(EMP_NO,8,1), '1' ,'남', '2' , '여')         AS 성별 
--          비교식            , '1' , '남' , '2', '여'       -> 1이면 남, 2이면 여
FROM EMPLOYEE;

--CASE: IF 문과 비슷하다          --DECODE와 차이점 : 범위설정 가능
--CASE WHEN     THEN      ELSE                  END
SELECT  
    CASE WHEN SUBSTR(EMP_NO,8,1) = 1 THEN '남'
         WHEN SUBSTR(EMP_NO,8,1) = 3 THEN '남'
         ELSE '여'
    END
FROM EMPLOYEE;

-------------CASE 연습문제
-- EMPLOYEE 테이블에서 출생년도 기준 60년대 생 직원에 대하여 
-- 65년이전 출생자는 60년생 초반, 65년 이후 출생자는 60년생 후반이라고 출력하시오
SELECT * FROM EMPLOYEE; 
SELECT 
    EMP_NAME ,EMP_NO,
    CASE WHEN SUBSTR(EMP_NO,1,2) BETWEEN 60 AND 64
        THEN '60년생초반'
        ELSE '60년생후반'
    END "60년생"  --새로만든 열의 이름 
FROM EMPLOYEE;

--SUM, AVG, COUNT, MAX, MIN
SELECT SUM(SALARY) FROM EMPLOYEE;
SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT COUNT(*) FROM EMPLOYEE;      --행의갯수가 나온다
SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEE;


----------------------------------GROUP_BY--------------------------------
--Group함수 : 여러개의 행이 들어가서 하나의 값이 나온다
--GROUP BY: WHERE 대신에 HAVING을 쓴다
--HAVING절은 GROUP BY 다음에 들어가야한다 
--COUNT(*) : 행의 갯수를 세어주는 함수     COUNT(DEPT_CODE)가 들어가도 된다


-------------예제문제
--1) 확인작업: SUM(SALARY) 는 합계니까 DEPT_CODE의 한 행마다 SUM을 구하지 못한다
--                >> SUM 은 1개의 값만 나올  수 있다 >>그룹별로 나눠서 SUM을 구해야한다
SELECT SUM(SALARY) FROM EMPLOYEE;

SELECT 
    DEPT_CODE, SUM(SALARY) 
FROM EMPLOYEE 
WHERE DEPT_CODE != 'D5'
GROUP BY DEPT_CODE
HAVING SUM(SALARY) > 7000000 -- 그룹바이를 한 결과값에서 조건을 걸때 해빙을 쓴다.
ORDER BY 1 ASC;

-- GROUP BY 연습문제
 -- @ 실습 문제 1
--EMPLOYEE 테이블에서 직급이 J1을 제외하고, 직급,직급별 사원수 및 평균급여를 출력하세요.    --직급별: GROUP   ,사원수: SUM
--1) 평균 -> 1개의 데이터밖에 안나온다 -> GROUP BY 필요
--1)직급별 평균급여
SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT  
    JOB_CODE,
    AVG(SALARY),
    COUNT(*)        --  =COUNT(JOB_CDEE) : 사원수
FROM EMPLOYEE
GROUP BY JOB_CODE;
--2
SELECT  
    JOB_CODE,
    AVG(SALARY),
    COUNT(*)        
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING JOB_CODE != 'J1'
ORDER BY 1;



--WHERE JOB_CODE != 'J1'
--WHERE JOB_CODE NOT LIKE 'J1'

-- @ 실습 문제 2
-- EMPLOYEE테이블에서 직급이 J1을 제외하고,  
-- 입사년도별 인원수를 조회해서, 입사년 기준으로 오름차순 정렬하세요.
SELECT EXTRACT(YEAR FROM HIRE_DATE) "입사년도", COUNT(*) "인원수" FROM EMPLOYEE
WHERE JOB_CODE != 'J1'
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
ORDER BY 1 ASC;

--@ 실습 문제 3
--부서내 성별 인원수를 구하세요.
-- 다음과 같이 출력 되도록 만드시오
--ex)
--D1	남	2
--D1	여	1
--1)
SELECT COUNT(*) FROM EMPLOYEE;
--2)
SELECT COUNT(*) FROM EMPLOYEE;
GROUP BY DECODE(SUBSTR(EMP_NO,8,1),1, '남', 2, '여')
ORDER BY 1 ASC;
--3) 부서 내 성별
SELECT DEPT_CODE ,DECODE(SUBSTR(EMP_NO,8,1),1, '남', 2, '여') ,COUNT(*) FROM EMPLOYEE;
GROUP BY DEPT_CODE ,DECODE(SUBSTR(EMP_NO,8,1),1, '남', 2, '여')
ORDER BY 1 ASC;
--4)최종
SELECT 
    DEPT_CODE "부서",
    DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여') "성별", 
    COUNT(*) "인원수" 
FROM EMPLOYEE
GROUP BY DEPT_CODE, DECODE(SUBSTR(EMP_NO,8,1),1,'남',2,'여')
ORDER BY 1 ASC;


-- EMPLOYEE 테이블에서 직급별 사원수 및 급여합계를 출력하세요.
SELECT COUNT(*), SUM(SALARY) FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

--그룹별 산출한 결과값과 관련한 함수 : ROLLUP  : 마지막에 합계까지 나와서 한 행이 추가된다
SELECT COUNT(*), SUM(SALARY) FROM EMPLOYEE
GROUP BY ROLLUP (JOB_CODE)
ORDER BY 1;
--CUBE
SELECT COUNT(*), SUM(SALARY) FROM EMPLOYEE
GROUP BY CUBE (JOB_CODE)
ORDER BY 1;

--ROLLUP , CUBE: 중간중간 집계낼때 사용한다
--부서내 직급별 합계, 부서별 합계
SELECT (DEPT_CODE,JOB_CODE) ,COUNT(*), SUM(SALARY) FROM EMPLOYEE
GROUP BY ROLLUP (DEPT_CODE,JOB_CODE)
ORDER BY 1;
--부서내 직급별 합계, 부서별 합계 + 직급별 합계
SELECT (DEPT_CODE,JOB_CODE),COUNT(*), SUM(SALARY) FROM EMPLOYEE
GROUP BY CUBE (JOB_CODE)
ORDER BY 1;



----------------------------------------집합연산자------------------------------
--UNION: A U B , 중복값 제외 
--UNION ALL : A U B + 중복값도 같이 나온다
--INTERSECT :   A n B : 중복값찾기  
--MINUS: A-B : 중복값 제거한다
--주의할점)
--1) 컬럼의 갯수가 같아야한다
--2) 데이터의 타입이 같아야한다 (숫자

SELECT 
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION           --UNION ALL : A U B + 중복값도 같이 나온다
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000;

---------------------------------------JOIN의 종류-------------------------------------
--1) INNER JOIN(교집합): NULL인건 안나온다 
SELECT EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

-- EMPLOYEE.JOB_CDE 와  JOB.J0B_CODE가 겹친다 -> ON(EMPLOYEE.JOB_CDE = JOB.J0B_CODE) -> USING(JOB_CODE)
SELECT EMP_ID,EMP_NAME, JOB_CODE
FROM EMPLOYEE;
SELECT JOB_CODE, JOB_NAME
FROM JOB;
--USING : 컬럼명이 겹칠때 편하게 사용하는 방법 
SELECT EMP_ID,EMP_NAME, JOB_CODE
FROM EMPLOYEE JOIN JOB USING(JOB_CODE);

--2)LEFT OUTER JOIN(합집합): 왼쪽을 기준으로 출력  -> "E"를 기준으로 NULL인 것도 같이 출력 
SELECT EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE  LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--3)RIGHT OUTER JOIN(합집합) : NULL출력가능
SELECT EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
-- 4.FULL OUTER JOIN(합집합) : NULL출력가능
SELECT EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);


--다중JOIN--
SELECT * FROM LOCATION;     --PK: LOCAL_CODE
SELECT * FROM DEPARTMENT;   --FK: LOCAL_CODE        --> JOIN 가능!
SELECT * FROM EMPLOYEE;
-- EMPLOYEE테이블, DEPARTMENT 테이블, LOCATION 테이블을 모두 조인하시오
-- EMPLOYEE - DEPARTMENT - LOCATION
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, LOCAL_NAME
FROM EMPLOYEE 
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE);

--------------다중 JOIN 간단 실습 
-- 각 사원들의 이름,나이,부서명,직책명을 출력하여라.
-- (부서코드,직책코드가 아닌 부서명과 직책명을 출력하여야 함)
SELECT * FROM EMPLOYEE; 
SELECT * FROM DEPARTMENT;  
SELECT * FROM LOCATION;

SELECT 
    EMP_NAME,
    EXTRACT(YEAR FROM SYSDATE) - (1900+ SUBSTR(EMP_NO,1,2)) "나이",   --(올해 년도만 출력) - (1900+ 년생 잘라서가져오기) =나이
    DEPT_CODE,
    JOB_CODE
FROM EMPLOYEE "E" JOIN DEPARTMENT "D"
ON(E.DEPT_CODE = D.DEPT_ID)
JOIN JOB "J" 
USING(JOB_CODE);    --D.JOB_CODE = J.JOB_CODE   =>    USING(JOB_CODE)


--CROSS JOIN 
--SELF JOIN 
----자기 자신의 매니저이름을 출력하시오
--1) 첫번째 접근 : 윤은해를 관리해주는 사람이 하이유다
--2_ 두번째 접근 : 하이유를 관리해주는 사람이 선동일이다
--3_ 세번째 접근 : 따라서, 선동일 > 하이유 > 윤은해 순으로 큰 직급이다
--4) 네번째 접근 : EMP에서 MANAGER_ID 를 찾는다    
            --    MANAGER에서 EMP_ID을 찾는다 
            --    EMP.MANAGER_ID = MANAGER.EMP_ID
SELECT * FROM EMPLOYEE;
SELECT EMP.EMP_ID, EMP.EMP_NAME, EMP.MANAGER_ID, MNG.EMP_NAME
FROM EMPLOYEE EMP
JOIN EMPLOYEE MNG ON (EMP.MANAGER_ID = MNG.EMP_ID);

SELECT 
    E.EMP_ID,
    E.EMP_NAME,
    E.MANAGER_ID,
    M.EMP_NAME
FROM EMPLOYEE "E" JOIN EMPLOYEE "M"
ON (E.MANAGER_ID = M.EMP_ID);

--자신이 관리하고 있는 사원의 이름,급여 및 직급이 어떻게 되는지 검색하여라.
--테이블 생각할때   
SELECT * FROM EMPLOYEE;
SELECT 
E.MANAGER_ID,
M.EMP_NAME,
E.EMP_ID,
E.EMP_NAME,
E.SALARY
FROM EMPLOYEE "E" JOIN EMPLOYEE "M"
ON ( E.MANAGER_ID = M.EMP_ID);
--결론) 선동일 > 하이유 > 윤은해  순으로 , 부장>팀장>인턴  순이다


SELECT * FROM EMPLOYEE;
SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%' ESCAPE '#' ; -- _앞에 세자리를 구하고싶다  그런데 , ____ 네번째 언더바에서 ESCAPE 를 써주지 않으면 안된다


























    

    




















