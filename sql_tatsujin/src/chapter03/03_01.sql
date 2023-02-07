--p59
--●演習問題3-① 重複組み合わせ
--p.44のProductsテーブルを使って、2列の重複組み合わせを求めてみてください。
--結果は次のようになります。
--【結果】
-- name_1,name_2
-- ------ ------
-- バナナ,みかん
-- バナナ,りんご
-- バナナ,バナナ
-- りんご,みかん
-- りんご,りんご
-- みかん,みかん

-- [Products]
-- name(商品名), price(値段)
-- ------------  -----------
-- りんご      , 50
-- みかん      , 100
-- バナナ      , 80

SELECT P1.name AS name_1, P2.name AS name_2
FROM Products P1 INNER JOIN Products P2
ON P1.name >= P2.name;

