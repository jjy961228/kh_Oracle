-------------------------------------����Ŭ ��ü---------------------------
--SYSTEM �������� ������ ����Ѵ�
CREATE VIEW V_EMPLOYEE(���,�̸�,�̸���,��ȣ)
AS SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE;

SELECT * FROM V_EMPLOYEE;
--1)
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') "GENDER"
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--2) CREATAE VIEW�� ����� ������ �ƿ� �������ѳ��� ���ִ�. -> �ڵ��� ��Ȱ�뼺
CREATE VIEW G_EMPLOYEE AS
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') "GENDER"
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--3)
SELECT * FROM G_EMPLOYEE;

--4)���ڱ� ���⼭ �ٹ������ �߰��ϰ�ʹ�, ���,�̸�,����,����,�ټӳ�� �߰��ϰ�ʹ� --> �ȴ�� ����ϰ� �ؾ��Ѵ�
CREATE VIEW G_EMPLOYEE (���,�̸�,����,����,�ټӳ��) AS
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') "GENDER",
EXTRACT( YEAR FROM SYSDATE) - EXTRACT(YEAR FROM JIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--5)
CREATE OR REPLACE VIEW G_EMPLOYEE (���,�̸�,����,����,�ټӳ��) AS
SELECT EMP_ID, EMP_NAME, JOB_NAME, DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') "GENDER",
EXTRACT( YEAR FROM SYSDATE) - EXTRACT(YEAR FROM JIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING ( JOB_CODE);
--�並 ����ϴ� ����?
--1.�ΰ��� ���� ���� ���� 
--2. ������ ������ ���ϰ� ��� ����
SELECT * FROM USER_VIEWS;           --> VIEW�� ������� �������ִ� (VIEW ����)











-- ����Ŭ ��ü!
SELECT * FROM EMPLOYEE;

CREATE VIEW V_EMPLOYEE(���,�̸�,�̸���,��ȣ)
AS SELECT EMP_ID, EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE;

SELECT * FROM V_EMPLOYEE;

CREATE VIEW G_EMPLOYEE AS
SELECT 
    EMP_ID, 
    EMP_NAME, 
    JOB_NAME, 
    DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��') "GENDER"
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);


CREATE OR REPLACE VIEW G_EMPLOYEE(�����ȣ, �̸�, ����, ����, �ټӳ��) AS
SELECT 
    EMP_ID, 
    EMP_NAME, 
    JOB_NAME, 
    DECODE(SUBSTR(EMP_NO,8,1),1,'��',2,'��'),
    EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE);
DROP VIEW G_EMPLOYEE;


SELECT * FROM G_EMPLOYEE;
-- �並 ���� ����?
-- 1. �ΰ��� ���� ���� ����
-- 2. ������ ������ ���ϰ� ��°���

SELECT * FROM USER_VIEWS; -- View�� ���� ��� ������ ������ ����. (������ ��ųʸ�)



--Data Dictionary��?     SELECT * FROM USER_VIEWS;
--> �پ��� ������ �����ϰ��ְ� , �����ϴ� �ý���
--Data Dictionary�� ����ڰ� ���̺��� �����ϰų� ����ڸ� �����ϴ� ����
--�۾��� �� ��, ������ ���̽� ������ ���� �ڵ����� ������ ��.
--����ڴ� Data Dioctionary�� ������ ���� �����ϰų� ������ �� ���� , ��ȸ�� ����
--Data Dictionary View :    SELECT * FROM USER_VIEWS;
--����
--1. DBA_XXX :������ ���̽� �����ڸ��� ������ ������ ��ü � ���� ���� ��ȸ
--2. ALL_XXX : �ڽ��� ������ �����ϰų� ������ �ο����� ��ü � ���� ���� ��ȸ
--3. USER_XXX : �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ
SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS;  --USER_CONSTRAINTS��� VIEW�� ���ؼ� 
SELECT USERNAME FROM DBA_USERS;


--������ ����
-- 1. SYS(�ְ��� ����): Oracle ������, Super User, Oracal �ý����� ����� �Ǵ� Data Dictionary �������̸�,
--                         DB������ ��������, Oracale �ý����� �Ѱ����� 
--             �����ϴ¹�) sys as sysdba
-- 2. SYSTEM: sys�� ������ ������ ������ ������ DB������ ������ �Ұ�����
-- ������ DB�� �,�����ϱ����� ����
--     �����ϴ¹��): SYSTEM , PASSWORD: 





