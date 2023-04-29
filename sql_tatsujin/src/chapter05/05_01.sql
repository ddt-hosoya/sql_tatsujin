-- p103
-- ●演習問題5-① 配列テーブル 行持ちの場合
-- 「列に対する量化 オール1の行を探せ」p98では、議事配列のテーブルで列方向の量化を行う方法を考えました。
-- 演習では、このテーブルをちゃんと行持の形式に直したテーブルを使いましょう。
-- 「i」列が配列の添え字を表しますから、主キーは（key, i）です。
-- このテーブルからオール１のエンティティだけ選択してください。

SELECT distinct key FROM ArryTbl2 AT2
WHERE NOT EXISTS
(
	SELECT * FROM ArryTbl2 AT3
	WHERE AT2.key = AT3.key
	AND 1 = CASE WHEN AT3.val IS NULL THEN 1
					WHEN AT3.val <> 1 THEN 1
					ELSE 0 END
)