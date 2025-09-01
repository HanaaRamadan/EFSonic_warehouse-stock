DECLARE @Language INT=1;
SET TRAN ISOLATION LEVEL READ UNCOMMITTED 
SELECT Item.ItemCode AS '??? ??????', ItemLanguage.Description as '??? ??????', PackTypeLanguage.Description AS '??????'
		, CAST(ROUND(SUM(WarehouseStock.Quantity), 3) AS numeric(19,  3)) AS '??????'
		, CAST(ROUND(SUM(WarehouseStock.Quantity * dbo.Pack.EquivalencyFactor),3) AS numeric(19,  3)) AS '?????? ??????'
		, CAST(ROUND(SUM(WarehouseStock.Quantity * dbo.PriceDefinition.Price),3) AS numeric(19, 3)) AS '??? ???????'
		, CAST(ROUND(SUM(WarehouseStock.Quantity * (dbo.PriceDefinition.Tax * dbo.PriceDefinition.Price / 100)), 3) AS numeric(19,  3)) AS '???????'
		, CAST(ROUND(SUM(WarehouseStock.Quantity * ((dbo.PriceDefinition.Tax * dbo.PriceDefinition.Price / 100) + dbo.PriceDefinition.Price)), 3) AS numeric(19, 3)) AS '??? ???????'
FROM       WarehouseStock   
INNER JOIN Pack ON WarehouseStock.PackID = Pack.PackID   
INNER JOIN Item ON Pack.ItemID = Item.ItemID   INNER JOIN ItemLanguage ON Pack.ItemID = ItemLanguage.ItemID   
INNER JOIN PackTypeLanguage ON Pack.PackTypeID = PackTypeLanguage.PackTypeID   
INNER join ItemCategory on ItemCategory.ItemCategoryID = Item.ItemCategoryID  
INNER join Division on Division.DivisionID = ItemCategory.DivisionID  
INNER join warehouse on warehouse.WarehouseID = WarehouseStock.WarehouseID
LEFT OUTER JOIN dbo.PriceDefinition ON PriceDefinition.PacKID = Pack.PackID AND PriceListID = 172
WHERE  
(ItemLanguage.LanguageID = @Language) and (PackTypeLanguage.LanguageID = @Language) 
	
GROUP BY ItemLanguage.Description, WarehouseStock.BatchNo, Item.ItemCode, PackTypeLanguage.Description 
ORDER by Item.ItemCode

