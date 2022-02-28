SET SERVEROUTPUT ON;

--PL/SQL
--> Procedural Language extension to SQL�� ����
--> ����Ŭ ��ü�� ����Ǿ� �ִ� ������ ���ν�, SQL�� ������ �����Ͽ�
-- SQL���� ������ ������ ����, ����ó��, �ݺ�ó�� ���� ������

-- @ PL/SQL ��� ����
--  DECLARE            : ������ ����� �����ϴ� �κ�, (����)
--          [�����]
--  BEGIN               : ���, �ݺ���, �Լ� ���� �� ���� ���, �ʼ�
--          [�����]   �����: INSERT, UPDATE, DELETE
-- EXCEPTION            :���ܻ��� �߻���, �ذ��ϱ� ���� ���� ���,(����)
--          [����ó����]
-- END;                 : �������, �ʼ�
--  /                   : PL/SQL ����,�ʼ�

BEGIN   
--����� �ʼ�
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL'); 
    --��ɾ�
END;    
--�������
/       

SET SERVEROUTPUT ON;    
--�̰� ��������� BEGIN���� ����ȴ�





-- ���� ����
-- ������ [CONSTANT] �ڷ���(����Ʈũ��) [NOT NULL] [:= �ʱⰪ];
DECLARE
    EMPNO NUMBER(4);
    TESTEMPNO NUMBER(5) := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(EMPNO);
END;
/

DECLARE
    EMPNO NUMBER := 1001;
    ENAME VARCHAR2(20) := '����';
BEGIN
    DBMS_OUTPUT.PUT_LINE('��� : '|| EMPNO );
    DBMS_OUTPUT.PUT_LINE('�̸� : '|| ENAME );
END;
/

--���: �Ϲݺ����� �����ϳ� CONSTANT��� Ű���尡 �ڷ��� �տ� �ٰ�
--����ÿ� ���� �Ҵ����־����
DECLARE    
    USER_NAME CONSTANT VARCHAR2(20) := 'ȫ�浿'; --����� ����
    USER_EMAIL VARCHAR2(50) := 'khuser01@iei.or.kr';
BEGIN
    --USER_NAME := '��ȣ��';   --����� ���Ҽ� ����
    DBMS_OUTPUT.put_line('����� : ' || USER_NAME);
    USER_EMAIL := 'khuser01@gamil.com';
    DBMS_OUTPUT.put_line('������ : ' || USER_EMAIL);
END;
/

--PL/SQL ���� SELECT��
--SQL���� �̿��ϴ� ��� �״�� ����� �� ������,SELECT ���� �����
--���� ���� ������ �Ҵ��Ͽ� ��� ����

--����1)
--PL/SQL�� SELECT������ EMPLOYEE ���̺��� ����� �̸� ��ȸ�ϱ�
DECLARE
    VEMPNO EMPLOYEE.EMP_ID % TYPE;
    VENAME EMPLOYEE.EMP_NAME % TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
    INTO VEMPNO, VENAME
    FROM EMPLOYEE
    WHERE EMP_NAME= '���߱�';
    DBMS_OUTPUT.PUT_LINE('��� : ' || VEMPNO);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || VENAME );
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('����������...');
    --NO_DATA_FOUND�϶�, ���������� �̶�� ����ض�
END;
/

--����2
--�����ȣ�� �Է¹޾Ƽ� ����� �����ȣ,�̸�,�޿�,�Ի����� ����Ͻÿ�
DECLARE
    VEMPNO EMPLOYEE.EMP_ID % TYPE; 
    --EMPLOYEE���̺��� EMP_ID�� ���� Ÿ���� ���ڴ� 
    VEMPNAME EMPLOYEE.EMP_NAME % TYPE;
    VSALARY EMPLOYEE.SALARY % TYPE;
    VHIREDATE EMPLOYEE.HIRE_DATE  % TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME,SALARY, HIRE_DATE
    INTO VEMPNO,VEMPNAME,VSALARY,VHIREDATE 
    --�� �Է¹ޱ�
    FROM EMPLOYEE
    WHERE EMP_ID= '&EMPID';
    DBMS_OUTPUT.PUT_LINE('�����ȣ: ' || VEMPNO);
    DBMS_OUTPUT.PUT_LINE('�̸�: ' || VEMPNAME);
    DBMS_OUTPUT.PUT_LINE('�޿�: ' || VSALARY);
    DBMS_OUTPUT.PUT_LINE('�Ի���: ' || VHIREDATE);
 END; 
 /
 
 --����1)
--��� ��ȣ�� �Է� �޾Ƽ� ���� ����� 
--�����ȣ,�̸�,�μ��ڵ�,�μ����� ����ϵ��� �Ͻÿ�
DECLARE
    EMPID EMPLOYEE.EMP_ID % TYPE; 
    --EMPLOYEE���̺��� EMP_ID�� ���� Ÿ���� ���ڴ� 
    EMPNAME EMPLOYEE.EMP_NAME % TYPE;
    DEPTCODE EMPLOYEE.DEPT_CODE % TYPE;
    DEPTTITLE DEPARTMENT.DEPT_TITLE % TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME , DEPT_CODE, DEPT_TITLE
    INTO EMPID, EMPNAME, DEPTCODE, DEPTTITLE
    --���� �����ִ� ��Ŭ���� ���ٰ� ���
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CDOE = DEPT_ID
    WHERE EMP_ID = '&�����ȣ';
    DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || EMPID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || EMPNAME);
    DBMS_OUTPUT.PUT_LINE('�μ��ڵ� : ' || DEPTCODE);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || DEPTTITLE);
END;
/

    

