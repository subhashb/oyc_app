alter table "BILLITEMS" add ( "GROSSAMT" NUMBER );
alter table "BILLS" drop column "DISCOUNT";
alter table "BILLS" modify ( "BOOKFAIR_ID" NUMBER (38,0)  NOT NULL );
