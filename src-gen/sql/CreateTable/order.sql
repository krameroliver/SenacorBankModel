CREATE TABLE MORPORK.s_order(
order_id VARCHAR(10 ),
account_id VARCHAR(10 ),
bank_to VARCHAR(2 ),
account_to integer,
amount NUMERIC(20 ,10),
k_symbol VARCHAR(100 ),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
order_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(order_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_order_hist (like MORPORK.s_order including all);
CREATE TRIGGER versioning_trigger_s_order BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_order FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.order_hist', true);
---
CREATE TABLE MORPORK.h_order(
order_hk CHAR(32),
PRIMARY KEY(order_hk)
);
---
CREATE TABLE MORPORK.s_order_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
order_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(order_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_order_fc_hist (like MORPORK.s_order including all);
CREATE TRIGGER versioning_trigger_s_order_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_order_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.order_fc_hist', true);
---
---
---

