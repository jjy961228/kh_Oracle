------------------------------TCL--------------------------------------
--TCL(Transaction Control Language)
--ex)ATM : (ī�����>�޴�����>���>�ݾ�>���>������) �� ���� �Ѳ����� ó���ؾ��ϴ� ��
--      �߰��� ����� Ʋ���� ó������ ���ư���~

CREATE TABLE KH_TRANSACTION(
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL
    );

INSERT INTO KH_TRANSACTION
VALUES(1, 'khuser01', 'pass01');

INSERT INTO KH_TRANSACTION
VALUES(2, 'khuser02', 'pass02');

INSERT INTO KH_TRANSACTION
VALUES(3, 'khuser03', 'pass03');
COMMIT;
--> INSERT,UPDATE,DELETE �� ����ϸ� Ʈ�������� �ɷ��ִ� �����̰� , COMMIT OR ROLLBACK�� ������Ѵ�
--> COMMIT OR ROLLBACK�� ���࿩�Ѵ�

INSERT INTO KH_TRANSACTION
VALUES(4, 'khuser04', 'pass04');
SAVEPOINT SP1;                  --SAVEPOINT: �ӽ��������ش� 

INSERT INTO KH_TRANSACTION
VALUES(5, 'khuser05', 'pass05');

ROLLBACK to SP1;            -- SP1�� ���ư���         

ROLLBACK;                                --���������� COMMIT�� �������� �ǵ���



--TEST 01���� KH_TRANSACTION ���� ���̺� �� �� �ִ� �����ֱ�
--1)SYSTEM �������� �����ֱ� : GRANT SELECT ON KH.KH_TRANSACTION TO TEST01;
--2)TEST01 �������� ����ϱ� : SELECT * FROM KH.KH_TRANSACTION;
--3)SYSTEM �������� ���ѻ��� : REVOKE SELECT ON KH.KH_TRANSACTION FROM TEST01

 

