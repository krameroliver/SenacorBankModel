CREATE TABLE BIZSCHEMA_ID.s_dsgvo(
loeschdatum DATE,
tage_bis_loeschung DATE,
creation_date DATE,
modification_date DATE,

record_hk CHAR(32),
dsgvo_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(dsgvo_hk)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_dsgvo_hist (like BIZSCHEMA_ID.s_dsgvo including all);
CREATE TRIGGER versioning_trigger_s_dsgvo BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_dsgvo FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_dsgvo_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.h_dsgvo(
dsgvo_hk CHAR(32),
PRIMARY KEY(dsgvo_hk)
);
COMMIT;

COMMIT;
