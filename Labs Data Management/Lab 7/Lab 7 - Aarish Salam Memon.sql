SELECT pl1.pl_ID, pl1.pl_name, pl2.picture, pl3.essay
FROM planets pl1, planets2 pl2, planets3 pl3
WHERE pl1.pl_ID = pl2.pl_ID and pl1.pl_ID = pl3.pl_ID;


SELECT pl1.pl_ID, pl1.pl_name, pl2.picture, pl4.music
FROM planets pl1, planets2 pl2, planets4 pl4
WHERE pl1.pl_ID = pl2.pl_ID and pl1.pl_ID = pl4.pl_ID;


INSERT INTO PLANETS VALUES (11, 'Sun' , 865370, 'Star', 98989 , 0 , 39 , 'No');
COMMIT;

INSERT INTO PLANETS VALUES (12, 'Ceres' , 45450, 'Aesteroid', 5459 , 9462 , 19 , 'Yes');
COMMIT;


INSERT INTO PLANETS2 VALUES (11, EMPTY_BLOB());
INSERT INTO PLANETS2 VALUES (12, EMPTY_BLOB());
commit;


INSERT INTO PLANETS3 VALUES (11, EMPTY_CLOB());
INSERT INTO PLANETS3 VALUES (12, EMPTY_CLOB());
commit;

SELECT * from planets NATURAL JOIN planets2 NATURAL JOIN planets3;

INSERT INTO PLANETS4 VALUES (11, EMPTY_BLOB());
INSERT INTO PLANETS4 VALUES (12, EMPTY_BLOB());
commit;

SELECT * from planets NATURAL JOIN planets2 NATURAL JOIN planets3 NATURAL JOIN planets4;