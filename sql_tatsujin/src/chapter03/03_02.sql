--p59
--●演習問題3-② ウィンドウ関数で重複削除
--p.49でみた重複行の削除を実装依存の機能を使わずに実行する方法を考えてください。
--ヒントは前章で学んだウィンドウ関数でレコードに対して一意な識別子を与えることと、もう一つテーブルを使うことです。

--もう一つテーブルを作成する
CREATE TABLE Products_Unique
	AS
	SELECT
		ROW_NUMBER() OVER(PARTITION BY name, price ORDER BY name) AS row_num,
		name,
		price
	FROM Products
;

--作成したテーブルから重複行を削除する
DELETE FROM Products_Unique WHERE row_num > 1;
