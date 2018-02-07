class ProductsSQL
  def self.sold_by_date_range(start_date, end_date, interval)
    "
      SELECT 
        DATE(DATE_TRUNC('#{interval}', op.created_at)) AS date_start,
        op.product_id,
        p.name,
        SUM(op.quantity) AS quantity_sold
      FROM
        order_products op
      INNER JOIN
        products p
      ON 
        p.id = op.product_id
      GROUP BY
        DATE(DATE_TRUNC('#{interval}', op.created_at)),
        op.product_id,
        p.name
    " 
  end
end