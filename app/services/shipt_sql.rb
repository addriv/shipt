class ShiptSQL
  def customer_category_purchases
    "
      SELECT
        cs.id AS customer_id,
        cs.first_name AS customer_first_name,
        ct.category_id,
        ct.name AS category_name,
        SUM(op.order_count) AS number_purchased
      FROM
        customers cs
      INNER JOIN
        orders o
      ON 
        cs.id = o.customer_id
      INNER JOIN
        order_products op
      ON 
        o.id = op.order_id
      INNER JOIN
        product_categories pc
      ON 
        op.product_id = pc.product_id
      INNER JOIN
        categories ct
      ON 
        pc.category_id = ct.id
      GROUP BY
        cs.id, cs.first_name, ct.category_id, ct.name
    "
  end
end