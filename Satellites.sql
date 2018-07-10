create table satellite
(
sname varchar (50),
id varchar(20) primary key,
mass real,
power real,
discipline varchar (50)
);

show tables;


select * from satellite;


insert into satellite
values('&sname','&id',&mass,'&power','&discipline');

create table orbit
(
apogee real,
perigee real,
period real,
inclination real,
id varchar(20) primary key,
foreign key (id) references satellite(id)
);

drop table orbit;

alter table rotates
add constraint fk_riid
foreign key (id) references satellite (id) on delete cascade;

alter table rotates
add constraint fk_rid
foreign key (id) references satellite (id) on update cascade;

create table rotates
(
decaytime date default NULL,
id varchar(20) primary key,
foreign key (id) references satellite(id)
);

drop table rotates;

alter table orbit
drop constraint fk_id;

insert into orbit 
values(&apogee,&perigee,&period,&inclination,'&id');

select * from orbit;
select * from rotates;

insert into rotates
values('&decaytime','&id');

insert into rotates
values('92/2/11','1975-033A');
insert into rotates
values('81/5/20','1980-062A');

insert into rotates
values('1/1/1','1988-021A');
insert into rotates
values('1/1/1','1997-057A');
insert into rotates
values('1/1/1','1999-029C');
insert into rotates
values('1/1/1','2000-016B');
insert into rotates
values('1/1/1','2005-017A');
insert into rotates
values('1/1/1','2005-017B');
insert into rotates
values('1/1/1','2007-001B');
insert into rotates
values('1/1/1','2008-021A');
insert into rotates
values('1/1/1','2008-052A');
insert into rotates
values('1/1/1','2009-019A');
insert into rotates
values('1/1/1','2009-051A');
insert into rotates
values('1/1/1','2011-015A');
insert into rotates
values('1/1/1','2011-058B');
insert into rotates
values('1/1/1','2011-058D	'); 
insert into rotates
values('1/1/1','2013-009A	');	 
insert into rotates
values('1/1/1','2013-034A	');	 
insert into rotates
values('1/1/1','2014-017A	');	 
insert into rotates
values('1/1/1','2014-078A');
insert into rotates
values('1/1/1','2015-052A');
insert into rotates
values('1/1/1','2016-059A');
insert into rotates
values('1/1/1','2017-008A');
insert into rotates
values('1/1/1','2017-024A');


SELECT * FROM satellite S
where S.id >= ALL(Select R.id from satellite R);

create table launchstation
(
lname varchar(50) primary key,
lcountry varchar(30),
formed date
);


insert into launchstation
values('&lname','&lcountry','&formed');

select * from launchstation;

drop table launchedBy;
create table launchedBy
(
id varchar(50),
lname varchar(50),
launchvehicle varchar(30),
launchdate date,
primary key(id,lname),
foreign key (id) references satellite(id),
foreign key (lname) references launchstation(lname)
);

insert into launchedBy
values('&id','&lname','&launchvehicle','&launchdate');

delete from launchedBy 
where id='1997-057A';

select * from launchedBy;

create table mission
(
operator varchar(50),
purpose varchar(200),
epochstart date primary key
);

select * from mission;
drop table mission;

insert into mission
values('&operator','&purpose','&date');

CREATE table has
(
epochstart date,
id varchar(20),
primary key(epochstart,id),
foreign key (epochstart) references mission (epochstart),
foreign key (id) references satellite (id)
);

insert into has
values('&date','&id');


desc satellite;


