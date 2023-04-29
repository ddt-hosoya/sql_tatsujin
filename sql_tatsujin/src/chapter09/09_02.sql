-- p196
-- ●演習問題9-② 厳密な関係除算
-- 「差集合で関係除算を表現する」（p.186）で、除算を減算に還元して解く方法を紹介しました。
-- そのクエリを「厳密な除算」をするように修正してください。今度は過不足なくスキルを満たす社員だけを選択するので、
-- 結果は神崎氏1人になります。

SELECT DISTINCT emp
	FROM EmpSkills ES1
WHERE NOT EXISTS
	((SELECT skill FROM Skills
		EXCEPT
	SELECT skill FROM EmpSkills ES2
	WHERE ES1.emp = ES2.emp)
		UNION
	(SELECT skill FROM EmpSkills ES3
	WHERE ES1.emp = ES3.emp
		EXCEPT
	SELECT skill FROM Skills))
;