-- p214
-- ●演習問題10-② シーケンスを求める -集合指向的発想
-- 「3人なんですけど、座れますか？」（p.203）では、NOT EXISTSで全称量化を表現することによって
-- シーケンスを求めました。これをHAVING句を使って書き換えてください。行に折り返しがないケースが解けたら、
-- 折り返しのあるケースも考えてみてください。

SELECT S1.seat AS start_seat, '～', S2.seat AS end_seat
	FROM Seats S1, Seats S2, Seats S3
	WHERE S2.seat = S1.seat + (:head_cnt -1)
	AND S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY S1,seat, S2.seat
HAVING COUNT(*) = SUM(CASE WHEN S3.status = '空' THEN 1 ELSE 0 END)
;

--折り返しあり
SELECT S1.seat AS start_seat, '～', S2.seat AS end_seat
	FROM Seats S1, Seats S2, Seats S3
	WHERE S2.seat = S1.seat + (:head_cnt -1)
	AND S3.seat BETWEEN S1.seat AND S2.seat
GROUP BY S1,seat, S2.seat
HAVING COUNT(*) = SUM(CASE WHEN S3.status = '空'
					AND S3.line_id = S1.line_id THEN 1 ELSE 0 END)
;