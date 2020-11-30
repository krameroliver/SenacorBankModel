CREATE TABLE SRC${SCHEMA_ID}.s_acct(
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
effectiv_timerange daterange,
PRIMARY KEY(acct_hk,effectiv_timerange)
);

CREATE TABLE SRC${SCHEMA_ID}.s_acct_hist (like SRC${SCHEMA_ID}.s_acct including all);
CREATE TRIGGER versioning_trigger_s_acct BEFORE INSERT OR UPDATE OR DELETE ON SRC${SCHEMA_ID}.s_acct FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC${SCHEMA_ID}.acct_hist', true);
---
CREATE TABLE SRC${SCHEMA_ID}.h_acct(
account_id VARCHAR(10 ),
district_id integer,
acct_hk CHAR(32),
PRIMARY KEY(acct_hk)
);
---
---

