CREATE TABLE BIZ.s_darlehen(
kontonummer VARCHAR(18 ),
nominal NUMERIC(20 ,10),
startdatum DATE,
enddatum DATE,
status integer,
tilgung NUMERIC(20 ,10),
verwendungszweck integer,
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
darlehen_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(darlehen_hk,PROCESSING_POINT)
);

CREATE TABLE BIZ.s_darlehen_hist (like BIZ.s_darlehen including all);
CREATE TRIGGER versioning_trigger_s_darlehen BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_darlehen FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.darlehen_hist', true);
---
CREATE TABLE BIZ.h_darlehen(
darlehen_hk CHAR(32),
PRIMARY KEY(darlehen_hk)
);
---
CREATE TABLE BIZ.s_darlehen_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
darlehen_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(darlehen_hk,PROCESSING_POINT)
);

CREATE TABLE BIZ.s_darlehen_fc_hist (like BIZ.s_darlehen including all);
CREATE TRIGGER versioning_trigger_s_darlehen_fc BEFORE INSERT OR UPDATE OR DELETE ON BIZ.s_darlehen_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ.darlehen_fc_hist', true);
---
---
---

