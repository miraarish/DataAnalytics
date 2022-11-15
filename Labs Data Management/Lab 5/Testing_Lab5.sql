CREATE TABLE tblNewData
		(
	 	  dataID NUMBER(10, 0) NOT NULL,
		  month VARCHAR2(50) NOT NULL,
		  xValue Number(5),
	 	  yValue Number(5),
		  CONSTRAINT tblNewData_pk PRIMARY KEY(dataID)
		);

        INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (10, 'January', 5, 7);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (20, 'February', 9, 11);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (30, 'March', 12, 17);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (40, 'April', 11, 16);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (50, 'May', 13, 21);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (60, 'June', 21, 14);

COMMIT;

SELECT * FROM tblnewdata;

-- SCRIPT 1 --

set serveroutput on;
		set verify off;
		DECLARE
		 v_count    Number := 0;
		 v_name     VARCHAR(50) := 'Aarish';	
		BEGIN
		--record count
		SELECT COUNT(*)
		INTO v_count
        FROM tblNewData;  	
        dbms_output.put_line('database report by : ' || v_name);
        dbms_output.put_line('record count: ' || v_count);
		END;	


-- SCRIPT 2 --

set serveroutput on;
		DECLARE
		 v_count   Number := 0;
		 v_num Number := 0;
		 v_xVal  tblNewData.xValue%type;
		BEGIN
		--record count
		  SELECT COUNT(*)
		  INTO v_count
		  FROM tblNewData;

		--record test
		   For i IN 1 .. v_count LOOP
		    SELECT xValue
		    INTO v_xVal 
		    FROM tblNewData
		    where dataID = i * 10;
		    if v_xVal > 11 then
		     v_num  := v_num + 1;
		   end if;
		   end LOOP;
		  --output
    		  dbms_output.put_line('# of matching records ' || v_num);	
              dbms_output.put_line('report by : ' || 'Aarish');
		END;

-- SCRIPT 3 --

set serveroutput on;
		DECLARE
		 v_count Number := 0;
		 v_num Number := 0;
		 v_xVal tblNewData.xValue%type;
		 v_avgX Number := 0;
		 v_avgY Number := 0;

		BEGIN
		--average xValue
		  SELECT avg(xValue)
		  INTO v_avgX
		  FROM tblNewData;
          

		--average yValue
		  SELECT avg(yValue)
		  INTO v_avgY
		  FROM tblNewData;

		  --output
    		dbms_output.put_line('average of xValue field ' || ROUND (v_avgX,2));
		dbms_output.put_line('average of yValue field ' || ROUND (v_avgY,2));
		END;

-- SCRIPT 4 --

set serveroutput on;
		DECLARE
		 v_count Number := 0;
		 v_num Number := 0;
		 v_xVal tblNewData.xValue%type;
		 v_avgX Number := 0;
		 v_avgY Number := 0;

		BEGIN
		--average xValue
		  SELECT avg(xValue)
		  INTO v_avgX
		  FROM tblNewData;
          

		--average yValue
		  SELECT avg(yValue)
		  INTO v_avgY
		  FROM tblNewData;

		  --output
            IF (v_avgX > v_avgY) 
            THEN dbms_output.put_line('This value of X is the biggest ' || ROUND (v_avgX,2));
            ELSE 
            dbms_output.put_line('This value of Y is the biggest ' || ROUND (v_avgY,2));
            END IF;
        END;
        
--- SCRIPT 5 --

set serveroutput on;
		DECLARE
		 y_count Number := 0;
		 v_avgY Number := 0;
         v_yVal NUMBER := 0;

		BEGIN
		  SELECT ROUND(avg(yValue),2)
		  INTO v_avgY
		  FROM tblNewData;
          dbms_output.put_line ('Average of Y is' ||v_avgy);
          
          SELECT COUNT(*) INTO y_count
          FROM tblnewdata;
          dbms_output.put_line ('Values that are Greater Average ' ||v_avgy || ' Are below');
          dbms_output.put_line ('| ID | YVALUE');
          
          -- NOW LOOP --
          
          for i IN 1 ..y_count loop
          SELECT yvalue into v_YVal
          FROM tblnewdata
          WHERE DATAID = i*10;
          
          IF (v_Yval > v_avgY) THEN
          dbms_output.put_line ('|  ' || i*10||'   |   '||v_yval||'   |');
          END IF;
          END loop;
          END;

-- SCRIPT 6 --

set serveroutput on;
    DECLARE
		 v_count NUMBER := 0;
		 SumX NUMBER := 0;
         v_xVal tblNewData.xValue%type;
         v_wgtAvgX NUMBER := 0;
         v_xValnew NUMBER := 0;
         SUM_i NUMBER := 0;

    BEGIN
     
     SELECT COUNT(*) 
     INTO v_count
     FROM tblnewdata;
     
     FOR i in 1 ..v_count loop
     SELECT xValue
     INTO v_xVal
     FROM tblnewdata
     WHERE DATAID = i * 10;
     
     SELECT SUM (i * v_xVal)
     INTO v_xValnew
     FROM tblnewdata
     WHERE DATAID = i*10;
     
     SumX :=  SumX +  v_xValnew;
     SUM_i :=  SUM_i + 1;
    
    END LOOP;
    
    dbms_output.put_line ('Sum of Weights * X Value Is ' || SumX);
    dbms_output.put_line ('Sum of Weights Is ' || SUM_i);
    
    v_wgtAvgX :=  SumX/SUM_i;
    
    dbms_output.put_line ('Weighted Average of X Value Is ' || ROUND(v_wgtAvgX,2));
    
  END;
  
-- SCRIPT 7 --
  
  INSERT INTO tblnewdata (dataID, month, xValue, yValue)
  VALUES (70, 'JULY' , 19, 18);
    INSERT INTO tblnewdata (dataID, month, xValue, yValue)
  VALUES (80, 'AUGUST' , 26, 29);
    INSERT INTO tblnewdata (dataID, month, xValue, yValue)
  VALUES (90, 'SEPTEMBER' , 31, 28);
    INSERT INTO tblnewdata (dataID, month, xValue, yValue)
  VALUES (100, 'OCTOBER' , 27, 33);
    INSERT INTO tblnewdata (dataID, month, xValue, yValue)
  VALUES (110, 'NOVEMBER' , 37, 25);
    INSERT INTO tblnewdata (dataID, month, xValue, yValue)
  VALUES (120, 'DECEMBER' ,39, 23);
  
  COMMIT;
  
  SELECT * FROM tblnewdata;
  
  -- SCRIPT 8 --
  
  CREATE TABLE tblOldData
		(
	 	  dataID NUMBER(10, 0) NOT NULL,
		  month VARCHAR2(50) NOT NULL,
		  xValue Number(5),
	 	  yValue Number(5),
		  CONSTRAINT tblOldData_pk PRIMARY KEY(dataID)
		);

INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (10, 'JANUARY' ,6, 12);  
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (20, 'FEBRUARY' ,7, 10);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (30, 'MARCH' ,9, 12);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (40, 'APRIL' ,9, 11);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (50, 'MAY' ,10, 15);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (60, 'JUNE' ,12, 19);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (70, 'JULY' ,16, 22);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (80, 'AUGUST' ,10, 18);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (90, 'SEPTEMBER' ,10, 30);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (100, 'OCTOBER' ,11, 18);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (110, 'NOVEMBER' ,14, 14);
  INSERT INTO tblolddata (dataID, month, xValue, yValue)
  VALUES (120, 'DECEMBER' ,16, 20);
  
  SELECT * FROM tblolddata;
  

-- SCRIPT 9 --
SET serveroutput on;
DECLARE
  
  v_xValOld tblolddata.XValue%type;
  v_xValNew tblnewdata.XValue%type;
  v_yValOld tblolddata.YValue%type;
  v_yValNew tblnewdata.YValue%type;
  v_count NUMBER := 0;
  
BEGIN
  
  SELECT COUNT(*) 
     INTO v_count
     FROM tblnewdata;
  
  FOR i in 1 ..v_count loop
  v_count := v_count + 1;
 
  SELECT xValue
  INTO v_xValOld
  FROM tblolddata
  WHERE DataID=i*10;
  
  SELECT xValue
  INTO v_xValNew
  FROM tblnewdata
  WHERE DataID=i*10;
  
  SELECT yValue
  INTO v_yValOld
  FROM tblolddata
  WHERE DataID=i*10;
  
  SELECT yValue
  INTO v_yValNew
  FROM tblnewdata
  WHERE DataID=i*10;
     
  IF v_xValOld >= v_xValNew THEN
			  dbms_output.put_line ('old table x exceeds or equals new table x');
			ELSE
			  dbms_output.put_line ('old table x falls below new table x');
			END IF;
            
  IF v_yValOld >= v_yValNew THEN
			  dbms_output.put_line ('old table Y exceeds or equals new table Y');
			ELSE
			  dbms_output.put_line ('old table Y falls below new table Y');
			END IF;  
END LOOP;
END;


-- SCRIPT 10 --
SET Serveroutput ON;
 DECLARE

      v_me varchar2(25):= 'Aarish Memon';   
      x_Valsqrtold    Number := 0;
      y_Valsqrtold    Number := 0;
      x_sqrtsumold Number := 0;
      y_sqrtsumold Number :=0;
      x_valsqrtnew    Number := 0;
      y_valsqrtnew    Number := 0;
      x_sqrtsumnew Number := 0;
      y_sqrtsumnew Number :=0;
      x_count    Number := 0;
      y_count    Number := 0;
      v_xVal Number := 0;
      v_yVal Number := 0;
      old_xVal Number := 0;
      old_yVal Number := 0;
 
BEGIN
      SELECT COUNT(xValue)
      INTO x_count 
      FROM tblOldData;

        For i IN 1 .. x_count LOOP
       
		    SELECT xValue
		    INTO v_xVal 
		    FROM tblOldData
		    where dataID = i * 10;

		    SELECT yValue
		    INTO v_yVal 
		    FROM tblOldData
		    where dataID = i * 10;

	x_valsqrtold:= POWER(v_xVal, 2);
        x_sqrtsumold:= x_valsqrtold + x_sqrtsumold;
        
        y_valsqrtold:= POWER(v_yVal, 2);
        y_sqrtsumold:= y_valsqrtold + y_sqrtsumold;
                           
 END LOOP;
        
       For i IN 1 .. x_count LOOP
       
		    SELECT xValue
		    INTO v_xVal 
		    FROM tblNewData
		    where dataID = i * 10;
            
            SELECT yValue
		    INTO v_yVal 
		    FROM tblNewData
		    where dataID = i * 10;

	x_valsqrtnew:= POWER(v_xVal, 2);
        x_sqrtsumnew:= x_valsqrtnew + x_sqrtsumnew;
        
        y_valsqrtnew:= POWER(v_yVal, 2);
        y_sqrtsumnew:= y_valsqrtnew + y_sqrtsumnew;
        
	END LOOP;
       
         dbms_output.put_line ('Squared values of X and Y of New Tables are:');       
         dbms_output.put_line ('Sum of squares of X values of New Table is ' || x_sqrtsumold);
         dbms_output.put_line ('Sum of sqaures of Y values of New Table is ' || y_sqrtsumold);
         
         DBMS_OUTPUT.NEW_LINE;
         
          dbms_output.put_line ('Squared values of X and Y of Old Tables are:');       
          dbms_output.put_line ('Sum of squares of X values of Old Table is ' || x_sqrtsumnew);
          dbms_output.put_line ('Sum of sqaures of Y values of Old Table is ' || y_sqrtsumnew);
          
          DBMS_OUTPUT.NEW_LINE;
         
          dbms_output.put_line ('Analysis performed by ' || v_me);    
END;

