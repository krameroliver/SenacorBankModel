CREATE TABLE SRC.s_acct(
account_id VARCHAR(10 ),
district_id integer,
frequency VARCHAR(100 ),
parseddate DATE,
year integer,
month integer,
day integer,
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
acct_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(acct_hk,effectiv_timerange)
);

CREATE TABLE SRC.s_acct_hist (like SRC.s_acct including all);
CREATE TRIGGER versioning_trigger_s_acct BEFORE INSERT OR UPDATE OR DELETE ON SRC.s_acct FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC.acct_hist', true);
---
CREATE TABLE SRC.h_acct(
acct_hk CHAR(32),
PRIMARY KEY(acct_hk)
);
---
CREATE TABLE SRC.s_acct_fc(
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
acct_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(acct_hk,effectiv_timerange)
);

CREATE TABLE SRC.s_acct_fc_hist (like SRC.s_acct including all);
CREATE TRIGGER versioning_trigger_s_acct_fc BEFORE INSERT OR UPDATE OR DELETE ON SRC.s_acct_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC.acct_fc_hist', true);
---
---
---

