class ShiptSQL
  def self.customer_category_purchases
    # customer_id customer_first_name category_id category_name number_purchased
    "
      SELECT
        cs.id AS customer_id,
        cs.first_name AS customer_first_name,
        ct.id AS category_id,
        ct.name AS category_name,
        SUM(op.quantity) AS number_purchased
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
        cs.id, cs.first_name, ct.id, ct.name
    "
  end
end