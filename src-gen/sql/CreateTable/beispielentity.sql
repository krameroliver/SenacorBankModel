CREATE TABLE MORPORK.s_beispielentity(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
beispielentity_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(beispielentity_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_beispielentity_hist (like MORPORK.s_beispielentity including all);
CREATE TRIGGER versioning_trigger_s_beispielentity BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_beispielentity FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.beispielentity_hist', true);
---
CREATE TABLE MORPORK.h_beispielentity(
beispielentity_hk CHAR(32),
PRIMARY KEY(beispielentity_hk)
);
---
CREATE TABLE MORPORK.s_beispielentity_fc(
testfield VARCHAR(100 ),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
beispielentity_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(beispielentity_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_beispielentity_fc_hist (like MORPORK.s_beispielentity including all);
CREATE TRIGGER versioning_trigger_s_beispielentity_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_beispielentity_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.beispielentity_fc_hist', true);
---

CREATE TABLE MORPORK.m_beispielentity_A(
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
beispielentity_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(beispielentity_hk,PROCESSING_POINT)
);
CREATE TABLE MORPORK.m_beispielentity_A_hist (like MORPORK.m_beispielentity_A including all);
CREATE TRIGGER versioning_trigger_m_MORPORK_s_beispielentity_A BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.m_beispielentity_A FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.m_beispielentity_A_hist', true);
---
CREATE TABLE MORPORK.m_beispielentity_A_fc(
a VARCHAR(100 ),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
beispielentity_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(beispielentity_hk,PROCESSING_POINT)
);

CREATE TABLE MORPORK.s_beispielentity_A_fc_hist (like MORPORK.s_beispielentity_A_fc including all);
CREATE TRIGGER versioning_trigger_s_MORPORK_s_beispielentity_A_fc BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.s_beispielentity_A_fc FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.s_beispielentity_A_fc_hist', true);
---
CREATE TABLE MORPORK.r_m_a_beispielentity_beispielentity(

a_hk CHAR(32),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
beispielentity_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(a_hk,PROCESSING_POINT));
	
CREATE TABLE MORPORK.r_m_a_beispielentity_beispielentity_hist (like MORPORK.r_m_a_beispielentity_beispielentity including all);
CREATE TRIGGER versioning_trigger_MORPORK_r_m_a_beispielentity_beispielentity BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.r_m_a_beispielentity_beispielentity FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.r_m_a_beispielentity_beispielentity_hist', true);
CREATE TABLE MORPORK.r_m_b_beispielentity_beispielentity(

b_hk CHAR(32),
creation_date DATE,
modification_date DATE,
processing_point VARCHAR(10),
record_source VARCHAR(255),
record_hk CHAR(32),
beispielentity_hk CHAR(32),
effectiv_timerange tstzrange,
PRIMARY KEY(b_hk,PROCESSING_POINT));
	
CREATE TABLE MORPORK.r_m_b_beispielentity_beispielentity_hist (like MORPORK.r_m_b_beispielentity_beispielentity including all);
CREATE TRIGGER versioning_trigger_MORPORK_r_m_b_beispielentity_beispielentity BEFORE INSERT OR UPDATE OR DELETE ON MORPORK.r_m_b_beispielentity_beispielentity FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'MORPORK.r_m_b_beispielentity_beispielentity_hist', true);

CREATE TABLE MORPORK.r_a_beispielentity_beispielentity(
a_hk CHAR(32),
beispielentity_hk CHAR(32),
beispielentity_hk CHAR(32)
PRIMARY KEY(a_hk));
CREATE TABLE MORPORK.r_b_beispielentity_beispielentity(
b_hk CHAR(32),
beispielentity_hk CHAR(32),
beispielentity_hk CHAR(32)
PRIMARY KEY(b_hk));
