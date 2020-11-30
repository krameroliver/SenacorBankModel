CREATE TABLE SRCSCHEMA_ID.s_acct(
account_id VARCHAR(10 ),
district_id integer,
frequency VARCHAR(100 ),
parseddate DATE,
year integer,
month integer,
day integer,
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
acct_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(acct_hk)
);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.s_acct_hist (like SRCSCHEMA_ID.s_acct including all);
CREATE TRIGGER versioning_trigger_s_acct BEFORE INSERT OR UPDATE OR DELETE ON SRCSCHEMA_ID.s_acct FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRCSCHEMA_ID.s_acct_hist', true);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.h_acct(
acct_hk CHAR(32),
PRIMARY KEY(acct_hk)
);
COMMIT;

COMMIT;
