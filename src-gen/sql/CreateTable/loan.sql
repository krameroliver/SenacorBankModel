CREATE TABLE SRCSCHEMA_ID.s_loan(
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

record_hk CHAR(32),
loan_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(loan_hk)
);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.s_loan_hist (like SRCSCHEMA_ID.s_loan including all);
CREATE TRIGGER versioning_trigger_s_loan BEFORE INSERT OR UPDATE OR DELETE ON SRCSCHEMA_ID.s_loan FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRCSCHEMA_ID.s_loan_hist', true);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.h_loan(
loan_hk CHAR(32),
PRIMARY KEY(loan_hk)
);
COMMIT;

COMMIT;
