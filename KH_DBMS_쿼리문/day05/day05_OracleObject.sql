------------------------------------ Oracle Object-----------------------------
--Sequence: ���������� �������� �ڵ����λ����ϴ� ��ü
--������ ���۰�(START WITH)�� �������� ���Ѵ� -->����,������ ���� ��ü�ؾ��Ѵ�
CREATE SEQUENCE SEQ_USERNO;     --�⺻������ ����

SELECT SEQ_USERNO.NEXTVAL FROM DUAL; --���� 1 ������Ű�� ������
SELECT SEQ_USERNO.CURRVAL FROM DUAL; --���簪�� ������

CREATE SEQUENCE SEQ_USERNO_SEC
START WITH 100  --ó���� 100���� ���� 
INCREMENT BY 10 --10������
MAXVALUE 1000   --�ִ�� 1000
NOCYCLE
NOCACHE;    --�޸� ���� : �������� 

SELECT SEQ_USERNO_SEC.NEXTVAL FROM DUAL;
SELECT SEQ_USERNO_SEC.CURRVAL FROM DUAL;
SELECT * FROM USER_SEQUENCES;   --Data Dictionary View : ����� �����ֱ�

CREATE TABLE SHOP_MEMBER(
    USER_NO NUMBER UNIQUE,
    USER_ID VARCHAR2(20) PRIMARY KEY,
    USER_PWD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30) NOT NULL,
    USER_GENDER VARCHAR2(2),
    USER_PHONE VARCHAR2(20),
    USER_EMAIL VARCHAR2(50)
    );
INSERT INTO SHOP_MEMBER 
VALUES(1, 'khuser01','pass01', '�Ͽ���' , 'F', '01029223933' , 'khuser01@iei.or.kr');

INSERT INTO SHOP_MEMBER 
VALUES(2, 'khuser02','pass02', '�̿���' , 'W', '01029223933' , 'khuser01@iei.or.kr');
COMMIT;

ALTER TABLE SHOP_MEMBER             --SHOP_GENDER���� 'W'���  '�� �ֱ����� 
MODIFY USER_GENDER VARCHAR2(100);

DELETE FROM SHOP_MEMBER;
COMMIT;

-------------------������ �̿��� �����
CREATE SEQUENCE SEQ_USER_NO;
--INSERT �Ҷ� , ��ȣ��� 1�������ϴ� SEQ_USER_NO.NEXTVAL �־��ֱ�
INSERT INTO SHOP_MEMBER VALUES(SEQ_USER_NO.NEXTVAL, 'khuser01', 'pass01', '�Ͽ���', '��'
,'01023239432', 'khuser01@iei.or.kr');
INSERT INTO SHOP_MEMBER VALUES(SEQ_USER_NO.NEXTVAL, 'khuser02', 'pass02', '�̿���', '��'
,'01022323432', 'khuser02@iei.or.kr');
COMMIT;

------------------ ������ ���� ���� 
--KH_MEMBER ���̺��� ����
--�÷�
--MEMBER_ID	NUNBER
--MEMBER_NAME	VARCHAR2(20)
--MEMBER_AGE	NUMBER
--MEMBER_JOIN_COM	NUMBER
CREATE TABLE KH_MEMBER(
    MEMBER_ID NUMBER,
    MEMBER_NAME	VARCHAR2(20),
    MEMBER_AGE	NUMBER,
    MEMBER_JOIN_COM	NUMBER
    );

--�̶� �ش� ������� ������ INSERT �ؾ� ��
--ID ���� JOIN_COM�� SEQUENCE �� �̿��Ͽ� ������ �ְ��� ��

--ID���� 500 �� ���� �����Ͽ� 10�� �����Ͽ� ���� �ϰ��� ��
--JOIN_COM ���� 1������ �����Ͽ� 1�� �����Ͽ� ���� �ؾ� ��
--(ID ���� JOIN_COM ���� MAX�� 10000���� ����)
CREATE SEQUENCE SEQ_JOIN_COM
START WITH 1
INCREMENT BY 1
MAXVALUE 1000
NOCYCLE;

CREATE SEQUENCE SEQ_MEMBER_ID
START WITH 500
INCREMENT BY 10
MAXVALUE 1000
NOCYCLE;

INSERT INTO KH_MEMBER
VALUES( SEQ_MEMBER_ID.NEXTVAL, 'ȫ�浿' , 20, SEQ_JOIN_COM.NEXTVAL);
INSERT INTO KH_MEMBER
VALUES( SEQ_MEMBER_ID.NEXTVAL, '�踻��' , 30, SEQ_JOIN_COM.NEXTVAL);
INSERT INTO KH_MEMBER
VALUES( SEQ_MEMBER_ID.NEXTVAL, '�����' , 40, SEQ_JOIN_COM.NEXTVAL);
INSERT INTO KH_MEMBER
VALUES( SEQ_MEMBER_ID.NEXTVAL, '����' , 24, SEQ_JOIN_COM.NEXTVAL);
--	MEMBER_ID	MEMBER_NAME	MEMBER_AGE	MEMBER_JOIN_COM	
--	500		ȫ�浿		20		1
--	510		�踻��		30		2
--	520		�����		40		3
--	530		����		24		4
COMMIT;     --Ŀ���� �Է����������� ���� Ʈ������ �����̴� .

--�������� �����ٲٱ�
--������ ���۰�(START WITH)�� �������� ���Ѵ� -->����,������ ���� ��ü�ؾ��Ѵ�
-- DDL ��ɹ� ������ : (CREATE, ALTER, DROP)  SEQUENCE   ��ü��
ALTER SEQUENCE SEQ_MEMBER_ID
INCREMENT BY 100
MAXVALUE 10000;     --�̷������� ����
DROP SEQUENCE SEQ_MEMBER_ID; --�̷������� ���� 


--ORACLE OBJECT , INDEX : ���ֻ���ϴ� �÷��� INDEX�ɾ��ָ� ���÷��� ��ȸ�Ҷ� �ӵ��� ��������
--����: �˻��ӵ��� �������� 
--����: �߰�������� �ʿ�, �ε��������� �ð��̰ɸ���
CREATE INDEX EMP_IND_NND 
ON EMPLOYEE(EMP_NAME , EMP_NO, HIRE_DATE);  --> ���� �ε����� �����

SELECT EMP_NAME, EMP_NO, HIRE_DATE      --> ��ȸ
FROM EMPLOYEE;




    


    


