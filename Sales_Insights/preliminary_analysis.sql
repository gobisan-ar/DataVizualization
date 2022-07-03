/** 1. Show all customer records **/
SELECT * FROM sales.customers;

/** 2. Show total number of customers **/
SELECT COUNT(*) FROM sales.customers;

/** 3. Show markets and zones **/
SELECT DISTINCT zone, markets_name
FROM sales.markets
ORDER BY zone;

/** 4. Show all transactions for Chennai market 
Market code for chennai is Mark001 **/
SELECT * FROM sales.transactions where market_code='Mark001';

/** 5. Show distrinct product codes that were sold in chennai **/
SELECT distinct product_code FROM sales.transactions where market_code='Mark001';

/** 6. Show transactions where currency is US dollars **/
SELECT * FROM sales.transactions where currency="USD";

/** 7. Show transactions in 2020 join by date table **/
SELECT sales.transactions.* 
FROM sales.transactions INNER JOIN sales.date 
ON sales.transactions.order_date = sales.date.date 
WHERE sales.date.year = 2020;

/* 8. Show total revenue in year 2020 **/
SELECT SUM(transactions.sales_amount) 
FROM sales.transactions INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 
AND sales.transactions.currency = "INR\r"
OR sales.transactions.currency = "USD\r";

/** 9. Show total revenue in year 2020, January Month **/
SELECT SUM(transactions.sales_amount)
FROM sales.transactions INNER JOIN sales.date 
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020
AND sales.date.month_name = "January"
AND (sales.transactions.currency="INR\r" or sales.transactions.currency="USD\r");

/** 10. Show total revenue in year 2020 in Chennai **/
SELECT sales.transactions.* 
FROM sales.transactions INNER JOIN sales.date 
ON sales.transactions.order_date = sales.date.date 
WHERE sales.date.year = 2020
AND sales.transactions.market_code = "Mark001";