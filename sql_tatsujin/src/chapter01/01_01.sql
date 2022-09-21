--p23
--●演習問題1-① 複数列の最大値

--SQLでは複数行の中から最大値／最小値を選ぶことは簡単です。
--適当なキーでGROUP BY句で集約し、MAX／MIN関数を使えば良いだけです。
--では、複数列の中から最大値を選ぶにはどうすればよいでしょうか。
--サンプルデータは以下のものを使いましょう。

-- [Greatests]
-- Key,x,y,z
-- ----------
-- A  ,1,2,3
-- B  ,5,5,2
-- C  ,4,7,1
-- D  ,3,3,8


--このテーブルからxとyの最大値を取得することを考えます。求める結果は次のようになります。
-- <結果>
-- key,greatest
-- ------------
-- A  ,2
-- B  ,5
-- C  ,7
-- D  ,3

--Oracle,PostgreSQL,MySQLには、こういう時の為のその名もずばりGREATEST関数が用意されていますが、
--あくまで標準SQLで求めてください。


SELECT
	Key,
	CASE WHEN x > y THEN x ELSE y END AS greatest
FROM
	Greatests
;

--これができたら、3列以上にも拡張してみましょう。今度はx,y,zから最大値を求めるので結果は次のようになります。
-- <結果>
-- key,greatest
-- ------------
-- A  ,3
-- B  ,5
-- C  ,7
-- D  ,8


SELECT
	Key,
	CASE WHEN
		CASE WHEN x > y THEN x ELSE y END > z
	THEN CASE WHEN x > y THEN x ELSE y END
	ELSE z END AS greatest
FROM
	Greatests
;