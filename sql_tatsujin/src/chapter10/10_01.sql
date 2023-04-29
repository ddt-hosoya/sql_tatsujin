-- p214
-- ●演習問題10-① 欠番をすべて求める -NOT EXISTSと外部結合
-- 本文にも書いたように、SQLで差集合演算を実現する方法は多くあります。
-- 文中ではEXCEPTとNOT INを使ったものを紹介しました。ここではNOT EXISTSと外部結合を使う方法を考えてみてください。

-- NOT EXISTS
SELECT seq
	FROM Sequence
WHERE seq BETWEEN 1 AND 12
AND NOT EXISTS
	(SELECT * FROM seqTbl
	WHERE Sequence.seq = SeqTbl.seq)
;

-- 外部結合
SELECT seq
	FROM Sequence
	LEFT OUTER JOIN SeqTbl
	ON Sequence.seq = SeqTbl.seq
WHERE seq BETWEEN 1 AND 12
AND SeqTbl.seq IS NULL
;