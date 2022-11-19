-- Execute other different SQL queries DDL, DML, DCL.

USE metalcatalogue;

-- DDL queries
create table Tours (
    TourID int NOT NULL,
    BandName varchar(255) NOT NULL,
    Date_start date,
    Date_end date
);

alter table Tours 
add Country varchar(255) NOT NULL;

-- DML queries
insert into Tours
values (1, 'Metallica', '2008-01-11', '2008-03-21', 'USA'),
       (2, 'Gojira', '2008-03-11', '2008-04-07', 'Ukraine'),
       (3, 'Sabaton', '2008-06-12', '2008-07-01', 'Poland'),
       (4, 'Exodus', '2008-07-10', '2008-07-20', 'USA');

update Tours
set Country = 'Canada'
where TourID = 1;

-- DCL queries
create user testuser identified by 'testpassword';
grant select on metalcatalogue.Tours to testuser;
