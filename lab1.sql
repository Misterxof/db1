DROP TABLE relation_9;
DROP TABLE relation_12;
DROP TABLE report;
DROP TABLE member;
DROP TABLE meeting;
DROP TABLE section;
DROP TABLE сonference;
DROP TABLE headmaster;

CREATE TABLE headmaster (
	headmaster_id			INTEGER NOT NULL,
	name					VARCHAR2(30) NOT NULL,
	last_name				VARCHAR2(30) NOT NULL
);

ALTER TABLE headmaster
    ADD CONSTRAINT headmaster_pk PRIMARY KEY ( headmaster_id );

CREATE TABLE meeting (
    meeting_id              INTEGER NOT NULL,
    section_сonference_id   INTEGER NOT NULL,
    section_section_id      INTEGER NOT NULL
);

ALTER TABLE meeting
    ADD CONSTRAINT meeting_pk PRIMARY KEY ( meeting_id,section_сonference_id,section_section_id );

CREATE TABLE member (
    member_id         INTEGER NOT NULL,
    ns                VARCHAR2(30) NOT NULL,
    address           VARCHAR2(30) NOT NULL,
    mail         	  VARCHAR2(30) NOT NULL,
    place_of_work     VARCHAR2(30) NOT NULL,
    post              VARCHAR2(30) NOT NULL,
    current_address   VARCHAR2(30) NOT NULL,
    role              VARCHAR2(30) NOT NULL
);

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( member_id );

CREATE TABLE relation_12 (
    сonference_id      INTEGER NOT NULL,
    member_member_id   INTEGER NOT NULL
);

ALTER TABLE relation_12 ADD CONSTRAINT relation_12_pk PRIMARY KEY ( сonference_id,member_member_id );

CREATE TABLE relation_9 (
    member_member_id            INTEGER NOT NULL,
    report_report_id            INTEGER NOT NULL,
    report_meeting_meeting_id   INTEGER NOT NULL,
    report_meeting_id           INTEGER NOT NULL,
    report_meeting_section_id   INTEGER NOT NULL
);

ALTER TABLE relation_9
    ADD CONSTRAINT relation_9_pk PRIMARY KEY ( member_member_id,report_report_id,report_meeting_meeting_id,report_meeting_id,report_meeting_section_id
);

CREATE TABLE report (
    report_id            INTEGER NOT NULL,
    name                 VARCHAR2(30) NOT NULL,
    summery              VARCHAR2(300) NOT NULL,
    meeting_meeting_id   INTEGER NOT NULL,
    meeting_id           INTEGER NOT NULL,
    meeting_section_id   INTEGER NOT NULL
);

ALTER TABLE report
    ADD CONSTRAINT report_pk PRIMARY KEY ( report_id,meeting_meeting_id,meeting_id,meeting_section_id );

CREATE TABLE section (
    сonference_id   INTEGER NOT NULL,
    section_id      INTEGER NOT NULL
);

ALTER TABLE section ADD CONSTRAINT section_pk PRIMARY KEY ( сonference_id,section_id );

CREATE TABLE сonference (
    id   INTEGER NOT NULL
);

ALTER TABLE сonference ADD CONSTRAINT сonference_pk PRIMARY KEY ( id );

ALTER TABLE meeting
    ADD CONSTRAINT meeting_section_fk FOREIGN KEY ( section_сonference_id,section_section_id )
        REFERENCES section ( сonference_id,section_id ) ON DELETE CASCADE;

ALTER TABLE relation_12
    ADD CONSTRAINT relation_12_member_fk FOREIGN KEY ( member_member_id )
        REFERENCES member ( member_id ) ON DELETE CASCADE;

ALTER TABLE relation_12
    ADD CONSTRAINT relation_12_сonference_fk FOREIGN KEY ( сonference_id )
        REFERENCES сonference ( id ) ON DELETE CASCADE;

ALTER TABLE relation_9
    ADD CONSTRAINT relation_9_member_fk FOREIGN KEY ( member_member_id )
        REFERENCES member ( member_id ) ON DELETE CASCADE;

ALTER TABLE relation_9
    ADD CONSTRAINT relation_9_report_fk FOREIGN KEY ( report_report_id,report_meeting_meeting_id,report_meeting_id,report_meeting_section_id
)
        REFERENCES report ( report_id,meeting_meeting_id,meeting_id,meeting_section_id ) ON DELETE CASCADE;

ALTER TABLE report
    ADD CONSTRAINT report_meeting_fk FOREIGN KEY ( meeting_meeting_id,meeting_id,meeting_section_id )
        REFERENCES meeting ( meeting_id,section_сonference_id,section_section_id ) ON DELETE CASCADE;

ALTER TABLE section
    ADD CONSTRAINT section_сonference_fk FOREIGN KEY ( сonference_id )
        REFERENCES сonference ( id ) ON DELETE CASCADE;
