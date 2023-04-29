--p136
--●演習問題6-② 特性関数の練習
--本文中のStudentsテーブルを使って特性関数の練習をしておきましょう。
--「全員が9月中に提出済みの学部」を選択するSQLを考えてください。
--答えは経済学部ただ一つになります。理学部は100番の学生が10月になってから提出しているので却下、
--文学部と工学部はそもそも未提出の学生がいる時点でこれもダメです。

SELECT dpt
FROM Students
GROUP BY dpt
HAVING COUNT(*) = SUM(CASE WHEN sbmt_date IS NOT NULL
AND sbmt_date BETWEEN '2018-09-01' AND '2018-09-30' THEN 1 ELSE 0 END);
