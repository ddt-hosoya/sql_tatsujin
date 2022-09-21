--p24
--●演習問題1-② 合計と再掲を表頭に出力する行列変換

--本文中のPopTbl2をサンプルに束って、行持ちから列持ちへの水平展開の練習をもう少ししておきましょう。

-- [PopTbl2(再掲)]
-- ☆pref_name(件名),☆sex(性別),population(人口)
-- 徳島             ,1          ,60
-- 徳島             ,2          ,40
-- 香川             ,1          ,100
-- 香川             ,2          ,100
-- 愛媛             ,1          ,100
-- 愛媛             ,2          ,50
-- 高知             ,1          ,100
-- 高知             ,2          ,100
-- 福岡             ,1          ,100
-- 福岡             ,2          ,200
-- 佐賀             ,1          ,20
-- 佐賀             ,2          ,80
-- 長崎             ,1          ,125
-- 長崎             ,2          ,125
-- 東京             ,1          ,250
-- 東京             ,2          ,150

--次のように表頭に合計や再掲の列を持つようなクロス表を作ってください。

-- [結果]
-- 性別  全国  徳島  香川  愛媛  高知  四国(再掲)
-- ----------------------------------------------
-- 男    855   60    100   100   100   360
-- 女    845   40    100   50    100   290


SELECT
	 CASE WHEN sex = '1' THEN '男'
	     WHEN sex = '2' THEN '女'
	 ELSE 'その他' END AS '性別'
	,SUM(population) AS '全国'
	,SUM(CASE WHEN pref_name = '徳島' THEN population ELSE 0 END) AS '徳島'
	,SUM(CASE WHEN pref_name = '香川' THEN population ELSE 0 END) AS '香川'
	,SUM(CASE WHEN pref_name = '愛媛' THEN population ELSE 0 END) AS '愛媛'
	,SUM(CASE WHEN pref_name = '高知' THEN population ELSE 0 END) AS '高知'
	,SUM(CASE WHEN pref_name in ('徳島','香川','愛媛','高知') THEN population ELSE 0 END) AS '四国(再掲)'
FROM PopTbl2
GROUP BY '性別'
;