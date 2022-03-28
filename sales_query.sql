SELECT 
    *
FROM
    sales.customers;
    
    SELECT 
    *
FROM
    sales.transactions
ORDER BY order_date DESC
LIMIT 5;

SELECT 
    customers.customer_type, transactions.profit_margin
FROM
    sales.customers
        INNER JOIN
    sales.transactions ON customers.customer_code = transactions.customer_code;
    
    SELECT 
    sales_amount
FROM
    sales.transactions
ORDER BY sales_amount ASC
LIMIT 20;

SELECT 
    SUM(transactions.sales_amount)
FROM
    transactions
        JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2020;

SELECT 
    SUM(transactions.sales_amount)
FROM
    transactions
        JOIN
    date ON transactions.order_date = date.date
WHERE
    date.year = 2020
        AND date.month_name = 'january'; 
