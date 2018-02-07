## Implementation

This project was implemented using Ruby on Rails and PostgreSQL. 
To setup locally, run `bundle install` and `rails db:setup`.
Start the rails server using command `rails server`


1. A product belongs to many categories. A category has many products. A product can be sold in decimal amounts (such as weights).

### `products`
| column name       | data type | details                            |
|:------------------|:---------:|:-----------------------------------|
| `id`              | integer   | not null, primary key              |
| `name`            | string    | not null                           |

### `categories`
| column name       | data type | details                            |
|:------------------|:---------:|:-----------------------------------|
| `id`              | integer   | not null, primary key              |
| `name`            | string    | not null                           |

### `product_categories`
| column name       | data type | details                            |
|:------------------|:---------:|:-----------------------------------|
| `id`              | integer   | not null, primary key              |
| `product_id`      | integer   | not null, foreign key              |
| `category_id`     | integer   | not null, foreign key              |

+ `product_id` references `products`
+ `category_id` references `categories`
+ index on `[:product_id, :category_id], unique: true`

2. A customer can have many orders. An order is comprised of many products. An order has a status stating if the order is waiting for delivery, on its way, or delivered.

### `customers`
| column name       | data type | details                            |
|:------------------|:---------:|:-----------------------------------|
| `id`              | integer   | not null, primary key              |  
| `first_name`      | string    | not null                           |
| `last_name`       | string    | not null                           |

### `orders`
| column name       | data type | details                            |
|:------------------|:---------:|:-----------------------------------|
| `id`              | integer   | not null, primary key              |
| `customer_id`     | integer   | not null, indexed, foreign key     |
| `status`          | string    | not null                           |

+ `customer_id` references `customers`
+ index on `:customer_id`

### `order_products`
| column name       | data type | details                            |
|:------------------|:---------:|:-----------------------------------|
| `id`              | integer   | not null, primary key              |
| `order_id`        | integer   | not null, indexed, foreign key     |
| `product_id`      | integer   | not null, indexed, foreign key     |
| `quantity`        | decimal   | not null                           |

+ `customer_id` references `customers`
+ `product_id` references `products`
+ index on `[:order_id, :product_id], unique: true`

3. Write a SQL query to return the results as display below:

Example

customer_id customer_first_name category_id category_name number_purchased

1 John 1 Bouquets 15

4. Include the previous result as part of a function in the application. If you are using an ORM, please write the query in your ORM's DSL. Leave the original SQL in a separate file.

* SQL Query: **app/services/orders_sql.rb**
* I've created an API endpoint to retreive query results. Endpoint: **/orders/customer_category_purchases**


5. An API endpoint that accepts a date range and a day, week, or month and returns a breakdown of products sold by quantity per day/week/month.

* SQL Query: **app/services/products_sql.rb**
* Endpoint: **/products/sold_by_date_range**
* Parameters: 
  * start_date: Ex. 2018-02-07
  * end_date: Ex. 2018-02-08
  * interval: day/week/month

6. Ability to export the results of #5 to CSV.

* Endpoint:  **/products/sold_by_date_range.csv**

7. An API endpoint that returns the orders for a customer.

* Endpoint: **/customers/:customer_id**

Additional questions

No coding necessary, explain the concept or sketch your thoughts.

We want to give customers the ability to create lists of products for a one-click ordering of bulk items. How would you design the tables, what are the pros and cons of your approach?

* Design: The tables would be setup simlar to the tables created for this project. There will be an order_lists table which will have a customer_id foreign key. The other table will be the order_list_items which will include a order_list_id and product_id foreign keys. 

* Pros: Allows for Active Record associations making access to data simpler in code.
* Cons: The order_list_items will have many records, a row for each product in an order_list. Transactions will need to be setup so that all tables will be updated accordingly. For example, if an order_list is created but an exception is raised when creating order_list_items, the transaction will need to rollbaack the updates to order_list.

If Shipt knew the exact inventory of stores, and when facing a high traffic and limited supply of a particular item, how do you distribute the inventory among customers checking out?

* Create a queue with a first in, first out system. Inventory count will be decremented when customer completes checking out with their items.