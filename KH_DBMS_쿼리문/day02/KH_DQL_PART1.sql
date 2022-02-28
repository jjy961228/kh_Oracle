--DQL�� �⺻��)
--SEELCT �÷��� 
--FROM ���̺��
--WHERE ���ǽ�;
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE
WHERE EMP_NAME= '������';








-- ���� �ǽ� ����
--1. EMPLOYEE ���̺��� �̸�,����, �Ѽ��ɾ�(���ʽ�����), 
-- �Ǽ��ɾ�(�� ���ɾ�-(����*���� 3%*12))
-- �� ��µǵ��� �Ͻÿ�
SELECT 
    EMP_NAME AS �̸�, 
    SALARY *12 AS ����, 
    (SALARY*12 + (SALARY*BONUS)) AS �Ѽ��ɾ� ,'��' AS ���� ,
    (SALARY*12 + (SALARY*BONUS)) - ((SALARY * 0.03 )*12) AS �Ǽ��ɾ� , '��' AS ����
FROM EMPLOYEE;

--2. EMPLOYEE ���̺��� �̸�, �ٹ� �ϼ��� ����غ��ÿ�       �ٹ��ϼ�: ���ó�¥-�Ի糯¥
--(SYSDATE�� ����ϸ� ���� �ð� ���)      
SELECT 
    EMP_ID AS �̸�,
    FLOOR(SYSDATE-HIRE_DATE) AS �ٹ��ϼ�           --FLOOR:�Ҽ��� ������
FROM EMPLOYEE;

--3. EMPLOYEE ���̺��� 20�� �̻� �ټ����� �̸�,����,���ʽ����� ����Ͻÿ�.
SELECT 
    EMP_NAME "�̸�",
    SALARY "����",
    BONUS "���ʽ���"
    FROM EMPLOYEE
    WHERE FLOOR(SYSDATE-HIRE_DATE)/365 >=20;    --SYSDATE������ (SYSDATE-HIRE_DATE) ��¥�� ���ָ� ���ڰ� ���´�
    


--DISTINCT : �ߺ��������ִ°� 

--ORDER BY: ����
SELECT * FROM EMPLOYEE ORDER BY EMP_ID DESC; --������������(ū�� -> ������)
SELECT * FROM EMPLOYEE ORDER BY EMP_NAME DESC; --���ڵ� �������� ������ �����ϴ�(�� > ��)

--�ؽ�Ʈ ���Ῥ����(CONCATENATION): ||




-- ���� �ǽ�����2
-- �μ��ڵ尡 D6�̰� �޿��� 2,000,000���� ���� �޴� 
-- ����� �̸�, �μ��ڵ�, �޿��� ��ȸ�Ͻÿ�.
SELECT * FROM EMPLOYEE;
SELECT 
    EMP_NAME AS �̸�,
    DEPT_CODE AS �μ��ڵ�,
    SALARY AS �޿�
    FROM EMPLOYEE
        WHERE DEPT_CODE = 'D6' AND SALARY >2000000;    

-- �μ��ڵ尡 D5 �Ǵ� �޿��� 3,000,000���� ���� �޴� 
-- ����� �̸�, �μ��ڵ�, �޿��� ��ȸ�Ͻÿ�
SELECT 
    EMP_NAME AS �̸�,
    DEPT_CODE AS �μ��ڵ�,
    SALARY AS �޿�
    FROM EMPLOYEE
        WHERE DEPT_CODE = 'D5' OR SALARY >3000000;   




--WHERE �÷��� BETWEEN A AND B

-----WHILD CARD
--WHERE �÷��� LIKE '��%'       : ������ �����ϴ� ��繮�� ���
--WHERE �÷��� LIKE '%��%'      : �� �� ���� ��繮�� ���
--WHERE �÷��� NOT LIKE '%��'   : ������ �����ϴ� ��繮�� ���� ���
--WHERE �÷��� LIKE '��_'       : ������ �����ϴ� 2���� �̻��� ��繮�� ���
--WHERE �÷��� LIKE '_ _ _ 7 _ _ _ _ _ _ _ _' 11�ڸ� ������ 4��°�ڸ��� 7�� �����ϴ°� ��� ���



-- �ǽ�����
--1. EMPLOYEE ���̺��� �̸� ���� ������ ������ ����� �̸��� ����Ͻÿ�
SELECT EMP_NAME AS �̸� 
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

--2. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�, ��ȭ��ȣ�� ����Ͻÿ�
SELECT PHONE
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--3. EMPLOYEE ���̺��� �����ּ��� 's'�� ���鼭,       AND
--DEPT_CODE�� D9 �Ǵ� D6�̰�,                            OR
--������� 90/01/01 ~ 01/12/01�̸鼭,                     AND          --�ܡܡܡ�DBMS���� ��¥������ YYYY/MM/DD �̴� �ܡܡܡ�
--������ 270�����̻��� ����� ��ü ������ ����Ͻÿ�
SELECT *
FROM EMPLOYEE
WHERE EMAIL LIKE '%S%' 
    AND(DEPT_CODE = 'D9' OR DEPT_CODE='D6')
    AND(HIRE_DATE BETWEEN '90/01/01' AND '01/12/01')
    AND SARALY >= 270000000;
    
SELECT EMAIL FROM EMPLOYEE;

--4. EMPLOYEE ���̺��� EMAIL ID �� @ ���ڸ��� 5�ڸ��� ������ ��ȸ�Ѵٸ�?
SELECT EMAIL 
FROM EMPLOYEE
WHERE EMAIL LIKE '_____@%';     --@%: @�� �� ������ 

--5. EMPLOYEE ���̺��� EMAIL ID �� '_' ���ڸ��� 3�ڸ��� ������ ��ȸ�Ѵٸ�?
SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___#_%'   ESCAPE '#' ;    --ESCAPE�� �̿��� #�ڿ��ִ� _�� ���ڿ��μ� �������� �ʴ´�


--IN ������
--EMPLOYEE TABLE���� �μ��ڵ尡 D9 �Ǵ� D6�� ��� ��ü ������ ����Ͻÿ�.
SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D9','D6');     --D9 �Ǵ� D6 �ΰ� ��� ����

SELECT DEPT_CODE 
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN ('D9','D6');   --D9 �Ǵ� D6 �ƴѰ� ��� ����     



--SELECT ���� ����
--FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6'
ORDER BY EMP_ID DESC;

--IS NULL , IS NOT NULL
--EMPLOYEE ���̺��� BONOUS���� NULL�� ��� �ɷ�����  
SELECT * 
FROM EMPLOYEE
WHERE BONUS IS NULL;        --> NULL�� ��鸸 �˻� 

SELECT *
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;    --> NULL�� �ƴ� ��鸸 �˻�


--������ �켱���� : ��ȣ�� ��������� ����� �ʿ� ����.       --AND OR ����������� AND �� ���� ����ȴ�



SELECT * FROM EMPLOYEE;
--���ʽ� �ǽ�����--
-- ���� �ǽ� ����
-- ����1. 
-- �Ի����� 5�� �̻�, 10�� ������ ������ �̸�,�ֹι�ȣ,�޿�,�Ի����� �˻��Ͽ���
SELECT EMP_NAME , EMP_NO, SALARY, HIRE_DATE  
FROM EMPLOYEE
--WHERE HIRE_DATE BETWEEN '11/12/14' AND '21/12/14' ;
WHERE HIRE_DATE >= '16/12/14' AND HIRE_DATE >= '11/12/14';

-- ����2.
-- �������� �ƴ� ������ �̸�,�μ��ڵ�, �����, �ٹ��Ⱓ, �������� �˻��Ͽ��� 
--(��� ���� : ENT_YN)
SELECT EMP_NAME ,DEPT_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'Y';

-- ����3.
-- �ټӳ���� 10�� �̻��� �������� �˻��Ͽ�
-- ��� ����� �̸�,�޿�,�ټӳ��(�Ҽ���X)�� �ټӳ���� ������������ �����Ͽ� ����Ͽ���
-- ��, �޿��� 50% �λ�� �޿��� ��µǵ��� �Ͽ���.
SELECT EMP_NAME, SALARY , HIRE_DATE
FROM EMPLOYEE
WHERE FLOOR((SYSDATE-HIRE_DATE)/365) >= 10
ORDER BY ;       --�ε�ȣ,ORDER BY �� ����Ҷ��� SELECT�� ����, �ݵ�� WHERE������ �ؾ��Ѵ� 


-- ����4.
-- �Ի����� 99/01/01 ~ 10/01/01 �� ��� �߿��� �޿��� 2000000 �� ������ �����`
-- �̸�,�ֹι�ȣ,�̸���,����ȣ,�޿��� �˻� �Ͻÿ�
SELECT * FR

-- ����5.
-- �޿��� 2000000�� ~ 3000000�� �� ������ �߿��� 4�� �����ڸ� �˻��Ͽ� 
-- �̸�,�ֹι�ȣ,�޿�,�μ��ڵ带 �ֹι�ȣ ������(��������) ����Ͽ���
-- ��, �μ��ڵ尡 null�� ����� �μ��ڵ尡 '����' ���� ��� �Ͽ���.

-- ����6.
-- ���� ��� �� ���ʽ��� ���� ����� ���ñ��� �ٹ����� �����Ͽ� 
-- 1000�� ����(�Ҽ��� ����) 
-- �޿��� 10% ���ʽ��� ����Ͽ� �̸�,Ư�� ���ʽ� (��� �ݾ�) ����� ����Ͽ���.
-- ��, �̸� ������ ���� ���� �����Ͽ� ����Ͽ���.


















