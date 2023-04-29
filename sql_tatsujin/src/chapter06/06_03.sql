-- p136
-- ●演習問題6-③ 関係除算の改良
-- 「関係除算でバスケット解析」（p.127）では、条件を満たす店舗だけを結果として選択しました。
-- しかし、要件によっては、品物をすべて揃えていなかった店舗について、どれくらいの品物が不足していたのかを
-- 一覧表示したいこともあるでしょう。
-- そこで、先の関係除算のクエリを次のように全店舗について結果を一覧表示するように変更してください。
-- my_item_cntは店舗の現存在庫数、diff_cntは、足りなかった商品の数を表します。

-- <結果>
-- shop, my_item_cnt, diff_cnt
-- ----- ------------ --------
-- 仙台, 3          , 0
-- 大阪, 2          , 1
-- 東京, 3          , 0


SELECT
	SI.shop,
	COUNT(SI.item) AS my_item_cnt,
	((SELECT COUNT(item) FROM Items) - COUNT(SI.item)) AS diff_cnt
FROM ShopItems SI INNER JOIN Items I
	ON SI.item = I.item
GROUP BY SI.shop
;