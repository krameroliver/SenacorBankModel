CREATE TABLE BIZSCHEMA_ID.s_geschaeftspartner(
kundennummer VARCHAR(18 ),
anrede VARCHAR(20 ),
vorname VARCHAR(24 ),
nachname VARCHAR(24 ),
geburtsdatum DATE,
sterbedatum DATE,
geschlecht integer,
sozialversicherungsnummer VARCHAR(24 ),
kreditkartenanzahl integer,
loeschung integer,
creation_date DATE,
modification_date DATE,

record_source varchar(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_geschaeftspartner_hist (like BIZSCHEMA_ID.s_geschaeftspartner including all);
CREATE TRIGGER versioning_trigger_s_geschaeftspartner BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_geschaeftspartner FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_geschaeftspartner_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.h_geschaeftspartner(
kundennummer VARCHAR(18 ),
geschaeftspartner_hk CHAR(32),
PRIMARY KEY(geschaeftspartner_hk)
);
COMMIT;

CREATE TABLE BIZSCHEMA_ID.s_geschaeftspartner_Postalische_Addresse(
creation_date DATE,
modification_date DATE,
record_source varchar(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_geschaeftspartner_Postalische_Addresse_hist (like BIZSCHEMA_ID.s_geschaeftspartner_Postalische_Addresse including all);
CREATE TRIGGER versioning_trigger_BIZ_s_geschaeftspartner_Postalische_Addresse BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_geschaeftspartner_Postalische_Addresse FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_geschaeftspartner_Postalische_Addresse_hist', true);

CREATE TABLE BIZSCHEMA_ID.m_geschaeftspartner_Digitale_Addresse(
kontakttyp integer,
creation_date DATE,
modification_date DATE,
record_source varchar(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.m_geschaeftspartner_Digitale_Addresse_hist (like BIZSCHEMA_ID.m_geschaeftspartner_Digitale_Addresse including all);
CREATE TRIGGER versioning_trigger_m_BIZ_s_geschaeftspartner_Digitale_Addresse BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.m_geschaeftspartner_Digitale_Addresse FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.m_geschaeftspartner_Digitale_Addresse_hist', true);

CREATE TABLE BIZSCHEMA_ID.r_s_link_gp_darlehen(

link_gp_darlehen_hk CHAR(32),
creation_date DATE,
modification_date DATE,
record_source varchar(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(link_gp_darlehen_hk,effectiv_timerange));
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_s_link_gp_darlehen_hist (like BIZSCHEMA_ID.r_s_link_gp_darlehen including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_gp_darlehen BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.r_s_link_gp_darlehen FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.r_s_link_gp_darlehen_hist', true);
CREATE TABLE BIZSCHEMA_ID.r_s_link_gp_cc(

link_gp_cc_hk CHAR(32),
creation_date DATE,
modification_date DATE,
record_source varchar(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(link_gp_cc_hk,effectiv_timerange));
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_s_link_gp_cc_hist (like BIZSCHEMA_ID.r_s_link_gp_cc including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_gp_cc BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.r_s_link_gp_cc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.r_s_link_gp_cc_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_link_gp_darlehen(
link_gp_darlehen_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
darlehen_hk CHAR(32),
PRIMARY KEY(link_gp_darlehen_hk));COMMIT;
CREATE TABLE BIZSCHEMA_ID.r_link_gp_cc(
link_gp_cc_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
kreditkarte_hk CHAR(32),
PRIMARY KEY(link_gp_cc_hk));COMMIT;
