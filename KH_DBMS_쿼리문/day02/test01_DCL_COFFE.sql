CREATE TABLE COFFEE(
    PRODUCT_NAME VARCHAR2(20) CONSTRAINT PK_PRODUCTNAME PRIMARY KEY,
    PRICE NUMBER NOT NULL,
    COMPANY VARCHAR2(20) NOT NULL
);

INSERT INTO COFFEE VALUES('�ƽ�Ŀ��', '3000', 'MAXIM');
INSERT INTO COFFEE VALUES('ī��Ŀ��', '5000', 'MAXIM');
INSERT INTO COFFEE VALUES('�׽�ī��Ŀ��', '4000', 'NESCAFE');
COMMIT;

SELECT * FROM KHUSER.COFFEE; --SYSTEM�������� ���ѹ޾����ϱ� �� �� �ִ� 
                            --�⺻������ �ڽ�(KHUSER)�� ���� ���̺�(COFFEE)�� �ڽ�(KHUSER)�� ��ȸ����������
                            --���Ѻο�(GRANT~~) �� ���ؼ� �ٸ����� (TEST01)�� ��ȸ�����ϵ��� �� �� ����.
                            --���Ѻο��� GRANT�� ����

INSERT INTO KHUSER.COFFEE 
VALUES('����ġī��', 20000 , '��������');
COMMIT;