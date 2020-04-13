/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/4/13 19:39:40                           */
/*==============================================================*/


drop table if exists CheckIn;

drop table if exists Course;

drop table if exists Student;

drop table if exists TimeTable;

/*==============================================================*/
/* Table: CheckIn                                               */
/*==============================================================*/
create table CheckIn
(
   stuID                int(9),
   isCheckIn            boolean not null,
   checkInTime          datetime not null
);

/*==============================================================*/
/* Table: Course                                                */
/*==============================================================*/
create table Course
(
   couID                int not null auto_increment,
   tableID              int,
   couName              varchar(20) not null,
   couRoom              varchar(20) not null,
   couWeekType          int not null,
   couStartNodes        int not null,
   couEndNodes          int not null,
   couStartWeek         int not null,
   couEndWeek           int not null,
   couTeacher           varchar(10) not null,
   couWeek              int not null,
   primary key (couID)
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   stuID                int(9) not null,
   eduPassword          varchar(20) not null,
   leavePassword        varchar(20) not null,
   primary key (stuID)
);

/*==============================================================*/
/* Table: TimeTable                                             */
/*==============================================================*/
create table TimeTable
(
   tableID              int not null auto_increment,
   stuID                int(9),
   tableName            varchar(10) not null,
   tableItems           varchar(100) not null,
   primary key (tableID)
);

alter table CheckIn add constraint "FK_stuID-Check" foreign key (stuID)
      references Student (stuID) on delete restrict on update restrict;

alter table Course add constraint FK_tableID foreign key (tableID)
      references TimeTable (tableID) on delete restrict on update restrict;

alter table TimeTable add constraint "FK_stuID-Table" foreign key (stuID)
      references Student (stuID) on delete restrict on update restrict;

