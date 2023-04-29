-- p177
-- ●演習問題8-① 結合が先か、集約が先か？
-- 「クロス表で入れ子の表側を作る」（p.163）では、集約して、DATAビューとMASTERビューの
-- 対応を一対一にしてから結合を行いました。これはこれでわかりやすい方法ですが、パフォーマンスを考慮するならば、
-- 中間ビューを二つ作るのは無駄が多い方法です。そこで、中間ビューをなるべく減らすように、コードを改良してください。

SELECT
	MASTER.age_class,
	MASTER.sex_cd,
	SUM(CASE WHEN TblPop.pref_name IN ('青森', '秋田')
	THEN TblPop.population ELSE NULL END) AS pop_tohoku,
	SUM(CASE WHEN TblPop.pref_name IN ('東京', '千葉')
	THEN TblPop.population ELSE NULL END) AS pop_kanto
FROM (SELECT age_class, sex_cd FROM TblAge CROSS JOIN TblSex) MASTER
LEFT OUTER JOIN TblPop
	ON MASTER.age_class = TblPop.age_class
	AND MASTER.sex_cd = TblPop.sex_cd
GROUP BY MASTER.age_class, MASTER.sex_cd
;