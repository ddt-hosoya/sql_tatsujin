--p25
--●演習問題1-③ ORDER BYでソート列を作る

--最後に考えてもらう問題は、ちょっと小手先のテクニックに属するものですが、時として使う必要に迫られることがあるので
--紹介しておきます。演習問題1-①で利用したGreatestsテーブルに対して、普通に「SELECT Key FROM Greatests ORDER BY key;」
--というクエリを実行すると、通常はkey列をアルファベット順にソートした形で結果が表示されます。
--では問題です。その表示結果を、「B-A-C-D」の順番に並び変えるクエリを考えてください。この順番に特に規則性はありません。

SELECT
	CASE Key
	WHEN 'B' THEN 1
	WHEN 'A' THEN 2
	WHEN 'C' THEN 3
	WHEN 'D' THEN 4
	ELSE null END
	AS key_order
FROM Greatests
ORDER BY key_order ASC
;
