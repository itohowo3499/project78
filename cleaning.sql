--SELECT TOP (1000) [UniqueID ]
--      ,[ParcelID]
--      ,[LandUse]
--      ,[PropertyAddress]
--      ,[SaleDate]
--      ,[SalePrice]
--      ,[LegalReference]
--      ,[SoldAsVacant]
--      ,[OwnerName]
--      ,[OwnerAddress]
--      ,[Acreage]
--      ,[TaxDistrict]
--      ,[LandValue]
--      ,[BuildingValue]
--      ,[TotalValue]
--      ,[YearBuilt]
--      ,[Bedrooms]
--      ,[FullBath]
--      ,[HalfBath]
--  FROM [datacleaning].[dbo].[Sheet1$]



SELECT *
FROM datacleaning.dbo.house


/* when you want to modified the date of a particular column*/

SELECT saleDateconverted, CONVERT(DATE,saleDate)
FROM datacleaning.dbo.house

UPDATE house
SET saleDate = CONVERT(DATE,saleDate)


ALTER TABLE house
ADD saleDateconvertedd DATE;

UPDATE house
SET saleDateconverted = CONVERT(DATE,saleDate)

/*----------------------------------------------------------------------*/


/*property address*/




SELECT *
FROM datacleaning.dbo.house
--WHERE PropertyAddress is null
ORDER BY ParcelID



--SELECT a.ParcelID, a.PropertyAddress, b.parcelID, b.PropertyAddress
--FROM datacleaning.dbo.house a
--JOIN datacleaning.dbo.house b
--     ON a.ParcelID = B.ParcelID
--     AND a.[UniqueID] <> b.[UniqueID]
--WHERE  a.PropertyAddress is NULL




SELECT a.ParcelID, a.PropertyAddress, b.parcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM datacleaning.dbo.house a
JOIN datacleaning.dbo.house b
     ON a.ParcelID = B.ParcelID
     AND a.[UniqueID] <> b.[UniqueID]
WHERE  a.PropertyAddress is NULL

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)

FROM datacleaning.dbo.house a
JOIN datacleaning.dbo.house b
     ON a.ParcelID = B.ParcelID
     AND a.[UniqueID] <> b.[UniqueID]
WHERE  a.PropertyAddress is NULL




SELECT PropertyAddress
FROM datacleaning.dbo.house
--WHERE PropertyAddress is null
ORDER BY ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)) AS Address
FROM datacleaning.dbo.house

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) AS Address
, SUBSTRING(PropertyAddress,  CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress)) AS Address

FROM datacleaning.dbo.house





ALTER TABLE house
ADD PropertyspiltAddress varchar(500);

UPDATE house
SET PropertyspiltAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',',PropertyAddress)-1) 

ALTER TABLE house
ADD Propertyspiltcity  varchar(500);

UPDATE house
SET Propertyspiltcity = SUBSTRING(PropertyAddress,  CHARINDEX(',',PropertyAddress) +1, LEN(PropertyAddress))

SELECT *
FROM datacleaning.dbo.house






SELECT OwnerAddress
FROM datacleaning.dbo.house




SELECT 
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
FROM datacleaning.dbo.house



SELECT 
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)
,PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
FROM datacleaning.dbo.house



ALTER TABLE house
ADD OwnerspiltAddress VARCHAR(245);

UPDATE house
SET OwnerspiltAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE house
ADD Ownerspiltcity VARCHAR(345);

UPDATE house
SET  OwnerspiltCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)

ALTER TABLE house
ADD Ownerspiltstate VARCHAR(345);

UPDATE house
SET  Ownerspiltstate = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)



SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM datacleaning.dbo.house
GROUP BY SoldAsVacant
ORDER BY 2


SELECT SoldAsVacant
,  CASE WHEN SoldAsVacant = 'Y' THEN 'YES'
        WHEN SoldAsVacant = 'n' THEN 'NO'
		ELSE SoldAsVacant
		END
FROM datacleaning.dbo.house

UPDATE house
set SoldAsVacant =  CASE WHEN SoldAsVacant = 'Y' THEN 'YES'
        WHEN SoldAsVacant = 'n' THEN 'NO'
		ELSE SoldAsVacant
		END







/* REMOVING DUPLICATE*/



SELECT *,
    ROW_NUMBER() OVER (
    PARTITION BY ParcelID,    
                 PropertyAddress,
				 Saleprice,
				 LegalReference
				 ORDER BY
				   UniqueID
				     ) ROW_NUM


FROM datacleaning.dbo.house
--ORDER BY ParcelI

SELECT *
FROM RowNumCTE
WHERE Row_num > 1
--ORDER BY PropertyAddress











SELECT *
FROM datacleaning.dbo.house




/* DELETE UNUSED COLUMN*/

SELECT *
FROM datacleaning.dbo.house


ALTER TABLE datacleaning.dbo.house
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE datacleaning.dbo.house
DROP COLUMN SaleDate







