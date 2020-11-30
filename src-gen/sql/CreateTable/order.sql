CREATE TABLE SRCSCHEMA_ID.s_order(
order_id VARCHAR(10 ),
account_id VARCHAR(10 ),
bank_to VARCHAR(2 ),
account_to integer,
amount NUMERIC(20 ,10),
k_symbol VARCHAR(100 ),
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
order_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(order_hk)
);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.s_order_hist (like SRCSCHEMA_ID.s_order including all);
CREATE TRIGGER versioning_trigger_s_order BEFORE INSERT OR UPDATE OR DELETE ON SRCSCHEMA_ID.s_order FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRCSCHEMA_ID.s_order_hist', true);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.h_order(
order_hk CHAR(32),
PRIMARY KEY(order_hk)
);
COMMIT;

COMMIT;
