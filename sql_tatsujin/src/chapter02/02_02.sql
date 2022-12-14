--p43
--●演習問題2-② ウィンドウ関数の結果予測 その２

--前問のServerLoadSampleに対して、次のSELECT文の結果を予想してください。

SELECT server, sample_date,
	SUM(load_val) OVER (PARTITION BY server) AS sum_load
FROM ServerLoadSample;

-- server,sample_date,sum_load
-- ---------------------------
-- A     ,2018-02-01 ,8521
-- A     ,2018-02-02 ,8521
-- A     ,2018-02-05 ,8521
-- A     ,2018-02-07 ,8521
-- A     ,2018-02-08 ,8521
-- A     ,2018-02-12 ,8521
-- B     ,2018-02-01 ,62427
-- B     ,2018-02-02 ,62427
-- B     ,2018-02-03 ,62427
-- B     ,2018-02-04 ,62427
-- B     ,2018-02-05 ,62427
-- B     ,2018-02-06 ,62427
-- C     ,2018-02-01 ,3500
-- C     ,2018-02-07 ,3500
-- C     ,2018-02-16 ,3500
