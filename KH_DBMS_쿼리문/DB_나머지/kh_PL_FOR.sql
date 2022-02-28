SET SERVEROUTPUT ON;
-- PL/SQL �ݺ���
-- BASIC LOOP : ���Ǿ��� ���ѹݺ�
-- 1 ~ 5���� �ݺ� ����ϱ�
DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N+1;
        IF N>10 THEN EXIT;
        END IF;
    END LOOP;
END;
/

-- FOR LOOP
--> FOR LOOP������ ī��Ʈ�� ������ �ڵ� ����ǹǷ�
--> ���� ���� ������ �ʿ䰡 ����
--> ī��Ʈ ���� �ڵ����� 1�� ������
--> REVERSE�� 1�� ������
BEGIN
    FOR N IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/
-- REVERSE
BEGIN
    FOR N IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
/
-- �ݺ����� �̿��Ͽ� ������̺��� �����ȣ, �̸�, �Ի����� ����Ͻÿ�
-- ��, �����ȣ�� 200, 201, 202, 203, 204�� ����� ��� ����Ͻÿ�.
DECLARE
    USERINFO EMPLOYEE%ROWTYPE;
BEGIN
    FOR N IN 0..4 LOOP
        SELECT *
        INTO USERINFO
        FROM EMPLOYEE
        WHERE EMP_ID = 200 + N;
        DBMS_OUTPUT.put_line('��� : '||USERINFO.EMP_ID);
        DBMS_OUTPUT.put_line('�̸� : '||USERINFO.EMP_NAME);
        DBMS_OUTPUT.put_line('�Ի��� : '||USERINFO.HIRE_DATE);
        DBMS_OUTPUT.PUT_LINE('----------------------------');
    END LOOP;
END;
/

-- ����) 1 ~ 10���� �ݺ��Ͽ� KH_PLSQL ���̺� ����ǰ� �Ͻÿ�.
CREATE TABLE KH_PLSQL(
    PL_NUM NUMBER UNIQUE,
    CONTENTS VARCHAR2(100),
    PL_DATE DATE
);

BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO KH_PLSQL VALUES(i, NULL, SYSDATE);
    END LOOP;
END;
/

SELECT COUNT(*) FROM KH_PLSQL;
SELECT PL_NUM FROM KH_PLSQL
WHERE PL_NUM < 11
ORDER BY 1;


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
