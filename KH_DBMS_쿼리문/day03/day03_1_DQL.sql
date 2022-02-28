--------------------DQL 연습문제-----------------
SELECT * FROM EMPLOYEE;
--보너스 실습문제--
-- 최종 실습 문제
-- 문제1. 
-- 입사일이 5년 이상, 10년 이하인 직원의 이름,주민번호,급여,입사일을 검색하여라
SELECT
    EMP_NAME , FLOOR((SYSDATE-HIRE_DATE)/365) "입사일"
FROM EMPLOYEE
WHERE (SYSDATE-HIRE_DATE)/365 BETWEEN 5 AND 10;

-- 문제2.
-- 재직중이 아닌 직원의 이름,부서코드, 고용일, 근무기간, 퇴직일을 검색하여라 
--(퇴사 여부 : ENT_YN) HIRE_DATAE: 고용일
SELECT
    EMP_NAME,                                                                                             
    DEPT_CODE,
    HIRE_DATE,
    FLOOR(SYSDATE-HIRE_DATE)
FROM EMPLOYEE
WHERE ENT_YN = 'Y';

-- 문제3.
-- 근속년수가 10년 이상인 직원들을 검색하여
-- 출력 결과는 이름,급여,근속년수(소수점X)를 근속년수가 오름차순으로 정렬하여 출력하여라
-- 단, 급여는 50% 인상된 급여로 출력되도록 하여라.
-- ORDER BY 컬럼명 ASC ->오름차순      컬럼명 : 컬럼열로 교체가능
--             3   DESC ->내림차순   (DESC)는 생략가능 ,
SELECT
    EMP_NAME "이름",
    SALARY "급여",
    FLOOR((SYSDATE-HIRE_DATE)/365) "근속년수"
FROM EMPLOYEE
WHERE FLOOR((SYSDATE-HIRE_DATE)/365) >= 10
ORDER BY FLOOR((SYSDATE-HIRE_DATE)/365);

-- 문제4.
-- 입사일이 99/01/01 ~ 10/01/01 인 사람 중에서 급여가 2000000 원 이하인 사람의`
-- 이름,주민번호,이메일,폰번호,급여를 검색 하시오
SELECT 
    EMP_NAME "이름",
    EMP_NO "주민번호",
    EMAIL "이메일",
    PHONE "폰번호",
    SALARY "급여"
FROM EMPLOYEE
WHERE (HIRE_DATE BETWEEN '99/01/01' AND '10/01/01')
       AND SALARY <= 2000000;      --DATE는 'YY-MM-DD' 꼭 점 써주기
       
 SELECT * FROM EMPLOYEE;
-- 문제5.
-- 급여가 2000000원 ~ 3000000원 인 여직원 중에서 4월 생일자를 검색하여 
-- 이름,주민번호,급여,부서코드를 주민번호 순으로(내림차순) 출력하여라
-- 단, 부서코드가 null인 사람은 부서코드가 '없음' 으로 출력 하여라.
SELECT 
    EMP_NAME "이름",
    EMP_NO "주민번호",
    SALARY "급여",
    NVL(DEPT_CODE,'없음') " 부서코드"
FROM EMPLOYEE
WHERE (SALARY BETWEEN 2000000 AND 3000000)
       AND EMP_NO LIKE '______-2%'  --여직원
       AND EMP_NO LIKE '__04%'      --4월생일      -->__04__-2% : 여직원 AND 04월생
ORDER BY EMP_NO;

-- 문제6.(*)
-- 남자 사원 중 보너스가 없는 사원의 오늘까지 근무일을 측정하여 
-- 1000일 마다(소수점 제외) 
-- 급여의 10% 보너스를 계산하여 이름,특별 보너스 (계산 금액) 결과를 출력하여라.
-- 단, 이름 순으로 오름 차순 정렬하여 출력하여라.
SELECT * FROM EMPLOYEE;
SELECT
    EMP_NAME "이름",
    EMP_NO, 
    BONUS,
    SYSDATE-HIRE_DATE "근무일수",
    FLOOR((SYSDATE-HIRE_DATE)/1000 * (SALARY*0.1)) "특별보너스"
FROM EMPLOYEE
WHERE EMP_NO LIKE '%-1%'
      AND BONUS IS NULL;        --보너스가 없는사람 : BONUS = NULL (X)
 --                                                 BONUS IS NULL(O)
      
      



       













