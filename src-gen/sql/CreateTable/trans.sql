CREATE TABLE SRCSCHEMA_ID.s_trans(
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

record_source varchar(255),
trans_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(trans_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.s_trans_hist (like SRCSCHEMA_ID.s_trans including all);
CREATE TRIGGER versioning_trigger_s_trans BEFORE INSERT OR UPDATE OR DELETE ON SRCSCHEMA_ID.s_trans FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRCSCHEMA_ID.s_trans_hist', true);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.h_trans(
trans_id VARCHAR(10 ),
account_id VARCHAR(10 ),
trans_hk CHAR(32),
PRIMARY KEY(trans_hk)
);
COMMIT;

COMMIT;
