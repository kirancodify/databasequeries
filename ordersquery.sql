SELECT ORDERS.ORDER_NUM,
  ORDERS.ORDER_DT,
  ORDERS.CURCY_CD,
  ORDERS.STATUS_CD,
  ITEM.QTY_REQ,
  ITEM.PAR_ORDER_ITEM_ID,
  PROD.NAME,
  ITEM.PREV_ITEM_REV_ID,
  ITEM.PROD_ID,
  ITEM.BASE_ITEM_ID,
  ITEM.ADJ_UNIT_PRI,
  ITEM.BASE_UNIT_PRI,
  ITEM.EXTND_PRICE,
  ITEM.NET_PRI,
  ITEM.DISPLAY_NAME AS item_displayName,
  ITEM.ORDER_ITM_CURCY_CD,
  ITEM.STATUS_CD AS item_status,
  ITEMATT.ATTR_NAME,
  ITEMATT.CHAR_VAL,
  ITEMATT.DISPLAY_NAME,
  dat.eff_start_dt,
  dat.eff_end_dt,
  CONTACT.PER_TITLE,
  CONTACT.FST_NAME,
  CONTACT.LAST_NAME,
  PROD.DESC_TEXT
FROM S_ORDER ORDERS,
  S_ORDER_ITEM ITEM,
  S_ORDER_ITEM_XA ITEMATT,
  s_prod_int prod,
  S_ORDER_ITM_PRI dat,
  S_CONTACT CONTACT
WHERE ITEM.ROW_ID= ITEMATT.ORDER_ITEM_ID(+)
AND ITEM.ROW_ID IN (
  (SELECT BASE_ITEM_ID
  FROM s_order ORDERS,
    s_order_item ITEM--,S_ORDER_ITEM_XA ITEMATT
  WHERE ORDERS.ROW_ID IN
    (SELECT MAX(row_id)
    FROM s_order
    WHERE ACCNT_ID IN
      (SELECT ACCOUNT1.ROW_ID
      FROM S_ORG_EXT ACCOUNT1,
        S_CONTACT CONTACT
      WHERE CONTACT.PAR_ROW_ID=ACCOUNT1.PR_CON_ID
      AND CONTACT.EMAIL_ADDR  =:email1
      AND account1.row_id     ='1-1QGP'
      )
    )
  AND ITEM.ORDER_ID IN
    (SELECT MAX(row_id)
    FROM s_order
    WHERE ACCNT_ID IN
      (SELECT ACCOUNT1.ROW_ID
      FROM S_ORG_EXT ACCOUNT1,
        S_CONTACT CONTACT
      WHERE CONTACT.PAR_ROW_ID=ACCOUNT1.PR_CON_ID
      AND CONTACT.EMAIL_ADDR  =:email1
      AND account1.row_id     ='1-1QGP'
      )
    )
  ))---('1-POEA','1-POEC','1-POEF','1-POEH')
AND ORDERS.ROW_ID IN
  (SELECT MAX(row_id)
  FROM s_order
  WHERE ACCNT_ID IN
    (SELECT ACCOUNT1.ROW_ID
    FROM S_ORG_EXT ACCOUNT1,
      S_CONTACT CONTACT
    WHERE CONTACT.PAR_ROW_ID=ACCOUNT1.PR_CON_ID
    AND CONTACT.EMAIL_ADDR  =:email1
    AND account1.row_id     ='1-1QGP'
    )
  )
AND ITEM.PROD_ID            = prod.row_id
AND item.row_id             = dat.row_id
AND ORDERS.CONTACT_ID       =CONTACT.ROW_ID
AND ITEM.PAR_ORDER_ITEM_ID IS NULL
AND PROD.BILLING_TYPE_CD    ='Service Bundle'
AND orders.status_cd       IN ('New','Open')