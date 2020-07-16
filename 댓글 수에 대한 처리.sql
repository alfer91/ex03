
-- 댓글의 수에 대한 처리, 댓글 추가 -> tbl_reply insert, tbl_board replyCnt update

alter table tbl_board add (replycnt number default 0);

update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);