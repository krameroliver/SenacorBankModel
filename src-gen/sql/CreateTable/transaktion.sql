CREATE TABLE BIZSCHEMA_ID.s_transaktion(
transaktions_id VARCHAR(20 ),
ausfuehrungsdatum DATE,
betrag NUMERIC(20 ,10),
buchungsart VARCHAR(50 ),
loeschung integer,
creation_date DATE,
modification_date DATE,

record_source varchar(255),
transaktion_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(transaktion_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_transaktion_hist (like BIZSCHEMA_ID.s_transaktion including all);
CREATE TRIGGER versioning_trigger_s_transaktion BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_transaktion FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_transaktion_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.h_transaktion(
transaktions_id VARCHAR(20 ),
transaktion_hk CHAR(32),
PRIMARY KEY(transaktion_hk)
);
COMMIT;

CREATE TABLE BIZSCHEMA_ID.r_s_link_cc_trans(

link_cc_trans_hk CHAR(32),
creation_date DATE,
modification_date DATE,
record_source varchar(255),
transaktion_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(link_cc_trans_hk,effectiv_timerange));
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_s_link_cc_trans_hist (like BIZSCHEMA_ID.r_s_link_cc_trans including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_cc_trans BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.r_s_link_cc_trans FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.r_s_link_cc_trans_hist', true);
CREATE TABLE BIZSCHEMA_ID.r_s_link_darlehen_trans(

link_darlehen_trans_hk CHAR(32),
creation_date DATE,
modification_date DATE,
record_source varchar(255),
transaktion_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(link_darlehen_trans_hk,effectiv_timerange));
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_s_link_darlehen_trans_hist (like BIZSCHEMA_ID.r_s_link_darlehen_trans including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_darlehen_trans BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.r_s_link_darlehen_trans FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.r_s_link_darlehen_trans_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_link_cc_trans(
link_cc_trans_hk CHAR(32),
transaktion_hk CHAR(32),
transaktion_hk CHAR(32),
PRIMARY KEY(link_cc_trans_hk));COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_link_darlehen_trans(
link_darlehen_trans_hk CHAR(32),
transaktion_hk CHAR(32),
darlehen_hk CHAR(32),
PRIMARY KEY(link_darlehen_trans_hk));COMMIT;
