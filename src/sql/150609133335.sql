SELECT ti.*,
       tj.zhongliangTotal AS aa,
       CASE
           WHEN ti.baoyou_flg='1' THEN 0
           ELSE ti.price + ceil((tj.zhongliangTotal-1))*ti.price_plus
       END AS price_allqqq
FROM
  ( SELECT ta.item_id,
           ta.item_guige,
           ta.item_yanse,
           ta.shuliang,
           ta.zhongliang,
           ta.shuliang*ta.zhongliang AS zhongliangTotal,
           ta.owner_id,
           ta.baoyou_flg,
           ta.from_area,
           t11.region_name AS from_name,
           ta.to_area,
           t12.region_name AS to_name,
           tb.price,
           tb.price_plus,
           CASE
               WHEN ta.baoyou_flg='1' THEN 0
               ELSE tb.price + ceil((ta.shuliang*ta.zhongliang-1))*tb.price_plus
           END AS price_all
   FROM
     ( SELECT t1.item_id,
              t1.item_guige,
              t1.item_yanse,
              t1.shuliang,
              t2.`owner` AS owner_id,
              t2.baoyou_flg,
              t2.from_area,
              5 AS to_area,
              t3.zhongliang
      FROM t_cart t1
      INNER JOIN t_item t2 ON t1.item_id =t2.item_id
      INNER JOIN t_item_detail t3 ON t1.item_id =t3.item_id
      AND t1.item_guige=t3.item_guige
      AND t1.item_yanse=t3.item_yanse
      WHERE t1.open_id='o2otnwBhGfsMWTKeOyB5uA9zf9xA' ) ta
   LEFT OUTER JOIN t_wuliu tb ON ta.from_area = tb.from_area
   AND ta.to_area = tb.to_area
   LEFT OUTER JOIN t_region t11 ON ta.from_area = t11.region_id
   LEFT OUTER JOIN t_region t12 ON ta.to_area = t12.region_id ) ti
LEFT OUTER JOIN
  ( SELECT tt.owner_id,
           tt.from_area,
           tt.from_name,
           SUM(tt.zhongliangTotal) AS zhongliangTotal
   FROM
     ( SELECT ta.item_id, ta.item_guige, ta.item_yanse, ta.shuliang, ta.zhongliang, ta.shuliang*ta.zhongliang AS zhongliangTotal, ta.owner_id, ta.baoyou_flg, ta.from_area, t11.region_name AS from_name, ta.to_area, t12.region_name AS to_name, tb.price, tb.price_plus, CASE WHEN ta.baoyou_flg='1' THEN 0 ELSE tb.price + ceil((ta.shuliang*ta.zhongliang-1))*tb.price_plus END AS price_all
      FROM
        ( SELECT t1.item_id,
                 t1.item_guige,
                 t1.item_yanse,
                 t1.shuliang,
                 t2.`owner` AS owner_id,
                 t2.baoyou_flg,
                 t2.from_area,
                 5 AS to_area,
                 t3.zhongliang
         FROM t_cart t1
         INNER JOIN t_item t2 ON t1.item_id =t2.item_id
         INNER JOIN t_item_detail t3 ON t1.item_id =t3.item_id
         AND t1.item_guige=t3.item_guige
         AND t1.item_yanse=t3.item_yanse
         WHERE t1.open_id='o2otnwBhGfsMWTKeOyB5uA9zf9xA' ) ta
      LEFT OUTER JOIN t_wuliu tb ON ta.from_area = tb.from_area
      AND ta.to_area = tb.to_area
      LEFT OUTER JOIN t_region t11 ON ta.from_area = t11.region_id
      LEFT OUTER JOIN t_region t12 ON ta.to_area = t12.region_id ) tt
   WHERE tt.baoyou_flg!='1'
   GROUP BY tt.owner_id,
            tt.from_area ) tj ON ti.owner_id = tj.owner_id
AND ti.from_area =tj.from_area