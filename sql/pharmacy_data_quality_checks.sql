-- Duplicate Medicine Records

SELECT
Medicine_ID,
COUNT(*) AS duplicate_count
FROM pharmacy_inventory_data
GROUP BY Medicine_ID
HAVING COUNT(*) > 1;

-- Missing Supplier Information

SELECT *
FROM pharmacy_inventory_data
WHERE Supplier IS NULL
OR Supplier = '';

-- Low Stock Detection

SELECT *
FROM pharmacy_inventory_data
WHERE Stock_Quantity < Minimum_Stock;

-- Invalid Expiration Date Format

SELECT *
FROM pharmacy_inventory_data
WHERE Expiration_Date LIKE '%/%'
OR Expiration_Date = 'N/A';

-- Inconsistent Category Naming

SELECT *
FROM pharmacy_inventory_data
WHERE Category = 'supplement';

-- Inconsistent Status Values

SELECT *
FROM pharmacy_inventory_data
WHERE Status = 'active';

-- Missing Storage Conditions

SELECT *
FROM pharmacy_inventory_data
WHERE Storage_Condition IS NULL
OR Storage_Condition = '';

-- Expired or Inactive Inventory

SELECT *
FROM pharmacy_inventory_data
WHERE Status IN ('Expired', 'Inactive');
