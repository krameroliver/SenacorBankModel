CREATE TABLE SRC${SCHEMA_ID}.s_client(
client_id VARCHAR(10 ),
sex VARCHAR(6 ),
fulldate DATE,
day integer,
month integer,
year integer,
age integer,
social VARCHAR(15 ),
first VARCHAR(255 ),
middle VARCHAR(255 ),
last VARCHAR(255 ),
phone VARCHAR(100 ),
email VARCHAR(100 ),
address_1 VARCHAR(100 ),
address_2 VARCHAR(100 ),
city VARCHAR(100 ),
state VARCHAR(100 ),
zipcode VARCHAR(100 ),
district_id integer,
creation_date DATE,
modification_date DATE,
record_source VARCHAR(255),
client_hk CHAR(32),
effectiv_timerange daterange,
PRIMARY KEY(client_hk,effectiv_timerange)
);

CREATE TABLE SRC${SCHEMA_ID}.s_client_hist (like SRC${SCHEMA_ID}.s_client including all);
CREATE TRIGGER versioning_trigger_s_client BEFORE INSERT OR UPDATE OR DELETE ON SRC${SCHEMA_ID}.s_client FOR EACH ROW EXECUTE PROCEDURE versioning('effectiv_timerange', 'SRC${SCHEMA_ID}.client_hist', true);
---
CREATE TABLE SRC${SCHEMA_ID}.h_client(
client_id VARCHAR(10 ),
client_hk CHAR(32),
PRIMARY KEY(client_hk)
);
---
---

