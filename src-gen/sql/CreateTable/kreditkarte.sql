CREATE TABLE BIZSCHEMA_ID.s_kreditkarte(
kartennummer VARCHAR(20 ),
beginndatum DATE,
kartentyp integer,
loeschung integer,
creation_date DATE,
modification_date DATE,

record_source varchar(255),
kreditkarte_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(kreditkarte_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.s_kreditkarte_hist (like BIZSCHEMA_ID.s_kreditkarte including all);
CREATE TRIGGER versioning_trigger_s_kreditkarte BEFORE INSERT OR UPDATE OR DELETE ON BIZSCHEMA_ID.s_kreditkarte FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'BIZSCHEMA_ID.s_kreditkarte_hist', true);
COMMIT;
CREATE TABLE BIZSCHEMA_ID.h_kreditkarte(
kartennummer VARCHAR(20 ),
kreditkarte_hk CHAR(32),
PRIMARY KEY(kreditkarte_hk)
);
COMMIT;

COMMIT;
