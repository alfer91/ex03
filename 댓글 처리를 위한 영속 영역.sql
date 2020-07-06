--댓글 처리를 위한 영속 영역

create table tbl_reply (
    rno NUMBER(10,0),
    bno NUMBER(10,0) not null,
    reply VARCHAR2(1000) not null,
    replyer VARCHAR2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply add constraint fk_reply foreign key (bno) references tbl_board(bno);