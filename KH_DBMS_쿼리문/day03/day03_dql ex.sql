----------------------------------JOIN--------------------------------
-----1)INNER JOIN(������) : NULL�ΰ� �ȳ��´�
--EMPLOYYE TABLR & EMPARTEMT TABLE -> JOIN
SELECT * FROM EMPLOYEE;   --FK: DEPT_CODE
SELECT * FROM DEPARTMENT; --PK:DEPT_ID
--> �ΰ��� ���̺��� �����ϰ��ִ� -> JON
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
--> JOB_CODE�� ��ģ�� -> JOIN
SELECT 
    EMP_ID,
    EMP_NAME,
    E.JOB_CODE
FROM EMPLOYEE "E" JOIN JOB "J"
ON (E.JOB_CODE = J.JOB_CODE);       --���̸��� ��ĥ�� , ON USING(JOB_CODE)  �� �ᵵ�ȴ� 



----2)LEFT JOIN(������) : ������ �������� ��� -> �������̺�(EMPLOYEE)�� NULL�ΰ͵� ���� ��µȴ�
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
--3)RIGHT OUTER JOIN(������) : �������� �������� JOIN -> ������ ���̺�(DEPARTMENT)�� NULL�ΰ͵� ���� ���
SELECT
    EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE RIGHT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);
--4)FULL OUTER JOIN(������) : ����,������ NULL��°���
SELECT EMP_ID,
    EMP_NAME,
    DEPT_CODE,
    DEPT_ID,
    DEPT_TITLE
FROM EMPLOYEE FULL JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

---------���� JOIN
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

--------------���� JOIN ���� �ǽ�(*) 
-- �� ������� �̸�,����,�μ���,��å���� ����Ͽ���.
-- (�μ��ڵ�,��å�ڵ尡 �ƴ� �μ���� ��å���� ����Ͽ��� ��)
SELECT * FROM EMPLOYEE;     --E.DEPT_CODE   E.JOB_CODE
SELECT * FROM DEPARTMENT;   --D.DEPT_ID 
SELECT * FROM JOB;          --J.JOB_CODE

SELECT 
    EMP_NAME "�̸�",
    EXTRACT(YEAR FROM SYSDATE)-(1900+SUBSTR(EMP_NO,1,2)) "����",
    DEPT_CODE "�μ���" ,
    JOB_CODE "��å��"
FROM EMPLOYEE "E" JOIN DEPARTMENT "D"
ON(E.DEPT_CODE = D.DEPT_ID)
JOIN JOB "J" 
USING(JOB_CODE);                        --USING���� ON�� �����ʴ´�

--SELF JOIN
--EMPLOYEE TABLE���� �ڱ� �ڽ��� �Ŵ����̸��� ����Ͻÿ�
SELECT
    EMP_ID,
    EMP_NAME,
    MANAGER_ID
FROM EMPLOYEE;      --> ID: 201 = ������ �ε� , �������� MANAGER= 200 / ���� �������� �Ŵ����� ������
                    --> ID: 206 = �ڳ��� �ε�, �ڳ����� MANAGER= 207 / ���� �ڳ����� �Ŵ����� ������
SELECT EMP.EMP_ID, EMP.EMP_NAME, EMP.MANAGER_ID, MNG.EMP_NAME
FROM EMPLOYEE EMP
JOIN EMPLOYEE MNG ON (EMP.MANAGER_ID = MNG.EMP_ID);
--������ : 9��) 207 ��, �������� �Ŵ����� 200��(������)�̴� �ƴѰ� ?
--������ : 3��) ���� �� �������� �Ŵ����� �����Ϸ� ������� ?

--SELECT
--   E.EMP_ID,
--    E.EMP_NAME,
--    M.MANAGER_ID  
--FROM EMPLOYEE "E" JOIN EMPLOYEE "M"
--ON (E.EMP_ID = M. MANAGER_ID);

--�ڽ��� �����ϰ� �ִ� ����� �̸�,�޿� �� ������ ��� �Ǵ��� �˻��Ͽ���.
SELECT * 
FROM EMPLOYEE "E" JOIN EMPLOYEE "M"


    

    





    













                                                