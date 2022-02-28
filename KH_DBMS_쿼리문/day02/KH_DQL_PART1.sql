--DQL의 기본형)
--SEELCT 컬렁명 
--FROM 테이블명
--WHERE 조건식;
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE
WHERE EMP_NAME= '선동일';








-- 간단 실습 문제
--1. EMPLOYEE 테이블에서 이름,연봉, 총수령액(보너스포함), 
-- 실수령액(총 수령액-(월급*세금 3%*12))
-- 가 출력되도록 하시오
SELECT 
    EMP_NAME AS 이름, 
    SALARY *12 AS 연봉, 
    (SALARY*12 + (SALARY*BONUS)) AS 총수령액 ,'원' AS 단위 ,
    (SALARY*12 + (SALARY*BONUS)) - ((SALARY * 0.03 )*12) AS 실수령액 , '원' AS 단위
FROM EMPLOYEE;

--2. EMPLOYEE 테이블에서 이름, 근무 일수를 출력해보시오       근무일수: 오늘날짜-입사날짜
--(SYSDATE를 사용하면 현재 시간 출력)      
SELECT 
    EMP_ID AS 이름,
    FLOOR(SYSDATE-HIRE_DATE) AS 근무일수           --FLOOR:소수점 버리기
FROM EMPLOYEE;

--3. EMPLOYEE 테이블에서 20년 이상 근속자의 이름,월급,보너스율를 출력하시오.
SELECT 
    EMP_NAME "이름",
    SALARY "월급",
    BONUS "보너스율"
    FROM EMPLOYEE
    WHERE FLOOR(SYSDATE-HIRE_DATE)/365 >=20;    --SYSDATE에의해 (SYSDATE-HIRE_DATE) 날짜를 빼주면 일자가 나온다
    


--DISTINCT : 중복제거해주는것 

--ORDER BY: 정렬
SELECT * FROM EMPLOYEE ORDER BY EMP_ID DESC; --내림차순정렬(큰수 -> 작은수)
SELECT * FROM EMPLOYEE ORDER BY EMP_NAME DESC; --문자도 내림차순 정렬이 가능하다(ㅎ > ㄱ)

--텍스트 연결연산자(CONCATENATION): ||




-- 간단 실습문제2
-- 부서코드가 D6이고 급여를 2,000,000보다 많이 받는 
-- 사원의 이름, 부서코드, 급여를 조회하시오.
SELECT * FROM EMPLOYEE;
SELECT 
    EMP_NAME AS 이름,
    DEPT_CODE AS 부서코드,
    SALARY AS 급여
    FROM EMPLOYEE
        WHERE DEPT_CODE = 'D6' AND SALARY >2000000;    

-- 부서코드가 D5 또는 급여를 3,000,000보다 많이 받는 
-- 사원의 이름, 부서코드, 급여를 조회하시오
SELECT 
    EMP_NAME AS 이름,
    DEPT_CODE AS 부서코드,
    SALARY AS 급여
    FROM EMPLOYEE
        WHERE DEPT_CODE = 'D5' OR SALARY >3000000;   




--WHERE 컬럼명 BETWEEN A AND B

-----WHILD CARD
--WHERE 컬럼영 LIKE '전%'       : 전으로 시작하는 모든문자 출력
--WHERE 컬럼명 LIKE '%전%'      : 전 이 들어가는 모든문자 출력
--WHERE 컬럼명 NOT LIKE '%전'   : 전으로 시작하는 모든문자 빼고 출력
--WHERE 컬럼명 LIKE '전_'       : 전으로 시작하는 2글자 이상의 모든문자 출력
--WHERE 컬럼명 LIKE '_ _ _ 7 _ _ _ _ _ _ _ _' 11자리 숫자중 4번째자리가 7로 시작하는것 모두 출력



-- 실습문제
--1. EMPLOYEE 테이블에서 이름 끝이 연으로 끝나는 사원의 이름을 출력하시오
SELECT EMP_NAME AS 이름 
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연';

--2. EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 출력하시오
SELECT PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--3. EMPLOYEE 테이블에서 메일주소의 's'가 들어가면서,       AND
--DEPT_CODE가 D9 또는 D6이고,                            OR
--고용일이 90/01/01 ~ 01/12/01이면서,                     AND          --●●●●DBMS에서 날짜구분은 YYYY/MM/DD 이다 ●●●●
--월급이 270만원이상인 사원의 전체 정보를 출력하시오
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%S%' 
    AND(DEPT_CODE = 'D9' OR DEPT_CODE='D6')
    AND(HIRE_DATE BETWEEN '90/01/01' AND '01/12/01')
    AND SARALY >= 270000000;
    
SELECT EMAIL FROM EMPLOYEE;

--4. EMPLOYEE 테이블에서 EMAIL ID 중 @ 앞자리가 5자리인 직원을 조회한다면?
SELECT EMAIL 
FROM EMPLOYEE
WHERE EMAIL LIKE '_____@%';     --@%: @가 들어간 모든글자 

--5. EMPLOYEE 테이블에서 EMAIL ID 중 '_' 앞자리가 3자리인 직원을 조회한다면?
SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%'   ESCAPE '#' ;    --ESCAPE를 이용해 #뒤에있는 _가 문자열로서 동작하지 않는다


--IN 연산자
--EMPLOYEE TABLE에서 부서코드가 D9 또는 D6인 사원 전체 정보를 출력하시오.
SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D9','D6');     --D9 또는 D6 인거 출력 가능

SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D9','D6');   --D9 또는 D6 아닌거 출력 가능     



--SELECT 실행 순서
--FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
ORDER BY EMP_ID DESC;

--IS NULL , IS NOT NULL
--EMPLOYEE 테이블에서 BONOUS에서 NULL값 모두 걸러내기  
SELECT * 
FROM EMPLOYEE
WHERE BONUS IS NULL;        --> NULL인 놈들만 검색 

SELECT *
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;    --> NULL이 아닌 놈들만 검색


--연산자 우선순위 : 괄호를 묶어놓으면 고민할 필요 없다.       --AND OR 같이있을대는 AND 가 먼저 실행된다



SELECT * FROM EMPLOYEE;
--보너스 실습문제--
-- 최종 실습 문제
-- 문제1. 
-- 입사일이 5년 이상, 10년 이하인 직원의 이름,주민번호,급여,입사일을 검색하여라
SELECT EMP_NAME , EMP_NO, SALARY, HIRE_DATE  
FROM EMPLOYEE
--WHERE HIRE_DATE BETWEEN '11/12/14' AND '21/12/14' ;
WHERE HIRE_DATE >= '16/12/14' AND HIRE_DATE >= '11/12/14';

-- 문제2.
-- 재직중이 아닌 직원의 이름,부서코드, 고용일, 근무기간, 퇴직일을 검색하여라 
--(퇴사 여부 : ENT_YN)
SELECT EMP_NAME ,DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'Y';

-- 문제3.
-- 근속년수가 10년 이상인 직원들을 검색하여
-- 출력 결과는 이름,급여,근속년수(소수점X)를 근속년수가 오름차순으로 정렬하여 출력하여라
-- 단, 급여는 50% 인상된 급여로 출력되도록 하여라.
SELECT EMP_NAME, SALARY , HIRE_DATE
FROM EMPLOYEE
WHERE FLOOR((SYSDATE-HIRE_DATE)/365) >= 10
ORDER BY ;       --부등호,ORDER BY 를 사용할때는 SELECT절 말고, 반드시 WHERE절에서 해야한다 


-- 문제4.
-- 입사일이 99/01/01 ~ 10/01/01 인 사람 중에서 급여가 2000000 원 이하인 사람의`
-- 이름,주민번호,이메일,폰번호,급여를 검색 하시오
SELECT * FR

-- 문제5.
-- 급여가 2000000원 ~ 3000000원 인 여직원 중에서 4월 생일자를 검색하여 
-- 이름,주민번호,급여,부서코드를 주민번호 순으로(내림차순) 출력하여라
-- 단, 부서코드가 null인 사람은 부서코드가 '없음' 으로 출력 하여라.

-- 문제6.
-- 남자 사원 중 보너스가 없는 사원의 오늘까지 근무일을 측정하여 
-- 1000일 마다(소수점 제외) 
-- 급여의 10% 보너스를 계산하여 이름,특별 보너스 (계산 금액) 결과를 출력하여라.
-- 단, 이름 순으로 오름 차순 정렬하여 출력하여라.


















