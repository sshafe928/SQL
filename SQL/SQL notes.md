# SQL Notes

## Creating a Table

To start managing customer information, you need to create a table named `customers`. This table will have columns for storing an ID, the customer's name, age, and weight. The ID will be a unique number for each customer, and the other columns will store textual and numerical data.

## Inserting Data

After setting up your table, you can add data to it. For example, you can insert a new customer by providing values for each column. You might first use a method where you list all the columns in the table and their corresponding values, like entering data for a customer named Alice, who is 30 years old and weighs 150.5 pounds. Alternatively, you can specify just the columns for which you are providing values, such as adding a customer named Bob, who is 25 years old and weighs 180.0 pounds.

- **Insert data without specifying column names:**
    ```sql
    INSERT INTO customers VALUES (1, 'Alice', 30, 150.5);
    ```

- **Insert data specifying column names:**
    ```sql
    INSERT INTO customers (name, age, weight) VALUES ('Bob', 25, 180.0);
    ```

## Querying Data

To retrieve information from your table, you can use various queries. If you want to see all the details of every customer, you simply select all columns. To narrow down the results, you can filter them based on specific conditions, such as retrieving customers older than 21. You can also choose to display only certain columns, such as just the names and ages of the customers. To organize the results, you might sort them by age in descending order. Additionally, you can use a special function to categorize customers into "adult" or "minor" based on their age.

- **Select all columns for all rows:**
    ```sql
    SELECT * FROM customers;
    ```

- **Select rows with a condition (e.g., age > 21):**
    ```sql
    SELECT * FROM customers WHERE age > 21;
    ```

- **Select specific columns (e.g., name and age):**
    ```sql
    SELECT name, age FROM customers;
    ```

- **Order results (e.g., by age in descending order):**
    ```sql
    SELECT * FROM customers ORDER BY age DESC;
    ```

- **Transform data with a CASE statement (e.g., categorize age):**
    ```sql
    SELECT name, 
        CASE 
            WHEN age > 18 THEN 'adult' 
            ELSE 'minor' 
        END AS type 
    FROM customers;
    ```

## Aggregating Data


If you need to perform calculations on your data, SQL provides aggregate functions. For instance, you can find the oldest age among your customers or count how many customers there are for each age group.

- **Find the maximum age:**
    ```sql
    SELECT MAX(age) FROM customers;
    ```

- **Count the number of customers for each age:**
    ```sql
    SELECT age, COUNT(*) 
    FROM customers 
    GROUP BY age;
    ```

## Joining Tables


When you have multiple tables and want to combine information from them, you use joins. For example, if you have another table called `orders` with items purchased by customers, you can join this table with the `customers` table to see which items each customer bought. An inner join will show only the customers who have matching orders, while a left outer join will display all customers and include any matching orders they have, even if there are no orders for some customers.

- **Left Outer Join (all records from `customers` and matching from `orders`):**
    ```sql
    SELECT customers.name, orders.item 
    FROM customers 
    LEFT OUTER JOIN orders ON customers.id = orders.customer_id;
    ```


- **Inner Join (only matching records):**
    ```sql
    SELECT customers.name, orders.item 
    FROM customers 
    JOIN orders ON customers.id = orders.customer_id;
    ```


## Updating and Deleting Data



Finally, you can modify or remove data as needed. If a customer’s age changes, you can update their record with the new age. If you need to delete a customer from the table, you can remove their entry by specifying their ID.


- **Delete:**
    ```sql
    DELETE FROM customers WHERE id = 1;
    ```


- **Update:**
    ```sql
    UPDATE customers SET age = 31 WHERE id = 1;
    ```


## Creating and Inserting Data into Exercise Logs, and Insert data without specifying the id column:



Create a table `exercise_logs` with columns for exercise type, minutes, calories, and heart rate:


```sql
CREATE TABLE exercise_logs
    (id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    minutes INTEGER, 
    calories INTEGER,
    heart_rate INTEGER);
```

Insert data into the exercise_logs table:
Insert data specifying column names:


```sql

INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 30, 100, 110);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("biking", 10, 30, 105);
INSERT INTO exercise_logs(type, minutes, calories, heart_rate) VALUES ("dancing", 15, 200, 120);
```


Notice that you didnt identify the id like in the other tables.
The AUTOINCREMENT keyword makes the id column automatically count up for each new record instead of manually specifying it.


## Using Operators



- **AND:filter based on multiple conditions**
- **OR: filter based on at least one of multiple conditions**
- **IN: filter based on a list of values**
- **NOT IN:exclude a list of values**
- **AND vs. OR: The AND operator has precedence over the OR operator.**


**AND:**
```sql
SELECT * FROM exercise_logs WHERE calories > 50 AND minutes < 30;
```

**OR:**
```sql
SELECT * FROM exercise_logs WHERE calories > 50 OR minutes < 30;
```

**IN:**
```sql
SELECT * FROM exercise_logs WHERE type IN ("biking", "hiking", "tree climbing", "rowing");
```

**NOT IN:**
```sql
SELECT * FROM exercise_logs WHERE type NOT IN ("biking", "hiking", "tree climbing", "rowing");
```

## Comparing Tables

Finding Types from drs_favorites in exercise_logs
To find what types from drs_favorites are in exercise_logs:


**This will respond dynamically if the drs_favorites list changes, unlike a static list.**
```sql
SELECT * FROM exercise_logs WHERE type IN (
SELECT type FROM drs_favorites);
```


**Unlike the previous code this code wont update and only filters biking and hiking**
```sql
SELECT type FROM drs_favorites;
        SELECT * FROM exercise_logs WHERE type IN ("biking", "hiking");
```
