-- 1. Combine the menu_items and order_details tables into a single table.
SELECT * 
FROM order_details AS OD
LEFT JOIN menu_items AS MI
     ON OD.item_id = MI.menu_item_id;
     
-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_name, COUNT(order_details_id) AS num_purchases
FROM order_details AS OD
LEFT JOIN menu_items AS MI
     ON OD.item_id = MI.menu_item_id
GROUP BY item_name
ORDER BY num_purchases;

SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details AS OD
LEFT JOIN menu_items AS MI
     ON OD.item_id = MI.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_spend
FROM order_details AS OD
LEFT JOIN menu_items AS MI
     ON OD.item_id = MI.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can we gather from this?
SELECT category, COUNT(item_id) AS num_items
FROM order_details AS OD
LEFT JOIN menu_items AS MI
     ON OD.item_id = MI.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- 5. View the details of the top 5 highest spend orders. What insights can we gather from this?
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details AS OD
LEFT JOIN menu_items AS MI
     ON OD.item_id = MI.menu_item_id
WHERE order_id IN( 440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;