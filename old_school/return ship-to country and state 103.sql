SELECT
  UNION2."Customer # ",
  UNION2."Customer",
  UNION2."Address",
  UNION2."City",
  UNION2."State",
  UNION2."Country",
  UNION2."Group",
  UNION2."Market",
  UNION2."Territory" 
FROM
  (
    SELECT DISTINCT
      alcanb "Customer # ",
      alcltx "Customer",
      alcmtx "Address",
      alcptx "City",
      albycd "State",
      alcocd "Country",
      Varchar(RIGHT('000000' || bf.bilno, 6)) "Group",
      bf.bfadr6 "Market",
      RIGHT('00' || bf.terrn, 2) "Territory",
      alcucd "address_code" 
    FROM
      mbalrep 
      JOIN
        mbbfrep bf 
        ON bf.comno = alaenb 
        AND bf.cusno = alcanb 
    WHERE
      alaenb = ? 
      AND alcanb = ? 
      AND bf.bilno < 999999 
    UNION
    SELECT DISTINCT
      alcanb "Customer # ",
      alcltx "Customer",
      alcmtx "Address",
      alcptx "City",
      albycd "State",
      alcocd "Country",
      Varchar(bf.bilno) "Group",
      bf.bfadr6 "Market",
      RIGHT('00' || bf.terrn, 2) "Territory",
      alcucd "address_code" 
    FROM
      mbalrep 
      JOIN
        mbbfrep bf 
        ON bf.comno = alaenb 
        AND bf.cusno = alcanb 
    WHERE
      alaenb = ? 
      AND alcanb = ? 
      AND bf.bilno > 999999 
  )
  UNION2 
  JOIN
    mbderep 
    ON UNION2."Customer # " = decanb 
    AND UNION2."address_code" = decucd 
WHERE
  deb9cd <> '00000001'