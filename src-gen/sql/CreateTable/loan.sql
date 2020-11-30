CREATE TABLE SRC${SCHEMA_ID}.s_loan(
loan_id VARCHAR(10 ),
account_id VARCHAR(10 ),
amount integer,
duration integer,
payments integer,
status VARCHAR(1 ),
year integer,
month integer,
day integer,
fulldate DATE,
location integer,
purpose VARCHAR(255 ),
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
loan_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(loan_hk,effectiv_timerange)
);

CREATE TABLE SRC${SCHEMA_ID}.s_loan_hist (like SRC${SCHEMA_ID}.s_loan including all);
CREATE TRIGGER versioning_trigger_s_loan BEFORE INSERT OR UPDATE OR DELETE ON SRC${SCHEMA_ID}.s_loan FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC${SCHEMA_ID}.loan_hist', true);
---
CREATE TABLE SRC${SCHEMA_ID}.h_loan(
loan_id VARCHAR(10 ),
account_id VARCHAR(10 ),
loan_hk CHAR(32),
PRIMARY KEY(loan_hk)
);
---
---

