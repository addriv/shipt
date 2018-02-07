## Schema

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