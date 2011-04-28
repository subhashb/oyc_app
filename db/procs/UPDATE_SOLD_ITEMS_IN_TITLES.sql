create or replace
PROCEDURE UPDATE_SOLD_ITEMS_IN_TITLES 
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