--------------------------------------------------------
--  DDL for Sequence ISBNS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ISBNS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10000 CACHE 20 NOORDER  NOCYCLE ;
 
alter table "BILLITEMS" drop column "MRP";
alter table "BILLITEMS" drop column "INVOICE_ID";
alter table "BILLITEMS" drop column "TITLE";
alter table "BILLITEMS" add ( "NETAMT" NUMBER );
alter table "BILLITEMS" add ( "CONV_RATE" NUMBER );
alter table "BILLITEMS" add ( "DISCOUNT" NUMBER );

alter table "BILLS" drop column "AMOUNT";
alter table "BILLS" add ( "NETAMT" NUMBER );
alter table "BILLS" add ( "GROSSAMT" NUMBER );
alter table "BILLS" add ( "DISCOUNT" NUMBER );
alter table "BILLS" add ( "BOOKFAIR_ID" NUMBER (38,0) );

alter table "INVOICES" drop column "SOLD_CNT";

--------------------------------------------------------
--  DDL for Table ISBNS
--------------------------------------------------------

  CREATE TABLE "ISBNS" 
   (	"ID" NUMBER(38,0), 
	"ISBN" VARCHAR2(255 CHAR), 
	"TITLE" VARCHAR2(255 CHAR), 
	"AUTHOR" VARCHAR2(255 CHAR), 
	"PUBLISHER" VARCHAR2(255 CHAR), 
	"GROSSAMT" NUMBER, 
	"CURRENCY" VARCHAR2(255 CHAR), 
	"CREATED_AT" DATE, 
	"UPDATED_AT" DATE
   ) ;

--------------------------------------------------------
--  Constraints for Table ISBNS
--------------------------------------------------------

  ALTER TABLE "ISBNS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "ISBNS" ADD PRIMARY KEY ("ID") ENABLE;
 
--------------------------------------------------------
--  DDL for Procedure POPULATE_TITLES_OF_INVOICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "POPULATE_TITLES_OF_INVOICE" 
(
  P_INVOICE_NO IN VARCHAR2,
  P_BOOKFAIR_ID IN INTEGER
) AS 
  V_TITLE TITLES%ROWTYPE;
  V_TITLE_ID INTEGER;
  V_TITLE_CNT INTEGER;
BEGIN
  FOR REC IN (
    SELECT A.ISBN, TITLE, PUBLISHER, AUTHOR,
      GROSSAMT, CURRENCY, CONV_RATE, NETAMT, DISCOUNT
    FROM TITLERECEIPTS A, INVOICES B
    WHERE 
    A.INVOICE_NO = B.INVOICE_NO
    AND A.ISBN = B.ISBN
    AND A.INVOICE_NO = P_INVOICE_NO
  )
  LOOP
    SELECT COUNT(ID) INTO V_TITLE_CNT FROM TITLES 
      WHERE BOOKFAIR_ID = P_BOOKFAIR_ID
      AND ISBN = REC.ISBN;
    IF V_TITLE_CNT > 0 THEN
      UPDATE TITLES SET COPIES_CNT = NVL(COPIES_CNT,0) + 1 
        WHERE BOOKFAIR_ID = P_BOOKFAIR_ID
        AND ISBN = REC.ISBN;
    ELSE
      SELECT TITLES_SEQ.NEXTVAL INTO V_TITLE_ID
        FROM DUAL;
      
      V_TITLE := NULL;
      V_TITLE.ID := V_TITLE_ID;
      V_TITLE.ISBN := REC.ISBN;
      V_TITLE.TITLE := REC.TITLE;
      V_TITLE.PUBLISHER := REC.PUBLISHER;
      V_TITLE.AUTHOR := REC.AUTHOR;
      V_TITLE.GROSSAMT := REC.GROSSAMT;
      V_TITLE.CURRENCY := REC.CURRENCY;
      V_TITLE.CONV_RATE := REC.CONV_RATE;
      V_TITLE.DISCOUNT := REC.DISCOUNT;
      V_TITLE.NETAMT := REC.NETAMT;
      V_TITLE.BOOKFAIR_ID := P_BOOKFAIR_ID;
      V_TITLE.COPIES_CNT := 1;
      V_TITLE.SOLD_CNT := 0;
      V_TITLE.CREATED_BY := NULL;
      V_TITLE.MODIFIED_BY := NULL;
      V_TITLE.CREATED_AT := SYSDATE;
      V_TITLE.UPDATED_AT := SYSDATE;
      
      INSERT INTO TITLES
      VALUES V_TITLE;
    END IF;
  END LOOP;
END POPULATE_TITLES_OF_INVOICE;
/
 
--------------------------------------------------------
--  DDL for Procedure UPDATE_SOLD_ITEMS_IN_TITLES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "UPDATE_SOLD_ITEMS_IN_TITLES" 
(
  P_STARTDATE IN DATE  
, P_ENDDATE IN DATE  
) AS 
BEGIN
  FOR REC IN (
    SELECT * FROM BILLITEMS
      WHERE TRUNC(CREATED_AT) BETWEEN
      TRUNC(P_STARTDATE) AND TRUNC(P_ENDDATE)
  )
  LOOP
    UPDATE TITLES SET SOLD_CNT = NVL(SOLD_CNT,0) +1
      WHERE ISBN = REC.ISBN;
  END LOOP;
END UPDATE_SOLD_ITEMS_IN_TITLES;
/
