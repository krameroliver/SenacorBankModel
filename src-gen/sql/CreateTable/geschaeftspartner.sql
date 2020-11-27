CREATE TABLE BIZ${SCHEMA_ID}.s_geschaeftspartner(
kundennummer VARCHAR(18 ),
vorname VARCHAR(24 ),
nachname VARCHAR(24 ),
geburtsdatum DATE,
geschlecht integer,
sozialversicherungsnummer VARCHAR(24 ),
kreditkartenanzahl integer,
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(geschaeftspartner_hk,effectiv_timerange)
);

CREATE TABLE BIZ${SCHEMA_ID}.s_geschaeftspartner_hist (like BIZ${SCHEMA_ID}.s_geschaeftspartner including all);
CREATE TRIGGER versioning_trigger_s_geschaeftspartner BEFORE INSERT OR UPDATE OR DELETE ON BIZ${SCHEMA_ID}.s_geschaeftspartner FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ${SCHEMA_ID}.geschaeftspartner_hist', true);
---
CREATE TABLE BIZ${SCHEMA_ID}.h_geschaeftspartner(
geschaeftspartner_hk CHAR(32),
PRIMARY KEY(geschaeftspartner_hk)
);
---
CREATE TABLE BIZ${SCHEMA_ID}.s_geschaeftspartner_postalische_addresse
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(geschaeftspartner_hk,,effectiv_timerange));

CREATE TABLE BIZ${SCHEMA_ID}.s_geschaeftspartner_postalische_addresse_hist
(like BIZ${SCHEMA_ID}.s_geschaeftspartner_postalische_addresse including all);
CREATE TRIGGER versioning_trigger_s_geschaeftspartner_postalische_addresse 
BEFORE INSERT OR DELETE ON s_geschaeftspartner_postalische_addresse  
FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ${SCHEMA_ID}.s_geschaeftspartner_postalische_addresse_hist, true);
CREATE TABLE BIZ${SCHEMA_ID}.m_geschaeftspartner_digitale_addresse
kontakttyp integer,
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(geschaeftspartner_hk,kontakttyp integer,,effectiv_timerange));

CREATE TABLE BIZ${SCHEMA_ID}.m_geschaeftspartner_digitale_addresse_hist
(like BIZ${SCHEMA_ID}.m_geschaeftspartner_digitale_addresse including all);
CREATE TRIGGER versioning_trigger_m_geschaeftspartner_digitale_addresse 
BEFORE INSERT OR DELETE ON m_geschaeftspartner_digitale_addresse  
FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ${SCHEMA_ID}.m_geschaeftspartner_digitale_addresse_hist, true);
---
   	CREATE TABLE BIZ${SCHEMA_ID}.r_s_link_GP_darlehen__geschaeftspartner_darlehen(

link_gp_darlehen_hk CHAR(32),
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
geschaeftspartner_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(link_gp_darlehen_hk,,effectiv_timerange));
CREATE TABLE BIZ${SCHEMA_ID}.r_s_link_GP_darlehen__geschaeftspartner_darlehen_hist (like BIZ${SCHEMA_ID}.r_s_link_GP_darlehen__geschaeftspartner_darlehen including all);
CREATE TRIGGER versioning_trigger_r_s_link_GP_darlehen__geschaeftspartner_darlehen 
BEFORE INSERT OR DELETE BIZ${SCHEMA_ID}.r_s_link_GP_darlehen__geschaeftspartner_darlehen 
FOR EACH ROW EXECUTE PROCEDURE 	versioning('effectiv_timerange', 'BIZ${SCHEMA_ID}.r_s_link_GP_darlehen__geschaeftspartner_darlehen_hist',true);

CREATE TABLE BIZ${SCHEMA_ID}.r_link_GP_darlehen__geschaeftspartner_darlehen(
link_gp_darlehen_hk CHAR(32),
geschaeftspartner_hk CHAR(32),
darlehen_hk CHAR(32)
PRIMARY KEY(link_gp_darlehen_hk));
