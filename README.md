## Restaurant Orders Analysis

## Table of Contents

-[Project Overview](#project-overview)

-[Data Sources](#data-sources)

-[Tools](#tools)

-[Data Cleaning](#data-cleaning)

-[Exploratory Data Analysis](#exploratory-data-analysis)

-[Data Analysis](#data-analysis)

-[Findings](#findings)

-[Recommendations](#recommendations)

-[Limitations](#limitations)

-[References](#references)


### Project overview
---

So you've just been hired as a **Data Analyst** for the **Taste of the World Cafe** which has just debuted a new menu at the start of the year. Your main aim is to dig into the customer data to see which menu items are doing well/not well and what top customers seem to like best.

### The Objectives
---

There are three objectives:
1. Explore the *menu_items table* to get an idea of what's on the new menu.
2. Explore the *order_details table* to get an idea of the data that's been collected.
3. Use *both* tables to understand how customers are reacting to the new menu.

### Data Sources
---

Restaurant Orders Data: The primary dataset used for this analysis is from the maven analytics playground  tittled the "sales_data.csv" file, containing two tables menu items table and order details table detailed information about each sale made by the company. We downloaded the SQL option instead of csv since we'll be using MySQL.

### Tools
---

- MySQL - Data Analysis
  
### Exploratory Data Analysis
---

Now, it is important to note that the dataset was clean are requirred no cleaning with the main use was to show how Exploratory Data Analysis can be done in MySQL.
EDA involved performing the three objectives mentioned above. 

#### Objective 1

- View the menu_items table.

  ``` SQL
  SELECT *
  FROM menu_items;
  
- View the menu_items table and write a query to find the number of items on the menu.


### Exploratory Data Analysis
---

EDA involved exploring the sales data to answer key questions, such as:

- What is the overall sales trend?
- Which products are top sellers?
- What are the peak sales periods?

### Data Analysis
---

Include some interesting code/features worked with

``` SQL
SELECT *
FROM table 1
WHERE cond = 2;
```

### Findings
---

Below are some of the findings from our analysis:
1. The company's sales have been steadily increasing over the past year, with a noticeable peak during the holiday season.
2. Product Category A is the best-perfoming category in terms of sales and revenue.
3. Customer segments with high lifetime value (LTV) should be targetted for marketing efforts.

### Recommendations
---

Based on our analysis, we recommend the following actions:
- Invest in marketing and promotions during peak sales seasons to maximize revenue.
- Focus on expanding and promoting products in Category A.
- Implement a custoomer segmentation strategy to target high-LTV customers effectively.

### Limitations
---

I had to remove all zero values from the budget and revenue columns because they would have affected the accuracy of my conclusions from the analysis. There are still a few outliers even after the ommissions but even then we can still see that there is a positive correlation between both budget and number of votes with revenue.

### References
---

1. SQL For Data Analysis
2. [Stack overflow](https:https//stack.com)
