--NOT NULL : ID�� PW���� �� �����ϴ� �����Ϳ� NOT NULL�� ���ش�
DROP TABLE STUDENT_NOTNULL;
CREATE TABLE STUDENT_NOTNULL(
    STUDENT_ID VARCHAR2(20) NOT NULL,
    STUDENT_PWD VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL,
    STUDENT_GENDER VARCHAR2(3),
    STUDENT_ADDRESS VARCHAR2(500)
    );

INSERT INTO STUDENT_NOTNULL
VALUES(NULL,NULL,NULL,NULL,NULL);   --cannot insert NULL into : NULL�� �� �� ����  : ���ֳ����� �����ϱ� �ܿ��α�

INSERT INTO STUDENT_NOTNULL
VALUES('KHUSER01','PASS01','�Ͽ���',NULL,NULL);        --�ٸ������� NULL�� �� �� �ִ�
COMMIT;



DROP TABLE STUDNET_UNIQUE;
CREATE TABLE STUDNET_UNIQUE(
    STUDENT_ID VARCHAR2(10) UNIQUE,
    STUDENT_PWD VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL,
    STUDENT_GENDER VARCHAR2(3) CHECK(STUDENT_GENDER IN ('��','��')),
    SUTDNET_ADDRESS VARCHAR2(500)
    );
INSERT INTO STUDNET_UNIQUE VALUES('KHUSER01','PASS01','�Ͽ���','��',NULL);      --unique constraint : ����ũ ���̶� 'KHUSER01' ������ ���� �� ����, 
                                                                                --��,unique�� �ߺ��� ��������ʴ´�
INSERT INTO STUDNET_UNIQUE VALUES('KHUSER02','PASS02','�̿���','��',NULL);
INSERT INTO STUDNET_UNIQUE VALUES('KHUSER03','PASS02','�����','M',NULL);        --check constraint
                                                                                --CHECK�� ���� '��','��' �� �����ϴµ� �ٸ��� �� �� �������� 










                                                                                
CREATE TABLE STUDENT_PRIMARYKEY(
    STUDENT_ID VARCHAR2(20) PRIMARY KEY,
    STUDENT_PWD VARCHAR2(30) NOT NULL,
    STUDENT_NAME VARCHAR2(30) NOT NULL,
    STUDENT_GENDER VARCHAR2(3),
    STUDENT_ADDRESS VARCHAR2(500)
);

INSERT INTO STUDENT_PRIMARYKEY                  --unique constraint:                                               
VALUES('KHUSER01','PASS01','�Ͽ���','��','����'); --2���Է½ó����� ����  : PRIMARY KEY�� ���� �����̴�







DROP TABLE USER_GRADE;

CREATE TABLE USER_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);

INSERT INTO USER_GRADE VALUES(10,'�Ϲ�ȸ��');
INSERT INTO USER_GRADE VALUES(20,'���ȸ��');
INSERT INTO USER_GRADE VALUES(30,'Ư��ȸ��');
COMMIT;

DROP TABLE USER_FOREIGHKEY;

CREATE TABLE USER_FOREIGHKEY(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) UNIQUE,
    USER_WPD VARCHAR2(30) NOT NULL,
    USER_NAME VARCHAR2(30),
    GENDER VARCHAR2(3),
    PHONE VARCHAR2(30),
    EMAIL VARCHAR2(50),
    GRADE_CODEN NUMBER REFERENCES USER_GRADE(GRADE_CODE)        --(GRADE_CODE)�������� 
    );
    
INSERT INTO USER_FOREIGHKEY
VALUES(1,'USER01', 'PASS01', 'ȫ�浿', '��', '010-1234-5678', 'HONG123@KH.OR.KR',10);

INSERT INTO USER_FOREIGHKEY
VALUES(2,'USER02', 'PASS02', '�̼���', '��', '010-5678-9012', 'LEE123@KH.OR.KR',20);

INSERT INTO USER_FOREIGHKEY
VALUES(3,'USER03', 'PASS03', '������', '��', '010-9999-3131', 'YOO123@KH.OR.KR',30);
COMMIT;

INSERT INTO USER_FOREIGHKEY
VALUES(4,'USER04', 'PASS04', '�Ӳ���', '��', '010-3222-2323', 'LIM123',40);     --USER_GRADE���� 40�� ���� -> USER_FOREIGHKEY ���� 40�� �ִ� 
                                                                            --�̸� �����ϱ����� �θ�(USER_GRADE) -> �ڽ�(USER_FOREIGHKEY) ������ �����
COMMIT;
                                                                                --�ڽ����̺��� �÷��� ���� �θ����̺��� �ö������� ����ϵ��� �����ϴ� ��������: �ܷ�Ű(FOREIGN KEY)
DROP TABLE USER_FOREIGHKEY;

    


    