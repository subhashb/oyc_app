alter table "BILLITEMS" add ( "TITLE_ID" NUMBER (38,0) );

alter table "TITLERECEIPTS" add ( "SUPPLIER_ID" NUMBER (38,0) );

alter table "TITLES" drop column "AUTHOR";
alter table "TITLES" drop column "NETAMT";
alter table "TITLES" drop column "PUBLISHER";
alter table "TITLES" drop column "CURRENCY";
alter table "TITLES" drop column "GROSSAMT";
alter table "TITLES" drop column "CONV_RATE";
alter table "TITLES" drop column "DISCOUNT";
alter table "TITLES" drop column "TITLE";
alter table "TITLES" add ( "INVOICE_ID" NUMBER (38,0) );

--------------------------------------------------------
--  DDL for Index TITLES_FAIRITEM_UNQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "TITLES_FAIRITEM_UNQ" ON "TITLES" ("BOOKFAIR_ID", "ISBN", "INVOICE_ID") 
  ;
