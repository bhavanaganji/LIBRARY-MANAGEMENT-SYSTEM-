create database library_management;

use library_management;

create table borrower(
cardno int auto_increment primary key,
borrowername varchar(100),
borroweraddress varchar(200),
borrowerphone varchar(150));

select * from borrower;



create table publisher(
publishername varchar(100) primary key,
publisheraddress varchar(255),
publisherphone varchar(100));


select * from publisher;




create table librarybranch(
branchid int auto_increment primary key,
branchname varchar(200),
branchaddress varchar(255));



select * from  librarybranch;


create table book(
bookid int auto_increment primary key,
book_title varchar(255),
book_publishername varchar(100),
foreign key
(book_publishername) references publisher(publishername) on delete cascade on update cascade
);

select * from book;



create table book_copies(
copiesid int auto_increment primary key,
bookid int,
branchid int,
no_of_copies int,
foreign key
(bookid) references book(bookid) on delete cascade on update cascade,
foreign key
(branchid) references librarybranch(branchid) on delete cascade on update cascade
);

select * from book_copies;



create table book_loans(
loansid int auto_increment primary key,
bookid int,
branchid int,
cardno int,
dateout date,
dueout date,
foreign key
(bookid) references book(bookid) on delete cascade on update cascade,
foreign key
(branchid) references librarybranch(branchid) on delete cascade on update  cascade,
foreign key
(cardno) references borrower(cardno) on delete cascade on update cascade
);
select * from book_loans;


create table book_authors(
authorid int auto_increment primary key,
bookid int,
authorname varchar(100),
foreign key
(bookid) references book(bookid) on delete cascade on update cascade
);
select * from book_authors;

-- 1 How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
select sum(book_copies.no_of_copies) from book
inner join book_copies on book.bookid=book_copies.bookid 
inner join librarybranch on book_copies.branchid=librarybranch.branchid
where book.book_title='the lost tribe' and librarybranch.branchname='Sharpstown';

-- 2 How many copies of the book titled "The Lost Tribe" are owned by each library branch?
select librarybranch.branchname,sum(book_copies.no_of_copies) as no_of_copies_losttribe from book
inner join book_copies on book.bookid=book_copies.bookid 
inner join librarybranch on book_copies.branchid=librarybranch.branchid
where book.book_title='the lost tribe'
group by librarybranch.branchname; 

-- 3 Retrieve the names of all borrowers who do not have any books checked out.
select borrowername as borwrname_of_notchecked from borrower
left join book_loans on borrower.cardno=book_loans.cardno
where book_loans.cardno is null;

-- 4 For each book that is loaned out from the "Sharpstown" branch and whose DueDate is 2/3/18, retrieve the book title, the borrower's name, and the borrower's address. 
select book_title,borrowername,borroweraddress from book
inner join book_loans on book.bookid=book_loans.bookid
inner join borrower on book_loans.cardno=borrower.cardno
inner join librarybranch on book_loans.branchid=librarybranch.branchid
where librarybranch.branchname='Sharpstown' and book_loans.dueout='2/3/18';

-- 5 For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
select branchname,count(book_loans.loansid) from book_loans
inner join librarybranch on book_loans.branchid=librarybranch.branchid
group by librarybranch.branchname;

-- 6 Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out.
select borrowername,borroweraddress,count(book_loans.bookid) from borrower
right join book_loans on borrower.cardno=book_loans.cardno
group by borrower.borrowername,borrower.borroweraddress having count(book_loans.bookid)>5;

-- 7 For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
select book_title,sum(book_copies.no_of_copies) from book
inner join book_authors on book.bookid=book_authors.bookid
inner join book_copies on book_authors.bookid=book_copies.bookid
inner join librarybranch on book_copies.branchid=librarybranch.branchid
where book_authors.authorname='Stephen King' and librarybranch.branchname='central'
group by book_title;






 





















