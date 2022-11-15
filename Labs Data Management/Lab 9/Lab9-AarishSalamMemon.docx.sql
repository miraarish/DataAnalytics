DROP TABLE countries; -- perform only when necessary
CREATE TABLE countries
(COUNTRY_ID CHAR(2) NOT NULL,
COUNTRY_NAME VARCHAR2(40),
REGION_ID NUMBER);

INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('CA','Canada', 2);
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('DE','Germany', 1);
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('UK','United Kingdom', 1);
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('US','United States of America', 2);
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('IN','India', 3);

Commit; 
SELECT * FROM countries;


INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('GR', 'Greece',1);
Commit;


SAVEPOINT am_countries_1;

INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('MX', 'Mexico',2); 
SELECT * FROM countries;
ROLLBACK to fl_countries_1;
SELECT * FROM countries;
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('MX', 'Mexico', 2); 
Commit;
		
        
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('SP', 'Spain', 1);
SAVEPOINT am_countries_2;
SELECT * FROM countries;

INSERT INTO countries(COUNTRY_ID,COUNTRY_NAME,REGION_ID)
VALUES ('NT', 'Netherlands',1); 

Rollback to am_countries_2;
SELECT * FROM countries;

Rollback to am_countries_1;
SELECT * FROM countries;

GRANT SELECT 
On dept
TO sam, lynnette;

GRANT INSERT 
On dept
TO scott;

CREATE ROLE Order_Entry IDENTIFIED BY xyz123;

REVOKE SELECT, INSERT
ON dept
FROM scott;


CREATE ROLE DirectorIT;