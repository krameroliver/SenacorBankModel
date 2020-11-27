CREATE TABLE BIZ${SCHEMA_ID}.s_darlehen(
kontonummer VARCHAR(18 ),
nominal NUMERIC(20 ,10),
startdatum DATE,
enddatum DATE,
status integer,
tilgung NUMERIC(20 ,10),
verwendungszweck integer,
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
darlehen_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(darlehen_hk,effectiv_timerange)
);

CREATE TABLE BIZ${SCHEMA_ID}.s_darlehen_hist (like BIZ${SCHEMA_ID}.s_darlehen including all);
CREATE TRIGGER versioning_trigger_s_darlehen BEFORE INSERT OR UPDATE OR DELETE ON BIZ${SCHEMA_ID}.s_darlehen FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZ${SCHEMA_ID}.darlehen_hist', true);
---
CREATE TABLE BIZ${SCHEMA_ID}.h_darlehen(
darlehen_hk CHAR(32),
PRIMARY KEY(darlehen_hk)
);
---
---

