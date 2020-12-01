CREATE TABLE BIZSCHEMA_ID.s_darlehen(
kontonummer VARCHAR(18 ),
nominal NUMERIC(20 ,10),
startdatum DATE,
enddatum DATE,
status integer,
tilgung NUMERIC(20 ,10),
verwendungszweck integer,
futurecashflow integer,
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
darlehen_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(darlehen_hk)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_darlehen_hist (like BIZSCHEMA_ID.s_darlehen including all);
CREATE TRIGGER versioning_trigger_s_darlehen BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_darlehen FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_darlehen_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.h_darlehen(
darlehen_hk CHAR(32),
PRIMARY KEY(darlehen_hk)
);
COMMIT;

COMMIT;
