CREATE TABLE SRCSCHEMA_ID.s_disposition(
disp_id VARCHAR(10 ),
client_id VARCHAR(10 ),
account_id VARCHAR(10 ),
user_type VARCHAR(6 ),
creation_date DATE,
modification_date DATE,

record_source varchar(255),
disposition_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(disposition_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.s_disposition_hist (like SRCSCHEMA_ID.s_disposition including all);
CREATE TRIGGER versioning_trigger_s_disposition BEFORE INSERT OR UPDATE OR DELETE ON SRCSCHEMA_ID.s_disposition FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRCSCHEMA_ID.s_disposition_hist', true);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.h_disposition(
disp_id VARCHAR(10 ),
client_id VARCHAR(10 ),
account_id VARCHAR(10 ),
disposition_hk CHAR(32),
PRIMARY KEY(disposition_hk)
);
COMMIT;

COMMIT;
