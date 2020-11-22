CREATE TABLE MORPORK.s_acct(
account_id VARCHAR(10 ),
district_id integer,
frequency VARCHAR(100 ),
parseddate DATE,
year integer,
month integer,
day integer,
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
acct_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(acct_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_acct_hist (like MORPORK.s_acct including all);
CREATE TRIGGER versioning_trigger_s_acct BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_acct FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.acct_hist', true);
---
CREATE TABLE MORPORK.h_acct(
acct_hk CHAR(32),
PRIMARY KEY(acct_hk)
);
---
CREATE TABLE MORPORK.s_acct_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
acct_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(acct_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_acct_fc_hist (like MORPORK.s_acct including all);
CREATE TRIGGER versioning_trigger_s_acct_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_acct_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.acct_fc_hist', true);
---
---
---

