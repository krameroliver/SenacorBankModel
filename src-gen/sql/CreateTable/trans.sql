CREATE TABLE MORPORK.s_trans(
run_id integer,
trans_id VARCHAR(10 ),
account_id VARCHAR(10 ),
trans_type VARCHAR(100 ),
operation VARCHAR(100 ),
amount NUMERIC(20 ,10),
balance VARCHAR(100 ),
k_symbol VARCHAR(100 ),
bank VARCHAR(2 ),
account integer,
year integer,
month integer,
day integer,
fulldate DATE,
fulltime VARCHAR(10 ),
fulldatewithtime timestamp,
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
trans_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(trans_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_trans_hist (like MORPORK.s_trans including all);
CREATE TRIGGER versioning_trigger_s_trans BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_trans FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.trans_hist', true);
---
CREATE TABLE MORPORK.h_trans(
trans_hk CHAR(32),
PRIMARY KEY(trans_hk)
);
---
CREATE TABLE MORPORK.s_trans_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
trans_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(trans_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_trans_fc_hist (like MORPORK.s_trans including all);
CREATE TRIGGER versioning_trigger_s_trans_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_trans_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.trans_fc_hist', true);
---
---
---

