-- p104
-- ●演習問題5-② ALL述語による全称量化
-- 全称量化は、NOT EXISTS だけでなく、ALL述語によっても書くことができます。
-- ALL述語は二重否定を使わなくてよいためSQLがわかりやすくなるのが利点です。
-- では、「全称量化[その２]集合vs.述語 ―すごいのはどっちだ？」(p.96)のクエリを、
-- ALL述語で書き換えてみてください。

SELECT * FROM Projects P1
WHERE 1 = ALL(
	SELECT CASE WHEN step_nbr <= 1
		AND status = '完了' THEN 1
		WHEN step_nbr > 1
		AND status = '待機' THEN 1
		ELSE 0 END
	FROM Projects2 P2
	WHERE P1.project_id = P2.project_id)
;