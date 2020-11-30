CREATE TABLE SRC${SCHEMA_ID}.s_order(
order_id VARCHAR(10 ),
account_id VARCHAR(10 ),
bank_to VARCHAR(2 ),
account_to integer,
amount NUMERIC(20 ,10),
k_symbol VARCHAR(100 ),
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
order_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(order_hk,effectiv_timerange)
);

CREATE TABLE SRC${SCHEMA_ID}.s_order_hist (like SRC${SCHEMA_ID}.s_order including all);
CREATE TRIGGER versioning_trigger_s_order BEFORE INSERT OR UPDATE OR DELETE ON SRC${SCHEMA_ID}.s_order FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC${SCHEMA_ID}.order_hist', true);
---
CREATE TABLE SRC${SCHEMA_ID}.h_order(
order_id VARCHAR(10 ),
account_id VARCHAR(10 ),
order_hk CHAR(32),
PRIMARY KEY(order_hk)
);
---
---

