--�����ͺ��̽��� �ε��� ����

select * from user_cons_columns order by position;
--sqldeveloper ���̺� - �ε������� Į�� Ȯ�� ����
select * from user_ind_columns;

--tbl_reply�� pk rno �ε����� �������� ��ȸ - where���� �ش��ϴ� �� full scan
select rownum rn, rno, bno, reply, replyer from tbl_reply where bno = 6815922 order by rno asc;

--�Խñ� ��ȣ�� ���� ��(�ֽ� ��)���� ����, ��� ��ȣ�� �������� ����(�ֽ� ���� ��������)
create index idx_reply on tbl_reply (bno desc, rno asc);


select /*+ index(tbl_reply idx_reply) */ rownum rn, bno, rno, reply, replyer, replyDate, updateDate
from tbl_reply
where bno = 6815922;


--��� ����¡ ��ȸ
select rno, bno, reply, replyer, replydate, updateDate
from (
    select /*+ index(tbl_reply idx_reply) */ rownum rn, bno, rno, reply, replyer, replyDate, updateDate 
    from tbl_reply
    where bno = 6815922
    and rownum <= 20
    )
where rn > 10;

