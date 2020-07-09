--데이터베이스의 인덱스 설계

select * from user_cons_columns order by position;
--sqldeveloper 테이블 - 인덱스에서 칼럼 확인 가능
select * from user_ind_columns;

--tbl_reply을 pk rno 인덱스로 오름차순 조회 - where절에 해당하는 행 full scan
select rownum rn, rno, bno, reply, replyer from tbl_reply where bno = 6815922 order by rno asc;

--게시글 번호가 높은 순(최신 순)으로 정렬, 댓글 번호는 오름차순 정렬(최신 순은 내림차순)
create index idx_reply on tbl_reply (bno desc, rno asc);


select /*+ index(tbl_reply idx_reply) */ rownum rn, bno, rno, reply, replyer, replyDate, updateDate
from tbl_reply
where bno = 6815922;


--댓글 페이징 조회
select rno, bno, reply, replyer, replydate, updateDate
from (
    select /*+ index(tbl_reply idx_reply) */ rownum rn, bno, rno, reply, replyer, replyDate, updateDate 
    from tbl_reply
    where bno = 6815922
    and rownum <= 20
    )
where rn > 10;

