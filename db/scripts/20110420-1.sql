
--------------------------------------------------------
--  DDL for Sequence BILLITEMS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BILLITEMS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10000 CACHE 20 NOORDER  NOCYCLE ;
 

--------------------------------------------------------
--  DDL for Sequence BILLS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BILLS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10000 CACHE 20 NOORDER  NOCYCLE ;
 

--------------------------------------------------------
--  DDL for Sequence INVOICES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "INVOICES_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10000 CACHE 20 NOORDER  NOCYCLE ;
 

--------------------------------------------------------
--  DDL for Table BILLITEMS
--------------------------------------------------------

  CREATE TABLE "BILLITEMS" 
   (	"ID" NUMBER(38,0), 
	"ISBN" VARCHAR2(255 CHAR), 
	"TITLE" VARCHAR2(255 CHAR), 
	"MRP" NUMBER, 
	"CREATED_AT" DATE, 
	"UPDATED_AT" DATE
   ) ;
 

--------------------------------------------------------
--  Constraints for Table BILLITEMS
--------------------------------------------------------

  ALTER TABLE "BILLITEMS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "BILLITEMS" ADD PRIMARY KEY ("ID") ENABLE;
 

--------------------------------------------------------
--  DDL for Table BILLS
--------------------------------------------------------

  CREATE TABLE "BILLS" 
   (	"ID" NUMBER(38,0), 
	"DATE_OF_BILLING" DATE, 
	"AMOUNT" NUMBER, 
	"QUANTITY" NUMBER(38,0), 
	"CREATED_AT" DATE, 
	"UPDATED_AT" DATE
   ) ;
 

--------------------------------------------------------
--  Constraints for Table BILLS
--------------------------------------------------------

  ALTER TABLE "BILLS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "BILLS" ADD PRIMARY KEY ("ID") ENABLE;
 

--------------------------------------------------------
--  DDL for Table INVOICES
--------------------------------------------------------

  CREATE TABLE "INVOICES" 
   (	"ID" NUMBER(38,0), 
	"INVOICE_NO" VARCHAR2(255 CHAR), 
	"DATE_OF_INVOICE" DATE, 
	"ISBN" VARCHAR2(255 CHAR), 
	"TITLE" VARCHAR2(255 CHAR), 
	"PUBLISHER" VARCHAR2(255 CHAR), 
	"AUTHOR" VARCHAR2(255 CHAR), 
	"QUANTITY" NUMBER(38,0), 
	"GROSSAMT" NUMBER, 
	"CURRENCY" VARCHAR2(255 CHAR), 
	"CONV_RATE" NUMBER, 
	"DISCOUNT" NUMBER, 
	"NETAMT" NUMBER, 
	"RECEIVED_CNT" NUMBER(38,0) DEFAULT 0, 
	"SOLD_CNT" NUMBER(38,0) DEFAULT 0, 
	"CREATED_BY" NUMBER(38,0), 
	"UPDATED_BY" NUMBER(38,0), 
	"CREATED_AT" DATE, 
	"UPDATED_AT" DATE, 
	"SUPPLIER_ID" NUMBER(38,0)
   ) ;
 

--------------------------------------------------------
--  Constraints for Table INVOICES
--------------------------------------------------------

  ALTER TABLE "INVOICES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "INVOICES" ADD PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "INVOICES" MODIFY ("INVOICE_NO" NOT NULL ENABLE);
 
  ALTER TABLE "INVOICES" MODIFY ("ISBN" NOT NULL ENABLE);
 
  ALTER TABLE "INVOICES" MODIFY ("TITLE" NOT NULL ENABLE);
 
  ALTER TABLE "INVOICES" MODIFY ("PUBLISHER" NOT NULL ENABLE);
 
  ALTER TABLE "INVOICES" MODIFY ("QUANTITY" NOT NULL ENABLE);
 
  ALTER TABLE "INVOICES" MODIFY ("GROSSAMT" NOT NULL ENABLE);
 


alter table "TITLERECEIPTS" drop column "BOX_NO";

