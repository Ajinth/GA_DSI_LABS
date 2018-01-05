# Investigating the Northwind Database

The Northwind database is a sample relational database with simulated data. Its construction and organization is very similar to a "typical" use case, however, and it presents a great test area to practice manipulating and presenting results.

In the same way as yesterday, please upload the `northwind.db` to [https://sqliteonline.com/](https://sqliteonline.com/). Your work should be put in a text file in this repository, added, committed, and submitted via pull request. 

## Questions

Using the Northwind database, please answer the following questions. For more information on the layout of the Northwind schema check out [https://northwinddatabase.codeplex.com/](https://northwinddatabase.codeplex.com/). Make sure that if you are using a join that you have used aliases for both tables. 

Some of these questions may be interpreted in multiple ways. If you are not sure what a question is asking, make your best judgement and then ask for clarification from your local instructor or in the `#dsi-plus2-ec` channel. 

In addition, data work may frequently require outside research or googling. It is not our intention that that be the _bulk_ of your work however -- if you have spent 10-15 minutes and are not making headway, please let us know so that we can point you in the right direction!

It is not required to complete every question on this lab -- try your best and finish as many as you can!

0. What information is contained in the following tables? What is the primary key for each table? Which tables can they join to? **Hint:** navigating a new SQL database involves both relying on documentation (such as the Northwind schema information above) and also using your intuition and exploration. 
    - `categories`
    - `customers`
    - `employees`
    - `products`
    - `orders`
1. What categories of products are sold in this database?
2. How many products per category does the catalog contain?
3. Let's focus only on products that have not been discontinued => how many products per category?
4. What are the most expensive five products (not discontinued)?
5. How many units of each of these five products are there in stock?
6. How many orders are there in total?
7. Which country is receiving the most orders?
8. Which country is receiving the least?
9. What customer is submitting the highest number of orders?
10. What is the average freight weight per order, by customer?
11. What are all unique cities that customers are located in that begin with R? 
12. How many countries are customers located in that are not the UK or the US?
    - Can you use `LIKE`? Why or why not?
13. How many customers are in each country (not including the UK or the US)?
14. Which employees have less than 100 total orders (from the `orders` table)? Please include their `titleofcourtesy`, `firstname`, and `lastname`
    - Extra credit: Research the `||`  operator to concatenate results and join those three fields into one.