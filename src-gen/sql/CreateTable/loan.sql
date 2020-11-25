CREATE TABLE Source.s_loan(
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
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
loan_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(loan_hk,PROCESSING_POINT)
);

CREATE TABLE Source.s_loan_hist (like Source.s_loan including all);
CREATE TRIGGER versioning_trigger_s_loan BEFORE INSERT OR UPDATE OR DELETE ON Source.s_loan FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'Source.loan_hist', true);
---
CREATE TABLE Source.h_loan(
loan_hk CHAR(32),
PRIMARY KEY(loan_hk)
);
---
CREATE TABLE Source.s_loan_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
loan_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(loan_hk,PROCESSING_POINT)
);

CREATE TABLE Source.s_loan_fc_hist (like Source.s_loan including all);
CREATE TRIGGER versioning_trigger_s_loan_fc BEFORE INSERT OR UPDATE OR DELETE ON Source.s_loan_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'Source.loan_fc_hist', true);
---
---
---

