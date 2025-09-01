# EFSonic_warehouse-stock

📌 Query: Warehouse Stock & Item Valuation

Description
This query generates a warehouse stock report showing available quantities, equivalent quantities, and total valuation including tax. It retrieves multilingual item descriptions and pack details for better readability.

Parameters

@Language → Used to fetch descriptions (items, pack types) in the selected language.

Key Features

Joins multiple tables: WarehouseStock, Pack, Item, ItemLanguage, PackTypeLanguage, ItemCategory, Division, Warehouse, and PriceDefinition.

Calculates stock and valuation using:

Quantity → Current stock in packs.

Equivalent Quantity → Adjusted by EquivalencyFactor.

Price Without Tax → Based on PriceDefinition.Price.

Tax Value → Calculated as (Tax% × Price × Quantity).

Price With Tax → Sum of base price and tax.

Uses ROUND() and CAST() to format results to 3 decimal places.

Supports multilingual output via ItemLanguage and PackTypeLanguage.

Output Columns

ItemCode → Item unique code.

Item Description → Item name (localized).

Pack Type → Packaging type (localized).

Quantity → Total stock quantity.

Equivalent Quantity → Quantity converted by pack factor.

Price Without Tax → Valuation excluding tax.

Tax Value → Total tax amount.

Price With Tax → Valuation including tax.

Use Case
✅ Suitable for inventory management and financial reporting, providing stock levels and valuation per item across warehouses, with support for multiple languages.
