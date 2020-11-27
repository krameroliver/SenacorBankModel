CREATE TABLE SRC${SCHEMA_ID}.s_disposition(
disp_id VARCHAR(10 ),
client_id VARCHAR(10 ),
account_id VARCHAR(10 ),
user_type VARCHAR(6 ),
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
disposition_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(disposition_hk,effectiv_timerange)
);

CREATE TABLE SRC${SCHEMA_ID}.s_disposition_hist (like SRC${SCHEMA_ID}.s_disposition including all);
CREATE TRIGGER versioning_trigger_s_disposition BEFORE INSERT OR UPDATE OR DELETE ON SRC${SCHEMA_ID}.s_disposition FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC${SCHEMA_ID}.disposition_hist', true);
---
CREATE TABLE SRC${SCHEMA_ID}.h_disposition(
disp_id VARCHAR(10 ),
client_id VARCHAR(10 ),
account_id VARCHAR(10 ),
disposition_hk CHAR(32),
PRIMARY KEY(disposition_hk)
);
---
---

