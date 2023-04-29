-- p154
-- ●演習問題7-① 移動平均
-- 移動平均という統計指標があります。株式投資やFXをやる人にはなじみ深いと思いますが、
-- あるウィンドウの範囲の平均値を、レコードをずらしながら求めるもので、
-- ウィンドウが移動していくように見えることからこの名前がつきました。
-- 「2 必ずわかるウィンドウ関数」でも見たように、ウィンドウ関数で移動平均（または移動合計）を求めることは簡単です。
-- 例えば、次のような銀行口座の入出金を記録するテーブルから、カレント行と前2行を含む3行をウィンドウとする移動平均
-- を求めることを考えます。レコード数の足りない最初の2行について「結果なし」とするか、
-- 存在するデータで平均求めるかは要件次第ですが、ここでは後者を採用します。これはウィンドウ関数のデフォルトの動作でもあります。

-- <Accounts>
-- prc_date(処理日), prc_amt(処理金額)
-- ----------------, -----------------
-- 2018-10-26      ,  12000
-- 2018-10-28      ,   2500
-- 2018-10-31      , -15000
-- 2018-11-03      ,  34000
-- 2018-11-04      ,  -5000
-- 2018-11-06      ,   7200
-- 2018-11-11      ,  11000

--ウィンドウ関数ならフレーム句を使えば簡単に求められます。
SELECT prc_date, prc_amt,
        AVG(prc_amt)
          OVER(ORDER BY prc_date
               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
          FROM Accounts
;

--同じ結果をあえて相関サブクエリを使って求めてください。
SELECT A1.prc_date, A1.prc_amt,
        (SELECT AVG(A2.prc_amt) FROM Accounts A2
        WHERE A1.prc_date >= A2.prc_date
        AND (SELECT COUNT(*) FROM Account A3
             WHERE A3.prc_date BETWEEN A1.prc_date AND A2.prc_date) <= 3)
FROM Accounts A1
ORDER BY A1.prc_date, A2.prc_date
;
