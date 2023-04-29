-- p177
-- ●演習問題8-② 子どもの数にご用心
-- 「外部結合で行列変換：その２（列→行）-繰り返し項目を一列にまとめる」（p.160）では、
-- 社員ごとの子どもの一覧を求めました。こういうリストが得られれば、1人の社員が何人の子どもを扶養しているか
-- という情報も、社員単位で集約することで簡単に求められます。
-- では、本文のクエリを修正して、これを求めてください。求める結果は次のようになります。

-- employee, child_cnt
-- --------, ---------
-- 赤井    , 3
-- 工藤    , 2
-- 鈴木    , 1
-- 吉田    , 0

SELECT
	EMP.employee,
	COUNT(Children.child) AS child_cnt
FROM Personnel EMP
	LEFT OUTER JOIN Children
	ON Children.child IN (EMP.child_1, EMP.child_2, EMP.child_3)
GROUP BY EMP.employee
;
