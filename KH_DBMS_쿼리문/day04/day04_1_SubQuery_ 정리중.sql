--------------------------Shub Query--------------------------
--Sub Query:  쿼리문 안에 쿼리가 있는 구조
--단일행 서브쿼리 : 서브쿼리의 결과값이 1개 
--다중행 서브쿼리 : 서브쿼리의 결과값이 2개  이상일떄

----SLECT (1) FROM (2) WHERE(3)
-->서브쿼리의 위치가  -> (1): 스칼라 서브쿼리   (2): 인라인뷰 서브쿼리   (3)서브쿼리
--EX)서브쿼리
SELECT  AVG(SALARY) FROM EMPLOYEE; 
SELECT 
    EMP_NAME,
    SALARY
FROM EMPLOYEE
WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE);


SELECT * FROM EMPLOYEE;
--전지연 직원의 관리자(MANAGER) 이름을 출력하여라
--1) 전지연의 MANAGER_ID 찾기
SELECT MANAGER_ID FROM EMPLOYEE         -->MANAGER_ID =214   를 찾고 , EMP_ID=214로가서 조회해야한다
WHERE EMP_NAME='전지연';
--2) MANAGER_ID = 214인 관리자 이름 조회
SELECT EMP_NAME FROM EMPLOYEE
WHERE EMP_ID=214;
--서브쿼리를 이용하면 1,2 한번에 가능하다
SELECT EMP_NAME  FROM EMPLOYEE  
WHERE EMP_ID=(SELECT MANAGER_ID FROM EMPLOYEE WHERE EMP_NAME= '전지연');  
-->EMP_NAME= 전지연인, MANAGER_ID를 , EMP_ID에 넣어서, EMP_NAME을 찾는다

------------------실습문제 
--1. 윤은해와 급여가 같은 사원들을 검색해서, 사원번호,사원이름, 급여를 출력하라.
--단, 윤은해는 출력 되면 안됨

--1)윤은해와 급여가 같은           -- (SELECT SALARY FROM EMPLOYEE WHERE  EMP_NAME='윤은해')
--2)윤은해는 출력되면 안댐        --WHERE EMP_NAME != '윤은해'
--3)
SELECT 
    EMP_ID "사원번호",
    EMP_NAME "사원이름",
    SALARY "급여"
FROM EMPLOYEE
WHERE SALARY = (SELECT SALARY FROM EMPLOYEE WHERE  EMP_NAME='윤은해')
    AND EMP_NAME != '윤은해';
    
--2. employee 테이블에서 기본급여가 제일 많은 사람과 제일 적은 사람의 정보를 
-- 사번, 사원명, 기본급여를 나타내세요.
--1) 기본급여가 가장 많은사람          --WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE)
--2) 기본급여가 가장 적은사람          --WHERE(SELECT MIN(SALARY) FROM EMPLOYEE)
--2)
SELECT 
    EMP_ID "사원번호",
    EMP_NAME,
    SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE)
            OR SALARY= (SELECT MIN(SALARY) FROM EMPLOYEE);    --(SELECT MAX(SALARY),MIN(SALARY)FROM EMPLOYEE); 는 다중쿼리다


-- 3. D1, D2부서에 근무하는 사원들 중에서    
-- 기본급여가 D5 부서 직원들의 '평균월급' 보다 많은 사람들만 
-- 부서번호, 사원번호, 사원명, 월급을 나타내세요.

--1) D1,D2부서에 근무하는 사람              -- DEPT_CODE IN('D1','D 2');
--2)기본급여가 D5 부서 직원들의 '평균월급' 보다 많은 사람들만   
SELECT AVG(SALARY)  FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING DEPT_CODE='D5';

SELECT 
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D1','D2') AND
            SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE                
                                GROUP BY DEPT_CODE
                                HAVING DEPT_CODE='D5');


--다중행 SubQuery
SELECT EMP_ID, EMP_NAME, SALARY FROM EMPLOYEE
WHERE DEPT_CODE IN ('D3','D5');
--EX1)
-- 송종기, 박나라와 부서가 같은 직원들의 사원번호, 사원명, 급여를 출력하시오.
--1)송중기,박나라와 부서가 같은 직원들의 코드 
SELECT 
    DEPT_CODE 
FROM EMPLOYEE 
WHERE EMP_NAME IN ('송중기','박나라');
--2)
SELECT 
    DEPT_CODE,
    EMP_NAME,
    SALARY
FROM EMPLOYEE 
WHERE DEPT_CODE IN (SELECT DEPT_CODE FROM EMPLOYEE 
                                                                                  WHERE EMP_NAME IN ('송중기','박나라'));
                                                                                  
                                                                                  -@실습문제
-- 차태연, 전지연 사원의 급여등급(emplyee테이블의 sal_level컬럼)과 같은 사원의 직급명, 사원명을 출력
-- 하시오
SELECT SAL_LEVEL 
    FROM EMPLOYEE
    WHERE EMP_NAME IN('차태연' , '전지연');
SELECT JOB_NAME , EMP_NAME
    FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SAL_LEVEL IN (SELECT SAL_LEVEL FROM EMPLOYEE WHERE EMP_NAME IN ('차태연', '전지연'));

--SLECT (1) FROM (2) WHERE(3)
-->서브쿼리가 -> (2): 인라인뷰(INLINE VIEW) : 행이 여러개 나오는  ->  다중행 서브쿼리이다
                                        --인라인뷰 의 AS 는 WITH를 쓴다
                                        --사용하는경우: ORDER BY 뒤에 WHERE절을 써야할때
--EX)1회사의 연봉순위 출력
SELECT 
    EMP_NAME, SALARY*12
FROM EMPLOYEE       
ORDER BY 2;
WHERE ROUNUM <6;                
                                                        --(오류)
                                                    --> ROWNUM을 먼저한다면 , SALARY 내림차순 정렬해도 아무 의미가 없다
                                                    --> 따라서, ORDER_BY후,  ROUNUM을 해줘야한다 
                                                    --> ORDER_BY는 WHERE 앞으로 갈 수 없다
                                                    --> 인라인뷰 이용한다

--EX)2
SELECT 
    EMP_NAME,
    SALARY,
    EMAIL,
    PHONE
FROM (SELECT EMP_NAME, SALARY, EMAIL , PHONE  FROM EMPLOYEE)
WHERE ROWNUM <4;        --ROWNUM: 행의 갯수를 출력해준다

--EX2) 월급이 높은 상위5명의 사원을 출력하시오
--> 월급 내림차순정렬 후 , ROWNUM
SELECT *
FROM  (SELECT EMP_NAME, SALARY FROM EMPLOYEE 
                                                                    ORDER BY 2 DESC)
WHERE  ROWNUM <6;

--WITH : 인라인뷰 알리아스로 만들고싶을때 사용  --> 알리아스를 씀으로 중복작성을 방지할 수 있다 
--기본형) WITH 이름 AS(인라인뷰)
WITH TOP_SAL AS( SELECT EMP_NAME,SALARY FROM EMPLOYEE
                                                                    ORDER BY 2 DESC)  --ASC: 오름차순   : 생략가능
SELECT * 
FROM TOP_SAL
WHERE ROWNUM <6;



---------------------------------랭킹구하기------------------------------
--RANK() OVER : 순위매긴다~ ,   중복순위는 해당 개수만큼 건너뛰고 순위구한다
                                                     -- 1, 2, 3, 4, 4, 4, 4 , 8, 9 , 10
                                                     --SELECT 절에서 쓰인다
--회사의 연봉순위 출력
                
SELECT 
    EMP_NAME,
    SALARY*12,
    RANK () OVER (ORDER BY SALARY DESC)
FROM EMPLOYEE;
                                                  

                                                    







    
                


       

/* (질문1)
SELECT 
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    SALARY
FROM EMPLOYEE
WHERE  DEPT_CODE IN ('D1','D2') AND
                (DEPT_CODE = 'D5' AND 
                SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE));
                */