-- p196
-- ●演習問題9-① UNIONだけを使うコンペアの改良
-- 「テーブル同氏のコンペア -集合の相等性のチェック[基本編]」（p.181）のUNIONだけを使うクエリを紹介した時、
-- これを利用するにはテーブルの行数を調べる事前準備が必要だと述べました。
-- しかし実は少し強引な修正を加えることで事前準備なしで使用できるように改善できます。
-- どんな修正を加えればよいか考えてみてください。

SELECT
	CASE WHEN
	(COUNT(*) FROM tbl_A) = (COUNT(*) FROM tbl_B)
	THEN '行数が等しい'
	ELSE '行数が異なる' END
FROM
	(SELECT * FROM tbl_A
		UNION
	SELECT * FROM tbl_B)
;