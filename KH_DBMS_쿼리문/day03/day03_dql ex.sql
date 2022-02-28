----------------------------------JOIN--------------------------------
-----1)INNER JOIN(교집합) : NULL인건 안나온다
--EMPLOYYE TABLR & EMPARTEMT TABLE -> JOIN
SELECT * FROM EMPLOYEE;   --FK: DEPT_CODE
SELECT * FROM DEPARTMENT; --PK:DEPT_ID
--> 두개의 테이블이 공유하고있다 -> JON
SELECT 
    EMP_ID,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE "E" JOIN DEPARTMENT "D"
ON (E.DEPT_CODE = D.DEPT_ID);

-----EMPLYOEE TABLE & JOB TABLE -> INNER JOIN
SELECT * FROM EMPLOYEE; 
SELECT * FROM JOB;
--> JOB_CODE가 겹친다 -> JOIN
SELECT 
    EMP_ID,
    EMP_NAME,
    E.JOB_CODE
FROM EMPLOYEE "E" JOIN JOB "J"
ON (E.JOB_CODE = J.JOB_CODE);       --열이름이 겹칠때 , ON USING(JOB_CODE)  를 써도된다 



----2)LEFT JOIN(합집합) : 왼쪽을 기준으로 출력 -> 왼쪽테이블(EMPLOYEE)의 NULL인것도 같이 출력된다
--EMPLOYEE & DEPARTMENT 
SELECT * FROM EMPLOYEE;   
SELECT * FROM DEPARTMENT; 
--> LEFT JOIN
SELECT EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE "E" LEFT JOIN DEPARTMENT "D"
ON E.DEPT_CODE = D.DEPT_ID;
--3)RIGHT OUTER JOIN(합집합) : 오른쪽을 기준으로 JOIN -> 오른쪽 테이블(DEPARTMENT)의 NULL인것도 같이 출력
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--4)FULL OUTER JOIN(합집합) : 왼쪽,오른쪽 NULL출력가능
SELECT EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

---------다중 JOIN
--EMPLOYEE - DEPARTMENT - LOCATION
SELECT * FROM EMPLOYEE;     --E.DEPT_CODE
SELECT * FROM DEPARTMENT;   --D.DEPT_ID , D.LOCATEION_ID
SELECT * FROM LOCATION;     --L.LOCAL_CODE
SELECT 
    EMP_ID,
    EMP_NAME,
    DEPT_TITLE,
    LOCAL_NAME
FROM EMPLOYEE "E" JOIN DEPARTMENT "D"   --E & D
ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION "L"                       --D * L
ON (D.LOCATION_ID = L.LOCAL_CODE);

--------------다중 JOIN 간단 실습(*) 
-- 각 사원들의 이름,나이,부서명,직책명을 출력하여라.
-- (부서코드,직책코드가 아닌 부서명과 직책명을 출력하여야 함)
SELECT * FROM EMPLOYEE;     --E.DEPT_CODE   E.JOB_CODE
SELECT * FROM DEPARTMENT;   --D.DEPT_ID 
SELECT * FROM JOB;          --J.JOB_CODE

SELECT 
    EMP_NAME "이름",
    EXTRACT(YEAR FROM SYSDATE)-(1900+SUBSTR(EMP_NO,1,2)) "나이",
    DEPT_CODE "부서명" ,
    JOB_CODE "직책명"
FROM EMPLOYEE "E" JOIN DEPARTMENT "D"
ON(E.DEPT_CODE = D.DEPT_ID)
JOIN JOB "J" 
USING(JOB_CODE);                        --USING에는 ON을 쓰지않는다

--SELF JOIN
--EMPLOYEE TABLE에서 자기 자신의 매니저이름을 출력하시오
SELECT
    EMP_ID,
    EMP_NAME,
    MANAGER_ID
FROM EMPLOYEE;      --> ID: 201 = 송종기 인데 , 송종기의 MANAGER= 200 / 따라서 송종기의 매니저는 선동일
                    --> ID: 206 = 박나라 인데, 박나라의 MANAGER= 207 / 따라서 박나라의 매니저는 하이유
SELECT EMP.EMP_ID, EMP.EMP_NAME, EMP.MANAGER_ID, MNG.EMP_NAME
FROM EMPLOYEE EMP
JOIN EMPLOYEE MNG ON (EMP.MANAGER_ID = MNG.EMP_ID);
--하이유 : 9번) 207 번, 하이유의 매니저는 200번(선동일)이다 아닌가 ?
--하이유 : 3번) 보면 왜 하이유의 매니저가 선동일로 생겼는지 ?

--SELECT
--   E.EMP_ID,
--    E.EMP_NAME,
--    M.MANAGER_ID  
--FROM EMPLOYEE "E" JOIN EMPLOYEE "M"
--ON (E.EMP_ID = M. MANAGER_ID);

--자신이 관리하고 있는 사원의 이름,급여 및 직급이 어떻게 되는지 검색하여라.
SELECT * 
FROM EMPLOYEE "E" JOIN EMPLOYEE "M"


    

    





    













                                                