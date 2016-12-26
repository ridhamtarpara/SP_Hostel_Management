
    create table achievements (
        achievementId int8 not null,
        date date,
        detail varchar(100000),
        status varchar(255),
        title varchar(255),
        studentId int8,
        primary key (achievementId)
    );

    create table activities (
        activityId int8 not null,
        date date,
        description varchar(255),
        title varchar(255),
        type varchar(255),
        rectorId int8,
        primary key (activityId)
    );

    create table admins (
        adminId int8 not null,
        qualifications varchar(255),
        hostelId int8,
        userId int8,
        primary key (adminId)
    );

    create table applicants (
        applicantId int8 not null,
        collegeId int8,
        subCourseId int8,
        userId int8,
        primary key (applicantId)
    );

    create table applications (
        applicationId int8 not null,
        date date,
        status varchar(255),
        applicantId int8,
        primary key (applicationId)
    );

    create table authorities (
        userId int8 not null,
        role varchar(255)
    );

    create table books (
        bookId int8 not null,
        author varchar(255),
        date date,
        description varchar(255),
        name varchar(255),
        price int8,
        publication varchar(255),
        semester int8,
        subCourseId int8,
        studentId int8,
        primary key (bookId)
    );

    create table colleges (
        collegeId int8 not null,
        address varchar(255),
        collegeName varchar(255),
        primary key (collegeId)
    );

    create table complaints (
        complaintId int8 not null,
        complaintType varchar(255),
        date date,
        detail varchar(100000),
        status varchar(255),
        title varchar(255),
        studentId int8,
        primary key (complaintId)
    );

    create table courses (
        courseId int8 not null,
        courseName varchar(255),
        primary key (courseId)
    );

    create table forum_answers (
        answerId int8 not null,
        answer varchar(255),
        date timestamp,
        questionId int8,
        studentId int8,
        primary key (answerId)
    );

    create table forum_questions (
        questionId int8 not null,
        date timestamp,
        description text,
        question varchar(255),
        studentId int8,
        subCourseId int8,
        primary key (questionId)
    );

    create table globalparams (
        paramId int8 not null,
        admissionOn boolean not null,
        primary key (paramId)
    );

    create table hostels (
        hostelId int8 not null,
        address varchar(255),
        availableSeats int4 not null,
        contactNumber int8,
        deposit int8,
        fee int8,
        foodBill int8,
        hostelFor varchar(255),
        hostelName varchar(255),
        seats int4 not null,
        totalRooms int4 not null,
        primary key (hostelId)
    );

    create table invoices (
        invoiceId int8 not null,
        amount int8,
        invoiceDate date,
        invoiceType varchar(255),
        paymentType varchar(255),
        totalAmount int8,
        studentId int8,
        primary key (invoiceId)
    );

    create table leaveapplications (
        leaveApplicationId int8 not null,
        address varchar(255),
        detail varchar(100000),
        leaveDate date,
        returnDate date,
        status varchar(255),
        title varchar(255),
        studentId int8,
        primary key (leaveApplicationId)
    );

    create table parents (
        parentId int8 not null,
        parent_business varchar(255),
        parent_firstName varchar(255),
        parent_income int8,
        parent_lastName varchar(255),
        parent_middleName varchar(255),
        parent_mobileNumber int8,
        parent_totalMembers int4 not null,
        userId int8,
        primary key (parentId)
    );

    create table persistent_logins (
        series varchar(64) not null,
        last_used timestamp not null,
        token varchar(64) not null,
        username varchar(64) not null,
        primary key (series)
    );

    create table rectors (
        rectorId int8 not null,
        qualifications varchar(255),
        hostelId int8,
        userId int8,
        primary key (rectorId)
    );

    create table relatives (
        relativeId int8 not null,
        relative_address varchar(255),
        relative_firstName varchar(255),
        relative_lastName varchar(255),
        relative_middleName varchar(255),
        relative_mobileNumber int8,
        relative_relation varchar(255),
        userId int8,
        primary key (relativeId)
    );

    create table reports (
        reportId int8 not null,
        date date,
        description varchar(255),
        title varchar(255),
        primary key (reportId)
    );

    create table results (
        resultId int8 not null,
        sem1 float4,
        sem10 float4,
        sem2 float4,
        sem3 float4,
        sem4 float4,
        sem5 float4,
        sem6 float4,
        sem7 float4,
        sem8 float4,
        sem9 float4,
        x float4,
        xii float4,
        userId int8,
        primary key (resultId)
    );

    create table rooms (
        roomId int8 not null,
        numberOfStudents int4 not null,
        remarks varchar(255),
        roomNumber int4 not null,
        hostelId int8,
        primary key (roomId)
    );

    create table student_applications (
        studentApplicationId int8 not null,
        date date,
        sameRoomPreference boolean,
        status varchar(255),
        studentId int8,
        primary key (studentApplicationId)
    );

    create table students (
        studentId int8 not null,
        currentYear int8,
        studentValid boolean not null,
        collegeId int8,
        subCourseId int8,
        hostelId int8,
        roomId int8,
        userId int8,
        primary key (studentId)
    );

    create table subcourses (
        subCourseId int8 not null,
        durationInYear int4 not null,
        subCourseName varchar(255),
        courseId int8,
        primary key (subCourseId)
    );

    create table trustees (
        trusteeId int8 not null,
        designation varchar(255),
        userId int8,
        primary key (trusteeId)
    );

    create table users (
        userId int8 not null,
        address1 varchar(255),
        address2 varchar(255),
        appliedOn timestamp,
        birthDate date,
        bloodGroup varchar(255),
        city varchar(255),
        email varchar(255) not null,
        firstName varchar(255),
        gender varchar(255),
        lastName varchar(255),
        middleName varchar(255),
        mobileNumber int8,
        nativeDistrict varchar(255),
        nativeTaluka varchar(255),
        nativeVillage varchar(255),
        nativeZipCode int8,
        password varchar(255) not null,
        zipCode int8,
        primary key (userId)
    );

    create table vehicleRegisters (
        vehicleRegisterId int8 not null,
        licenceNumber varchar(255),
        status varchar(255),
        vehicleModel varchar(255),
        vehicleNumber varchar(255),
        studentId int8,
        primary key (vehicleRegisterId)
    );

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table achievements 
        add constraint FK_a5aafpnx9mn9xvbnkjtsxukb4 
        foreign key (studentId) 
        references students;

    alter table activities 
        add constraint FK_a7dw8ug3sjx60njhkx8mf21v4 
        foreign key (rectorId) 
        references rectors;

    alter table admins 
        add constraint FK_e03na26dstb9vxbb2n7p1ub4x 
        foreign key (hostelId) 
        references hostels;

    alter table admins 
        add constraint FK_j0ev1q13kxxxnmhcm907kp6jc 
        foreign key (userId) 
        references users;

    alter table applicants 
        add constraint FK_7jbq72aw4k2ttdon3ilu0v4ql 
        foreign key (collegeId) 
        references colleges;

    alter table applicants 
        add constraint FK_po31oixpb6eeiv878iej3jmur 
        foreign key (subCourseId) 
        references subcourses;

    alter table applicants 
        add constraint FK_7ybc5450ofakgm3oldtlpvd3b 
        foreign key (userId) 
        references users;

    alter table applications 
        add constraint FK_cwfl2arxs3s6epw57brip0cw8 
        foreign key (applicantId) 
        references applicants;

    alter table authorities 
        add constraint FK_c537bqgmt0b0kcuuy4mmy4tyk 
        foreign key (userId) 
        references users;

    alter table books 
        add constraint FK_lhq6ttybqc7p401nmc8lk29fe 
        foreign key (subCourseId) 
        references subcourses;

    alter table books 
        add constraint FK_bxphfrlifuwky2fun7a5hkh2h 
        foreign key (studentId) 
        references students;

    alter table complaints 
        add constraint FK_f2em0bisaij0be88v2u42gw3r 
        foreign key (studentId) 
        references students;

    alter table forum_answers 
        add constraint FK_9mmuj8d7lj0x53kdtkx8i4d2v 
        foreign key (questionId) 
        references forum_questions;

    alter table forum_answers 
        add constraint FK_ificw0l2hx5d21wkun3nhah9x 
        foreign key (studentId) 
        references students;

    alter table forum_questions 
        add constraint FK_42v5stsxeo0ex2p22jtcl2e4d 
        foreign key (studentId) 
        references students;

    alter table forum_questions 
        add constraint FK_iibsd8kttrl9dht9v8msh6mit 
        foreign key (subCourseId) 
        references subcourses;

    alter table invoices 
        add constraint FK_agrewllajh0w87w99nh1jsk5e 
        foreign key (studentId) 
        references students;

    alter table leaveapplications 
        add constraint FK_gpxmo77jay0r5jsiu3wyx0n65 
        foreign key (studentId) 
        references students;

    alter table parents 
        add constraint FK_r9cvugxkp3eu9rcl6vys54rsp 
        foreign key (userId) 
        references users;

    alter table rectors 
        add constraint FK_glsg1te4jjy64uko938qa4sn2 
        foreign key (hostelId) 
        references hostels;

    alter table rectors 
        add constraint FK_5gpmb4qelok1dcrasr01vfh81 
        foreign key (userId) 
        references users;

    alter table relatives 
        add constraint FK_jfgowe3e2bwdvp6luqncdwmpf 
        foreign key (userId) 
        references users;

    alter table results 
        add constraint FK_maicb5klqbdr6qi590m9ugw1u 
        foreign key (userId) 
        references users;

    alter table rooms 
        add constraint FK_lk0bc2p6hk1ii92mebgjrdkft 
        foreign key (hostelId) 
        references hostels;

    alter table student_applications 
        add constraint FK_no7tlrper0wa59mhidaqqlbr3 
        foreign key (studentId) 
        references students;

    alter table students 
        add constraint FK_ifbl58agl1g2jc13r7h1h5hqh 
        foreign key (collegeId) 
        references colleges;

    alter table students 
        add constraint FK_2mkbbxfyoquv990x7d2qt22db 
        foreign key (subCourseId) 
        references subcourses;

    alter table students 
        add constraint FK_fnqhs79uwy6mb89pued2vvjnc 
        foreign key (hostelId) 
        references hostels;

    alter table students 
        add constraint FK_gcg9iff8o76yyuaice2fg2ny0 
        foreign key (roomId) 
        references rooms;

    alter table students 
        add constraint FK_e63avufj65gi343dnb4cnpea7 
        foreign key (userId) 
        references users;

    alter table subcourses 
        add constraint FK_1hlwl0fvcuh5a08fam4lfqsam 
        foreign key (courseId) 
        references courses;

    alter table trustees 
        add constraint FK_6budnah5lvul9uvpts3ruyxvb 
        foreign key (userId) 
        references users;

    alter table vehicleRegisters 
        add constraint FK_sjqd0hn2pwdx7kucfgj0382c3 
        foreign key (studentId) 
        references students;

    create sequence MY_SEQ;

    create sequence MY_SEQINVOIVE;

    create sequence MY_SEQadmin;

    create sequence MY_SEQapplicant;

    create sequence MY_SEQparent;

    create sequence MY_SEQrector;

    create sequence MY_SEQrelative;

    create sequence MY_SEQstudent;

    create sequence MY_SEQtrustee;

    create sequence hibernate_sequence;
