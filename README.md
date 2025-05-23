## Restaurant Orders Analysis

## Table of Contents

-[Project Overview](#project-overview)

-[Data Sources](#data-sources)

-[Tools Used](#tools-used)

-[Exploratory Data Analysis](#exploratory-data-analysis)

-[Findings](#findings)

-[Recommendations](#recommendations)



### Project overview
---

So you've just been hired as a **Data Analyst** for the **Taste of the World Cafe** which has just debuted a new menu at the start of the year. **Your main aim is to dig into the customer data to see which menu items are doing well/not well and what top customers seem to like best**.

### The Objectives
---

There are three objectives:
1. Explore the *menu_items table* to get an idea of what's on the new menu.
2. Explore the *order_details table* to get an idea of the data that's been collected.
3. Use *both* tables to understand how customers are reacting to the new menu.

### Data Sources
---

Restaurant Orders Data: The primary dataset used for this analysis is from the **Maven Analytics data playground**  titled "**restaurant orders**" file, containing two tables *menu_items table* and *order_details table* detailing information about each sale made by the company. The data had 8 fields and a total of 12,266 records.

The *menu_items table* had 4 columns: menu_item_id, item_name, category and price whereas the *order_details table* had a total of 5 columns: order_details_id, order_id, order_date, order_time, item_id.

### Tools Used
---

- MySQL Workbench - For Database querying

- Clauses used; GROUP BY, HAVING, WHERE, ORDER BY, SUBQUERIES, LEFT JOIN, AGGREGATE FUNCTIONS.
  
### Exploratory Data Analysis
---

After loading the dataset into MySQL Workbench, it is important to note that the dataset required no cleaning with its main use being to show how Exploratory Data Analysis can be done using MySQL Workbench.

EDA involved performing the three objectives mentioned above. 

#### Objective 1: Explore the menu_items table

- View the menu_items table.

  ``` SQL
  SELECT *
  FROM menu_items;
  ```
  
- Find the number of items on the table.

  ``` SQL
  SELECT COUNT(*)
  FROM menu_items;
  ```

- What are the least and most expensive items on the menu?

  ``` SQL
  SELECT *
  FROM menu_items
  ORDER BY price;
  ```

  ``` SQL
  SELECT *
  FROM menu_items
  ORDER BY price DESC;
  ```
   
- How many Italian dishes are on the menu?

  ``` SQL
  SELECT COUNT(*)
  FROM menu_items
  WHERE category = 'Italian';
  ```

- What are the least and most expensive Italian dishes are on the menu?

  ``` SQL
  SELECT *
  FROM menu_items
  WHERE category = 'Italian'
  ORDER BY price;
  ```

  ``` SQL
  SELECT *
  FROM menu_items
  WHERE category = 'Italian'
  ORDER BY price DESC;
  ```

- How many dishes are in each category?

  ``` SQL
  SELECT category, COUNT(menu_item_id) AS num_dishes
  FROM menu_items
  GROUP BY category;
  ```

- What is the average dish price within each category?

  ``` SQL
  SELECT category, AVG(price) AS Avg_dish_price
  FROM menu_items
  GROUP BY category;
  ```

#### Objective 2: Explore the order_details table

- View the order_details table.

  ``` SQL
  SELECT *
  FROM order_details;
  ```

- What is the date range of this table?

  ``` SQL
  SELECT MIN(order_date), MAX(order_date)
  FROM order_details;
  ```

- How many orders were made within this date range?

  ``` SQL
  SELECT COUNT(DISTINCT order_id) AS Orders_made
  FROM order_details;
  ```

- How many items were ordered within this date range?

  ``` SQL
  SELECT COUNT(*) AS Items_ordered
  FROM order_details;
  ```

- Which orders had the most number of items?

  ``` SQL
  SELECT order_id, COUNT(item_id) AS num_items
  FROM order_details
  GROUP BY order_id
  ORDER BY num_items DESC;
  ```

- How many orders had more than 12 items?

  ``` SQL
  SELECT COUNT(*)
  FROM (SELECT order_id, COUNT(item_id) AS num_items
  FROM order_details
  GROUP BY order_id
  ORDER BY num_items
  HAVING num_items > 12) AS num_orders;
  ```

#### Objective 3: Jointly Explore the two tables

- Combine the menu_items table and the order_details table into a single table.

  ``` SQL
  SELECT * 
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id;
  ```

- What were the least and most ordered items?

  ``` SQL
  SELECT item_name, COUNT(order_details_id) AS num_purchases
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  GROUP BY item_name
  ORDER BY num_purchases;
  ```

  ``` SQL
  SELECT item_name, COUNT(order_details_id) AS num_purchases
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  GROUP BY item_name
  ORDER BY num_purchases DESC;
  ```

- What categories were they in?
    
  ``` SQL
  SELECT item_name, category COUNT(order_details_id) AS num_purchases
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  GROUP BY item_name, category
  ORDER BY num_purchases;
  ```

  ``` SQL
  SELECT item_name, category COUNT(order_details_id) AS num_purchases
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  GROUP BY item_name, category
  ORDER BY num_purchases DESC;
  ```

- What were the top 5 orders that spent the most money?
    
  ``` SQL
  SELECT order_id, SUM(price) AS total_spend
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  GROUP BY order_id
  ORDER BY total_spend DESC
  LIMIT 5;
  ```

- View details of the highest spend order. 
    
  ``` SQL
  SELECT category, COUNT(item_id) AS num_items
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  WHERE order_id = 440
  GROUP BY category;
  ```

- View details of the top 5 highest spend orders.
    
  ``` SQL
  SELECT order_id, category, COUNT(item_id) AS num_items
  FROM order_details AS OD 
  LEFT JOIN menu_items AS MI 
     ON OD.item_id = MI.menu_item_id
  WHERE order_id IN(440, 2075, 1957, 330, 2675
  GROUP BY order_id, category;
  ```
  
### Findings
---

Below are some of the findings from our analysis:
1. Even though Italian dishes weren't the most popular, the highest spend order tend to like it a lot.
2. The Mexican Chicken Tacos was the least ordered item on the menu.
3. The American Hamburger was the most ordered item on the menu.
4. The Italian and Mexican were the least popular dishes on the menu.
5. The American and Asian were the most popular dishes on the menu.
6. The highest spend orders were on the Italian dishes.

### Recommendations
---

Based on my findings from the above analysis, I would recommend the following actions:
- Since *Italian dishes attract high-spending customers despite lower overall popularity*, the restaurant should consider **developing premium Italian menu items** that justify higher price points. This could help maximize revenue from these valuable customers.
- With Mexican Chicken Tacos being the least ordered item and Mexican cuisine showing low popularity overall, either:
  - Refresh the Mexican dishes with new flavors or presentation.
  - Consider replacing underperforming Mexican items with new options that align with customer preferences.
- Create combo meals that pair popular American or Asian dishes with your high-value Italian items to introduce more customers to these options.
  
