--------------------DQL ��������-----------------
SELECT * FROM EMPLOYEE;
--���ʽ� �ǽ�����--
-- ���� �ǽ� ����
-- ����1. 
-- �Ի����� 5�� �̻�, 10�� ������ ������ �̸�,�ֹι�ȣ,�޿�,�Ի����� �˻��Ͽ���
SELECT
    EMP_NAME , FLOOR((SYSDATE-HIRE_DATE)/365) "�Ի���"
FROM EMPLOYEE
WHERE (SYSDATE-HIRE_DATE)/365 BETWEEN 5 AND 10;

-- ����2.
-- �������� �ƴ� ������ �̸�,�μ��ڵ�, �����, �ٹ��Ⱓ, �������� �˻��Ͽ��� 
--(��� ���� : ENT_YN) HIRE_DATAE: �����
SELECT
    EMP_NAME,                                                                                             
    DEPT_CODE,
    HIRE_DATE,
    FLOOR(SYSDATE-HIRE_DATE)
FROM EMPLOYEE
WHERE ENT_YN = 'Y';

-- ����3.
-- �ټӳ���� 10�� �̻��� �������� �˻��Ͽ�
-- ��� ����� �̸�,�޿�,�ټӳ��(�Ҽ���X)�� �ټӳ���� ������������ �����Ͽ� ����Ͽ���
-- ��, �޿��� 50% �λ�� �޿��� ��µǵ��� �Ͽ���.
-- ORDER BY �÷��� ASC ->��������      �÷��� : �÷����� ��ü����
--             3   DESC ->��������   (DESC)�� �������� ,
SELECT
    EMP_NAME "�̸�",
    SALARY "�޿�",
    FLOOR((SYSDATE-HIRE_DATE)/365) "�ټӳ��"
FROM EMPLOYEE
WHERE FLOOR((SYSDATE-HIRE_DATE)/365) >= 10
ORDER BY FLOOR((SYSDATE-HIRE_DATE)/365);

-- ����4.
-- �Ի����� 99/01/01 ~ 10/01/01 �� ��� �߿��� �޿��� 2000000 �� ������ �����`
-- �̸�,�ֹι�ȣ,�̸���,����ȣ,�޿��� �˻� �Ͻÿ�
SELECT 
    EMP_NAME "�̸�",
    EMP_NO "�ֹι�ȣ",
    EMAIL "�̸���",
    PHONE "����ȣ",
    SALARY "�޿�"
FROM EMPLOYEE
WHERE (HIRE_DATE BETWEEN '99/01/01' AND '10/01/01')
       AND SALARY <= 2000000;      --DATE�� 'YY-MM-DD' �� �� ���ֱ�
       
 SELECT * FROM EMPLOYEE;
-- ����5.
-- �޿��� 2000000�� ~ 3000000�� �� ������ �߿��� 4�� �����ڸ� �˻��Ͽ� 
-- �̸�,�ֹι�ȣ,�޿�,�μ��ڵ带 �ֹι�ȣ ������(��������) ����Ͽ���
-- ��, �μ��ڵ尡 null�� ����� �μ��ڵ尡 '����' ���� ��� �Ͽ���.
SELECT 
    EMP_NAME "�̸�",
    EMP_NO "�ֹι�ȣ",
    SALARY "�޿�",
    NVL(DEPT_CODE,'����') " �μ��ڵ�"
FROM EMPLOYEE
WHERE (SALARY BETWEEN 2000000 AND 3000000)
       AND EMP_NO LIKE '______-2%'  --������
       AND EMP_NO LIKE '__04%'      --4������      -->__04__-2% : ������ AND 04����
ORDER BY EMP_NO;

-- ����6.(*)
-- ���� ��� �� ���ʽ��� ���� ����� ���ñ��� �ٹ����� �����Ͽ� 
-- 1000�� ����(�Ҽ��� ����) 
-- �޿��� 10% ���ʽ��� ����Ͽ� �̸�,Ư�� ���ʽ� (��� �ݾ�) ����� ����Ͽ���.
-- ��, �̸� ������ ���� ���� �����Ͽ� ����Ͽ���.
SELECT * FROM EMPLOYEE;
SELECT
    EMP_NAME "�̸�",
    EMP_NO, 
    BONUS,
    SYSDATE-HIRE_DATE "�ٹ��ϼ�",
    FLOOR((SYSDATE-HIRE_DATE)/1000 * (SALARY*0.1)) "Ư�����ʽ�"
FROM EMPLOYEE
WHERE EMP_NO LIKE '%-1%'
      AND BONUS IS NULL;        --���ʽ��� ���»�� : BONUS = NULL (X)
 --                                                 BONUS IS NULL(O)
      
      



       













