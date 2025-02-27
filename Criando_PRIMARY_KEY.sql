------------------------------------------------
-- Criando Relacionamento entre as tabelas ACT
------------------------------------------------

-- CRIANDO AS PRIMARY KEY

--1. TABLE TB_ACT_OLIST_ORDERS
select * from TB_ACT_OLIST_ORDERS

alter table TB_ACT_OLIST_ORDERS 
alter column ORDER_ID NVARCHAR(150) Not null; -- Alterando a tabela para não aceitar nulos

alter table TB_ACT_OLIST_ORDERS
add constraint ORDER_ID_PK primary key (ORDER_ID)

EXEC sp_help TB_ACT_OLIST_ORDERS

--1. TABLE TB_ACT_OLIST_CUSTOMERS

select * from TB_ACT_OLIST_CUSTOMERS

alter table TB_ACT_OLIST_CUSTOMERS 
alter column CUSTOMER_ID NVARCHAR(150) Not null; -- Alterando a tabela para não aceitar nulos

alter table TB_ACT_OLIST_CUSTOMERS
add constraint CUSTOMER_ID_PK primary key (CUSTOMER_ID)

EXEC sp_help TB_ACT_OLIST_CUSTOMERS

--3. TABLE TB_ACT_OLIST_GEOLOCATION

select * from TB_ACT_OLIST_GEOLOCATION

alter table TB_ACT_OLIST_GEOLOCATION
alter column GEOLOCATION_ZIP_CODE_PREFIX NVARCHAR(15) Not null;-- Alterando a tabela para não aceitar nulos

alter table TB_ACT_OLIST_GEOLOCATION														-- Apresentou duplicidade
add constraint GEOLOCATION_ZIP_CODE_PREFIX_PK primary key (GEOLOCATION_ZIP_CODE_PREFIX)

select GEOLOCATION_ZIP_CODE_PREFIX, count (*) 
from TB_ACT_OLIST_GEOLOCATION
group by GEOLOCATION_ZIP_CODE_PREFIX
having count (*) > 1;

-- Resolução do problema de duplicidade
with CTE_Duplicados as
(
	select
		row_number() over (partition by GEOLOCATION_ZIP_CODE_PREFIX order by GEOLOCATION_ZIP_CODE_PREFIX) as RN
		from TB_ACT_OLIST_GEOLOCATION
)
delete from TB_ACT_OLIST_GEOLOCATION 
where GEOLOCATION_ZIP_CODE_PREFIX in (select GEOLOCATION_ZIP_CODE_PREFIX from CTE_Duplicados where RN > 1);

EXEC sp_help TB_ACT_OLIST_GEOLOCATION

--3. TABLE [dbo].[TB_ACT_OLIST_SALLERS]

select top 10 * from TB_ACT_OLIST_SALLERS

alter table TB_ACT_OLIST_SALLERS
alter column SELLER_ID NVARCHAR(150) Not null;

alter table TB_ACT_OLIST_SALLERS
add constraint SELLER_ID_PK primary key (SELLER_ID)

EXEC sp_help TB_ACT_OLIST_SALLERS

--4. TABLE [dbo].[TB_ACT_PRODUCT_CATEGORY]

select * from TB_ACT_PRODUCT_CATEGORY

alter table TB_ACT_PRODUCT_CATEGORY
alter column PRODUCT_CATEGORY_NAME NVARCHAR(150) Not null;

alter table TB_ACT_PRODUCT_CATEGORY
add constraint PRODUCT_CATEGORY_NAME_PK primary key (PRODUCT_CATEGORY_NAME)

EXEC sp_help TB_ACT_PRODUCT_CATEGORY

--5. TABLE [dbo].[TB_ACT_PRODUCTS]

select * from TB_ACT_PRODUCTS

alter table TB_ACT_PRODUCTS
alter column PRODUCT_ID NVARCHAR(150) NOT NULL;

alter table TB_ACT_PRODUCTS
add constraint PRODUCT_ID_PK primary key (PRODUCT_ID)

EXEC sp_help TB_ACT_PRODUCTS