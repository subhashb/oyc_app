alter table "BILLITEMS" add ( "BILL_ID" NUMBER (38,0) );
alter table "BILLITEMS" add ( "INVOICE_ID" NUMBER (38,0) );

alter table "BILLS" add ( "CREATED_BY" NUMBER (38,0) );
alter table "BILLS" add ( "UPDATED_BY" NUMBER (38,0) );

alter table "TITLERECEIPTS" add ( "BOX_NO" NUMBER (38,0) );
alter table "TITLERECEIPTS" add ( "INVOICE_ID" NUMBER (38,0) );