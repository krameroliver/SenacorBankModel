CREATE TABLE BIZ.s_geschaeftspartner(
kundennummer VARCHAR(18 ),
vorname VARCHAR(24 ),
nachname VARCHAR(24 ),
geburtsdatum DATE,
geschlecht integer,
sozialversicherungsnummer VARCHAR(24 ),
kreditkartenanzahl integer,
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,PROCESSING_POINT)
);

CREATE TABLE BIZ.s_geschaeftspartner_hist (like BIZ.s_geschaeftspartner including all);
CREATE TRIGGER versioning_trigger_s_geschaeftspartner BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_geschaeftspartner FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.geschaeftspartner_hist', true);
---
CREATE TABLE BIZ.h_geschaeftspartner(
geschaeftspartner_hk CHAR(32),
PRIMARY KEY(geschaeftspartner_hk)
);
---
CREATE TABLE BIZ.s_geschaeftspartner_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,PROCESSING_POINT)
);

CREATE TABLE BIZ.s_geschaeftspartner_fc_hist (like BIZ.s_geschaeftspartner including all);
CREATE TRIGGER versioning_trigger_s_geschaeftspartner_fc BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_geschaeftspartner_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.geschaeftspartner_fc_hist', true);
---

CREATE TABLE BIZ.s_geschaeftspartner_Postalische_Addresse(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,PROCESSING_POINT)
);
CREATE TABLE BIZ.s_geschaeftspartner_Postalische_Addresse_hist (like BIZ.s_geschaeftspartner_Postalische_Addresse including all);
CREATE TRIGGER versioning_trigger_BIZ_s_geschaeftspartner_Postalische_Addresse BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_geschaeftspartner_Postalische_Addresse FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.s_geschaeftspartner_Postalische_Addresse_hist', true);

CREATE TABLE BIZ.m_geschaeftspartner_Digitale_Addresse(
kontakttyp integer,
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,PROCESSING_POINT)
);
CREATE TABLE BIZ.m_geschaeftspartner_Digitale_Addresse_hist (like BIZ.m_geschaeftspartner_Digitale_Addresse including all);
CREATE TRIGGER versioning_trigger_m_BIZ_s_geschaeftspartner_Digitale_Addresse BEFORE INSERT OR UPDATE OR DELETE ON BIZ.m_geschaeftspartner_Digitale_Addresse FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.m_geschaeftspartner_Digitale_Addresse_hist', true);
---
CREATE TABLE BIZ.s_geschaeftspartner_Postalische_Addresse_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,PROCESSING_POINT)
);

CREATE TABLE BIZ.s_geschaeftspartner_Postalische_Addresse_fc_hist (like BIZ.s_geschaeftspartner_Postalische_Addresse_fc including all);
CREATE TRIGGER versioning_trigger_s_BIZ_s_geschaeftspartner_Postalische_Addresse_fc BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_geschaeftspartner_Postalische_Addresse_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.s_geschaeftspartner_Postalische_Addresse_fc_hist', true);
CREATE TABLE BIZ.m_geschaeftspartner_Digitale_Addresse_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(geschaeftspartner_hk,PROCESSING_POINT)
);

CREATE TABLE BIZ.s_geschaeftspartner_Digitale_Addresse_fc_hist (like BIZ.s_geschaeftspartner_Digitale_Addresse_fc including all);
CREATE TRIGGER versioning_trigger_s_BIZ_s_geschaeftspartner_Digitale_Addresse_fc BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_geschaeftspartner_Digitale_Addresse_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.s_geschaeftspartner_Digitale_Addresse_fc_hist', true);
---
CREATE TABLE BIZ.r_s_link_gp_darlehen_geschaeftspartner_darlehen(

link_gp_darlehen_hk CHAR(32),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(link_gp_darlehen_hk,PROCESSING_POINT));
	
CREATE TABLE BIZ.r_s_link_gp_darlehen_geschaeftspartner_darlehen_hist (like BIZ.r_s_link_gp_darlehen_geschaeftspartner_darlehen including all);
CREATE TRIGGER versioning_trigger_BIZ_r_s_link_gp_darlehen_geschaeftspartner_darlehen BEFORE INSERT OR UPDATE OR DELETE ON BIZ.r_s_link_gp_darlehen_geschaeftspartner_darlehen FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.r_s_link_gp_darlehen_geschaeftspartner_darlehen_hist', true);

CREATE TABLE BIZ.r_link_gp_darlehen_geschaeftspartner_darlehen(
link_gp_darlehen_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
darlehen_hk CHAR(32)
PRIMARY KEY(link_gp_darlehen_hk));
