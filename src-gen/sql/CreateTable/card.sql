CREATE TABLE MORPORK.s_card(
card_id VARCHAR(10 ),
disp_id VARCHAR(10 ),
card_type VARCHAR(100 ),
year integer,
month integer,
day integer,
fulldate DATE,
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
card_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(card_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_card_hist (like MORPORK.s_card including all);
CREATE TRIGGER versioning_trigger_s_card BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_card FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.card_hist', true);
---
CREATE TABLE MORPORK.h_card(
card_hk CHAR(32),
PRIMARY KEY(card_hk)
);
---
CREATE TABLE MORPORK.s_card_fc(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
card_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(card_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_card_fc_hist (like MORPORK.s_card including all);
CREATE TRIGGER versioning_trigger_s_card_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_card_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.card_fc_hist', true);
---
---
---

