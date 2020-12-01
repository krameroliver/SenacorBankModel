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

CREATE TABLE BIZSCHEMA_ID.r_s_link_cc_trans_transaktion_transaktion(

link_cc_trans_hk CHAR(32),
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
transaktion_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(link_cc_trans_hk));
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_s_link_cc_trans_transaktion_transaktion_hist (like BIZSCHEMA_ID.r_s_link_cc_trans_transaktion_transaktion including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_cc_trans_transaktion_transaktion BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.r_s_link_cc_trans_transaktion_transaktion FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.r_s_link_cc_trans_transaktion_transaktion_hist', true);
CREATE TABLE BIZSCHEMA_ID.r_s_link_darlehen_trans_transaktion_darlehen(

link_darlehen_trans_hk CHAR(32),
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
transaktion_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(link_darlehen_trans_hk));
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_s_link_darlehen_trans_transaktion_darlehen_hist (like BIZSCHEMA_ID.r_s_link_darlehen_trans_transaktion_darlehen including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_darlehen_trans_transaktion_darlehen BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.r_s_link_darlehen_trans_transaktion_darlehen FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.r_s_link_darlehen_trans_transaktion_darlehen_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_link_cc_trans_transaktion_transaktion(
link_cc_trans_hk CHAR(32),
transaktion_hk CHAR(32),
transaktion_hk CHAR(32),
PRIMARY KEY(link_cc_trans_hk));COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_link_darlehen_trans_transaktion_darlehen(
link_darlehen_trans_hk CHAR(32),
transaktion_hk CHAR(32),
darlehen_hk CHAR(32),
PRIMARY KEY(link_darlehen_trans_hk));COMMIT;
