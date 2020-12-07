CREATE TABLE SRCSCHEMA_ID.s_card(
card_id VARCHAR(10 ),
disp_id VARCHAR(10 ),
card_type VARCHAR(100 ),
year integer,
month integer,
day integer,
fulldate DATE,
creation_date DATE,
modification_date DATE,

record_source varchar(255),
card_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(card_hk,effectiv_timerange)
);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.s_card_hist (like SRCSCHEMA_ID.s_card including all);
CREATE TRIGGER versioning_trigger_s_card BEFORE INSERT OR UPDATE OR DELETE ON SRCSCHEMA_ID.s_card FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRCSCHEMA_ID.s_card_hist', true);
COMMIT;
CREATE TABLE SRCSCHEMA_ID.h_card(
card_id VARCHAR(10 ),
disp_id VARCHAR(10 ),
card_hk CHAR(32),
PRIMARY KEY(card_hk)
);
COMMIT;

COMMIT;
