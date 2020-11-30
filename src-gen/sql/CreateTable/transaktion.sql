CREATE TABLE BIZSCHEMA_ID.s_transaktion(
transaktions_id VARCHAR(20 ),
ausfuehrungsdatum DATE,
betrag NUMERIC(20 ,10),
buchungsart VARCHAR(50 ),
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
transaktion_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(transaktion_hk)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_transaktion_hist (like BIZSCHEMA_ID.s_transaktion including all);
CREATE TRIGGER versioning_trigger_s_transaktion BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_transaktion FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_transaktion_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.h_transaktion(
transaktion_hk CHAR(32),
PRIMARY KEY(transaktion_hk)
);
COMMIT;

COMMIT;
