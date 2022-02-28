--PL/SQL IF��
--PL/SQL�� ���ù�
--> ��� ������� ����� ������� ���������� �����
--> ������ ���������� �����Ϸ��� IF���� ����ϸ��

--����) �����ȣ�� ������ ����� ���,�̸�,�޿�,���ʽ�����
--      ����ϰ� ���ʼ����� ������ '���ʽ��� ���޹��� �ʴ� ����Դϴ�'�� ����Ͻÿ�

SELECT NVL(BONUS,0) FROM EMPLOYEE;      --���ʽ��� NULL�̸� 0���� ���

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
    --���� �������� �Է¹޴°� ���ش�
    DBMS_OUTPUT.put_line('�����ȣ: ' || EMPID);
    DBMS_OUTPUT.put_line('�̸�: ' || EMPNAME);
    DBMS_OUTPUT.put_line('�޿�: ' || SALARY);
    DBMS_OUTPUT.put_line('���ʽ���: ' || BONUS);
    --�̰͵� �ּ�ó���ؾ��� ELSE������ �Ϻ��ѹ����̴�
    IF(BONUS = 0)
    THEN DBMS_OUTPUT.put_line('���ʽ��� ���޹����ʴ� ����Դϴ�');
    --ELSE DBMS_OUTPUT.put_line('���ʽ���: ' || BONUS * 100 || '%');
    END IF;
    --���ʽ��� 0�̸� '���ʽ��� ���޹����ʴ� ����Դϴ�' ���
END;
/
-- ����ڵ带 �Է¹޾��� ��, ���, �̸�, �����ڵ�, ���޸�, �Ҽ� ���� ����Ͻÿ�
-- ��, �ҼӰ��� J1,J2�� �ӿ���, �׿ܿ��� �Ϲ��������� ��µǰ� �Ͻÿ�.
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
    DBMS_OUTPUT.PUT_LINE('�����ȣ : '||EMPID);
    DBMS_OUTPUT.PUT_LINE('�̸� : '||EMPNAME);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : '||JOBCODE);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||JOBNAME);
    IF(JOBCODE IN ('J1','J2'))  --IF�� �ΰ��Ƚᵵ �ȴ� 
    THEN DBMS_OUTPUT.PUT_LINE('�Ҽ� : �ӿ���');
    ELSE DBMS_OUTPUT.PUT_LINE('�Ҽ� : �Ϲ�����');
    END IF;
END;
/
--2)�̰� ����ϴ�
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
    THEN ETEAM := '�ӿ���';
    ELSE ETEAM := '�Ϲ�����';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : '||EMPID);
    DBMS_OUTPUT.PUT_LINE('�̸� : '||EMPNAME);
    DBMS_OUTPUT.PUT_LINE('�����ڵ� : '||JOBCODE);
    DBMS_OUTPUT.PUT_LINE('���޸� : '||JOBNAME);
    DBMS_OUTPUT.PUT_LINE('�Ҽ� : '||ETEAM);
END;
/

-- IF~ ELSIF ~ ELSE ~ END IF
--����� �Է� ���� �� �޿��� ���� ����� ������ ����ϵ��� �Ͻÿ� 
--�׶� ��� ���� ���,�̸�,�޿�,�޿������ ����Ͻÿ�

--0���� ~ 99���� : F
--100���� ~ 199���� : E
--200���� ~ 299���� : D
--300���� ~ 399���� : C
--400���� ~ 499���� : B
--500���� �̻�(�׿�) : A
--CASE�� �� �ڵ� 
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
    
    DBMS_OUTPUT.PUT_LINE('�����ȣ : '||EMPID);
    DBMS_OUTPUT.PUT_LINE('�̸� : '||EMPNAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : '||SALARY*10000);
    DBMS_OUTPUT.PUT_LINE('�޿���� : '||SALGRADE);
END;
/

---------------------for��--------------------------------------
DECLARE
    USERINFO EMPLOYEE%ROWTYPE;
BEGIN
    FOR N IN 0..4 LOOP
        SELECT *
        INTO USERINFO
        FROM EMPLOYEE
        WHERE EMP_ID = 200 + N;
        DBMS_OUTPUT.PUT_LINE('��� : '||USERINFO.EMP_ID);
        DBMS_OUTPUT.PUT_LINE('�̸� : '||USERINFO.EMP_NAME);
        DBMS_OUTPUT.PUT_LINE('�Ի��� : '||USERINFO.HIRE_DATE);
        DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;
END;
/

--����1) 1~1-10���� �ݺ��Ͽ� KH_PKSQL ���̺� ������ ����ǰ��Ͻÿ�.
CREATE TABLE KH_PLSQL(
    PL_NUM NUMBER UNIQUE,
    CONTENTS VARCHAR2(100),
    PL_DATE DATE
    );

DROP TABLE KH_PLSQL;

BEGIN
    FOR i IN 1..10000 LOOP          --10000�� �μ�Ʈ�ϱ�
        INSERT INTO KH_PLSQL VALUES(i,null,SYSDATE);
    END LOOP;
END;
/
SELECT COUNT(*) FROM KH_PLSQL;
SELECT PL_NUM FROM KH_PLSQL
WHERE PL_NUM < 11
ORDER BY 1;

--WHILE LOOP
--> ���������� TRUE�� ���ȸ� ������ �ݺ���
-->LOOP�� �����Ҷ� ������ ó������ FALSE�̸� �ѹ��� ������� ���� �� ����
-- WHILE LOOP
--> ���� ������ TRUE�� ���ȸ� ������ �ݺ� �����
--> LOOP�� ������ �� ������ ó������ FALSE�̸� �ѹ��� ������� ���� �� ����
DECLARE
    N NUMBER:=1;
BEGIN
    WHILE N <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;
/

    

