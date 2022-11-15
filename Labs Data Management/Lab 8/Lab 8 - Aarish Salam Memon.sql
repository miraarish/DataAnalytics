-- drop tables to start fresh
-- DROP TABLE craftShopItems;
-- DROP TABLE craftRegion;
-- DROP TABLE craftStore;

-- PROJECT 1, STEP 1: 
CREATE TABLE craftStore (
    craftStoreID NUMBER NOT NULL,
    craftRegionID NUMBER NOT NULL,
    storeAddress VARCHAR2(30),
    storeCity  VARCHAR2(30),
    storeState VARCHAR2(2),
    storeZipCode VARCHAR2(10),
    CONSTRAINT craftStoreID_pk PRIMARY KEY (craftStoreID)
);

CREATE TABLE craftShopItems (
    craftID NUMBER,
    craftItemName VARCHAR2(100),
    craftVendor VARCHAR2(100) NOT NULL,
    craftStoreID NUMBER,
    CONSTRAINT craftShopItems_pk PRIMARY KEY (craftID),
    CONSTRAINT craftStoreID_fk  FOREIGN KEY (craftStoreID)
    REFERENCES craftStore(craftStoreID)
);

CREATE TABLE craftRegion (
    craftRegionID NUMBER,
    craftRegionDescription VARCHAR2(25),
    CONSTRAINT craftregionid_pk PRIMARY KEY (craftRegionID)
);

-- PROJECT 1, STEP 2: 
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (1, 10003, '6420 N. Western' , 'Chicago' , 'IL', '60645');
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (2, 10003, '3300 Mound Road', 'Warren', 'MI', '43211');
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (3, 10002, '9008 S. Athens', 'Queens', 'NY', '04122');
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (4, 10008, '450 Snowcliff', 'Butte', 'MT', '80092');
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (5, 10008, '123 Aspen Way', 'Denver', 'CO', '76655');
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (6, 10005, '430 Gulf Side Dr', 'Sarasota', 'FL', '94122');
INSERT INTO craftStore (craftStoreID, craftRegionID, storeAddress, storeCity, storeState, storeZipCode)
VALUES (7, 10009, '1007 Sunset Blvd', 'Beverly Hills', 'CA', '90210');


INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (1, 'TinkeringToys', 'Toys Deluxe', 2);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (2, 'Dolls', 'Dollie’s', 2);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (3, 'Building Blocks', 'Crafts for Kids', 3);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (4, 'Paint Sets', 'Artiste', 4);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (5, 'Stamps', 'Crafts for Kids', 6);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (6, 'Yarns', 'Yarn Shop', 6);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (7, 'Modeling Clay', 'Toys Deluxe', 1);
INSERT INTO craftShopItems (craftID, craftItemName, craftVendor, craftStoreID)
VALUES (8, 'Easels', 'Artiste', 4);

INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10001, 'New England');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10002, 'Mid Atlantic');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10003, 'East North Central');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10004, 'West North Central');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10005, 'South Atlantic');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10006 , 'East South Central');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10007, 'West South Central');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10008, 'Mountain');
INSERT INTO craftRegion (craftRegionID, craftRegionDescription)
VALUES (10009, 'Pacific');
commit;

--Query 1--

SELECT * FROM craftshopitems
WHERE craftvendor = 'Crafts for Kids';

--Query 2--

SELECT * FROM craftstore
WHERE storestate != 'CO';

--Query 3--

SELECT * FROM craftregion
WHERE craftregionid IN (10004,10007,10008,10009);

-- PROJECT 2 --

CREATE VIEW vendorView1 AS
SELECT craftShopItems.craftVendor, craftShopItems.craftItemName,
craftStore.storeCity
FROM craftShopItems
INNER JOIN craftStore
ON craftShopItems.craftStoreID = craftStore.craftStoreID
WHERE craftShopItems.craftVendor Like 'Crafts for Kids';

SELECT * FROM vendorView1;


-- VIEW 1 --

CREATE VIEW ViewForDeluxe AS
SELECT a.craftstoreid,a.craftvendor,a.craftitemname,b.storeaddress,b.storecity,b.storestate,b.storezipcode
from craftshopitems a,craftstore b
WHERE a.craftstoreid = b.craftstoreid AND a.craftvendor = 'Toys Deluxe';

--VIEW 2--

CREATE VIEW ViewForDollie AS
SELECT a.craftstoreid,a.craftvendor,a.craftitemname,b.storeaddress,b.storecity,b.storestate,b.storezipcode
from craftshopitems a,craftstore b
WHERE a.craftstoreid = b.craftstoreid AND a.craftvendor = 'Dollie’s';

--VIEW 3--

CREATE VIEW ViewForKids AS
SELECT a.craftstoreid,a.craftvendor,a.craftitemname,b.storeaddress,b.storecity,b.storestate,b.storezipcode
from craftshopitems a,craftstore b
WHERE a.craftstoreid = b.craftstoreid AND a.craftvendor = 'Crafts for Kids';

--VIEW 4--

CREATE VIEW ViewForArtiste AS
SELECT a.craftstoreid,a.craftvendor,a.craftitemname,b.storeaddress,b.storecity,b.storestate,b.storezipcode
from craftshopitems a,craftstore b
WHERE a.craftstoreid = b.craftstoreid AND a.craftvendor = 'Artiste';

--VIEW 5--

CREATE VIEW ViewForYarn AS
SELECT a.craftstoreid,a.craftvendor,a.craftitemname,b.storeaddress,b.storecity,b.storestate,b.storezipcode
from craftshopitems a,craftstore b
WHERE a.craftstoreid = b.craftstoreid AND a.craftvendor = 'Yarn Shop';

-- VIEW FOR REGION NEW ENGLAND -- 

CREATE VIEW RegionNewEngland AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'New England';

-- VIEW FOR REGION MID ATLANTIC -- 

CREATE VIEW RegionMidAtlantic AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'Mid Atlantic';

-- VIEW FOR REGION EAST NORTH CENTRAL -- 

CREATE VIEW RegionEastNorthCentral AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'East North Central';

-- VIEW FOR REGION WEST NORTH CENTRAL -- 

CREATE VIEW RegionWestNorthCentral AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'West North Central';

-- VIEW FOR REGION SOUTH ATLANTIC -- 

CREATE VIEW RegionSouthAtlantic AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'South Atlantic';

-- VIEW FOR REGION EAST SOUTH CENTRAL -- 

CREATE VIEW RegionEastSouthCentral AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'East South Central';

-- VIEW FOR REGION WEST SOUTH CENTRAL -- 

CREATE VIEW RegionWestSouthCentral AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'West South Central';

-- VIEW FOR REGION MOUNTAIN -- 

CREATE VIEW RegionMountain AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'Mountain';

-- VIEW FOR REGION PACIFIC -- 

CREATE VIEW RegionPacific AS
SELECT r.craftregionid, r.craftregiondescription, s.craftstoreid, s.storeaddress, s.storecity, s.storestate, s.storezipcode, i.craftitemname
FROM craftregion r, craftstore s, craftshopitems i
WHERE r.craftregionid = s.craftregionid
AND s.craftstoreid = i.craftstoreid
and r.craftregiondescription = 'Pacific';

--QUERY FROM VIEW 1--

SELECT craftitemname, craftvendor, craftstoreid, storeaddress
FROM viewfordeluxe;

--QUERY FROM VIEW 2--

SELECT craftitemname, craftvendor, craftstoreid, storeaddress
FROM viewforartiste;

--QUERY FROM VIEW 3--

SELECT craftitemname, craftvendor, craftstoreid, storeaddress
FROM viewfordollie;

--QUERY FROM VIEW 4--

SELECT craftitemname, craftvendor, craftstoreid, storeaddress
FROM viewforyarn;

--QUERY FROM VIEW 5--

SELECT craftitemname, craftvendor, craftstoreid, storeaddress
FROM viewforkids;

--QUERY FROM REGION 1--

SELECT * FROM regionnewengland;

--QUERY FROM REGION 2--

SELECT * FROM regionmidatlantic;

--QUERY FROM REGION 3--

SELECT * FROM regioneastnorthcentral;

--QUERY FROM REGION 4--

SELECT * FROM regionwestnorthcentral;

--QUERY FROM REGION 5--

SELECT * FROM regionsouthatlantic;

--QUERY FROM REGION 6--

SELECT * FROM regioneastsouthcentral;

--QUERY FROM REGION 7--

SELECT * FROM regionwestsouthcentral;

--QUERY FROM REGION 8--

SELECT * FROM regionmountain;

--QUERY FROM REGION 9--

SELECT * FROM regionpacific;

-- CREATE A SEQUENCE --

CREATE SEQUENCE CraftShopSequence
MINVALUE 200
MAXVALUE 10000
START WITH 202
INCREMENT BY 4;

-- USING SEQUENCE --

INSERT INTO craftshopitems VALUES (CraftShopSequence.nextval,'Colored Chalk','DustyProjects',5);
INSERT INTO craftshopitems VALUES (CraftShopSequence.nextval,'Craft Wooden Sticks','WoodyThings',7);

SELECT * FROM craftshopitems;

-- DETERMINING CURRENT VALUE --

SELECT CraftShopSequence.currval as CurrentSequence FROM Dual;

-- INDEX 1 --

CREATE UNIQUE INDEX Index1
ON craftshopitems(craftid);

-- INDEX ON TWO COLUMNS  --

CREATE UNIQUE INDEX IndexTwo
ON craftstore (CraftStoreID,CraftRegionID);

-- CREATING SYNONYM 1 --

CREATE SYNONYM Syn1 FOR CraftShopItems;

-- QUERY FOR SYNONYM --

SELECT * FROM Syn1 
WHERE CraftItemName IN ('TinkeringToys','Dolls','Stamps');

-- CREATING TRIGGER --

CREATE TRIGGER trigger1
AFTER INSERT 
ON CraftShopItems 
FOR EACH ROW 
DECLARE 
BEGIN
dbms_output.put_line('Trigger has been created');
END;

CREATE TRIGGER trigger2
AFTER INSERT 
ON CraftStore 
FOR EACH ROW 
DECLARE 
BEGIN
dbms_output.put_line('Trigger has been created again');
END;

--USING THE TRIGGERS--

SET SERVEROUTPUT ON;
INSERT INTO CraftStore values (8,'10004','1800 Snowdays Ave','Minneapolis','MN',55402);

Select * FROM craftstore;
