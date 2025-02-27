------------------------------------------------
-- Criando Relacionamento entre as tabelas ACT
------------------------------------------------

-- CRIANDO AS FOREING KEY

--1. TABLE TB_ACT_OLIST_ORDERS
select * from TB_ACT_OLIST_ORDERS

alter table TB_ACT_OLIST_ORDERS
add constraint CUSTOMER_ID_FK foreign key (CUSTOMER_ID) references TB_ACT_OLIST_CUSTOMERS (CUSTOMER_ID)

EXEC sp_help TB_ACT_OLIST_ORDERS


--2. TABLE [dbo].[TB_ACT_OLIST_SALLERS]

select top 10 * from TB_ACT_OLIST_SALLERS

alter table TB_ACT_OLIST_SALLERS						-- Resolver duplicidade
add constraint SELLER_ID_PK primary key (SELLER_ID)

EXEC sp_help TB_ACT_OLIST_SALLERS


--3. TABLE [dbo].[TB_ACT_PRODUCTS]

select * from TB_ACT_PRODUCTS
select * from TB_ACT_PRODUCT_CATEGORY

alter table TB_ACT_PRODUCTS alter column PRODUCT_CATEGORY_NAME NVARCHAR(150)

/* Problema de compatibilidade nos dados da coluna */

select P.PRODUCT_CATEGORY_NAME from TB_ACT_PRODUCTS P
left join TB_ACT_PRODUCT_CATEGORY C ON P.PRODUCT_CATEGORY_NAME = C.PRODUCT_CATEGORY_NAME
WHERE C.PRODUCT_CATEGORY_NAME IS NULL

insert into TB_ACT_PRODUCT_CATEGORY (PRODUCT_CATEGORY_NAME)	-- resolução do problema/ inserindo os valores
select distinct PRODUCT_CATEGORY_NAME 
from TB_ACT_PRODUCTS
where PRODUCT_CATEGORY_NAME NOT IN (select PRODUCT_CATEGORY_NAME from TB_ACT_PRODUCT_CATEGORY); 

alter table TB_ACT_PRODUCTS
add constraint PRODUCT_CATEGORY_NAME_FK foreign key (PRODUCT_CATEGORY_NAME) references TB_ACT_PRODUCT_CATEGORY (PRODUCT_CATEGORY_NAME)

EXEC sp_help TB_ACT_PRODUCTS

--4. [dbo].[TB_ACT_OLIST_ORDER_ITEMS]

select * from TB_ACT_OLIST_ORDER_ITEMS

alter table TB_ACT_OLIST_ORDER_ITEMS
add constraint ORDER_ID_FK foreign key (ORDER_ID) references TB_ACT_OLIST_ORDERS (ORDER_ID);

alter table TB_ACT_OLIST_ORDER_ITEMS
add constraint PRODUCT_ID_FK foreign key (PRODUCT_ID) references TB_ACT_PRODUCTS (PRODUCT_ID);

alter table TB_ACT_OLIST_ORDER_ITEMS
add constraint SELLER_ID_FK foreign key (SELLER_ID) references TB_ACT_OLIST_SALLERS (SELLER_ID);

exec sp_help TB_ACT_OLIST_ORDER_ITEMS

--5. [dbo].[TB_ACT_ORDER_PAYMENTS]

select * from TB_ACT_ORDER_PAYMENTS

alter table TB_ACT_ORDER_PAYMENTS
add ORDER_ID_PAYMENT NVARCHAR(150);

alter table TB_ACT_ORDER_PAYMENTS
add constraint ORDER_ID_PAYMENT_FK foreign key (ORDER_ID_PAYMENT) references TB_ACT_OLIST_ORDERS (ORDER_ID)