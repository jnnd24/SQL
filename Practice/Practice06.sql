/*2022-05-19
■다음과같이출력되도록테이블을생성하고데이터를입력하세요
*/
--기존 테이블,시퀀스 삭제
drop table book;
drop table author;
drop SEQUENCE seq_author_id;
drop SEQUENCE seq_book_id;


--작가테이블, 시퀀스 생성
create table author(
    author_id   number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    PRIMARY KEY (author_id)
);

create sequence seq_author_id
increment by 1
start with 1
nocache;

--작가데이터 입력
insert into author
values (seq_author_id.nextval, '김문열', '경북 영양');

insert into author
values (seq_author_id.nextval, '박경리', '경상남도 통영');

insert into author
values (seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author
values (seq_author_id.nextval, '기안84', '기안동에서 산84년생');

insert into author
values (seq_author_id.nextval, '강풀', '온라인 만화가 1세대');

insert into author
values (seq_author_id.nextval, '김영하', '알쓸신잡');

--데이터 확인
select *
from author;


--------------
--book 테이블, 시퀀스 생성
create table book(
    book_id     number(10),
    title       varchar2(100) not null,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    PRIMARY KEY (book_id),
    constraint book_fk foreign key (author_id)
    references author(author_id)
);

create sequence seq_book_id
increment by 1
start with 1
nocache;

--book테이블 자료 넣기
insert into book
values (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998/02/22', 1);

insert into book
values (seq_book_id.nextval, '삼국지', '민음사', '2002-03-01', 1);

insert into book
values (seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15', 2);

insert into book
values (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);

insert into book
values (seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22', 4);

insert into book
values (seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03', 5);

insert into book
values (seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04', 6);

insert into book
values (seq_book_id.nextval, '26년', '재미주의', '201202-04', 5);

--데이터확인
select *
from book;



--출력완료
select *
from book bo, author au
where bo.author_id = au.author_id;

--강풀의 author_desc 정보를 ‘서울특별시’ 로 변경해보세요
update author
set author_desc = '서울특별시'
where author_id = 5;

select *
from book bo, author au
where bo.author_id = au.author_id;




