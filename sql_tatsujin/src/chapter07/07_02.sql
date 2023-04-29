-- p154
-- ●演習問題7-② 移動平均 その２
-- 前問では、レコード数が3行に満たない場合でも、一応、平均を求めました。
-- これを3行未満は結果をNULLとする修正を考えてください。ウィンドウ関数で出来た人はサブクエリでも考えてください。

--ウィンドウ関数
SELECT
    prc_date,
    prc_amt,
    CASE WHEN cnt = 3 THEN amt_avg
    ELSE NULL END AS amt_avg
FROM
	(SELECT prc_date, prc_amt,
	        AVG(prc_amt)
	          OVER(ORDER BY prc_date
	               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS amt_avg,
	        COUNT(*)
	          OVER(ORDER BY prc_date
	               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS cnt
	          FROM Accounts
	)
;

--相関サブクエリ
SELECT A1.prc_date, A1.prc_amt,
        (SELECT AVG(prc_amt) FROM Accounts A2
        WHERE A1.prc_date >= A2.prc_date
        AND (SELECT COUNT(*) FROM Account A3
             WHERE A3.prc_date BETWEEN A1.prc_date AND A2.prc_date) <= 3
             HAVING COUNT(*) = 3)
FROM Accounts A1
ORDER BY A1.prc_date, A2.prc_date
;
