CREATE TABLE MORPORK.s_disposition(
disp_id VARCHAR(10 ),
client_id VARCHAR(10 ),
account_id VARCHAR(10 ),
user_type VARCHAR(6 ),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
disposition_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(disposition_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_disposition_hist (like MORPORK.s_disposition including all);
CREATE TRIGGER versioning_trigger_s_disposition BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_disposition FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.disposition_hist', true);
---
CREATE TABLE MORPORK.h_disposition(
disposition_hk CHAR(32),
PRIMARY KEY(disposition_hk)
);
---
CREATE TABLE MORPORK.s_disposition_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
disposition_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(disposition_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_disposition_fc_hist (like MORPORK.s_disposition including all);
CREATE TRIGGER versioning_trigger_s_disposition_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_disposition_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.disposition_fc_hist', true);
---
---
---

