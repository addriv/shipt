class ShiptSQL
  
end

def top_gun_cast
  MovieDatabase.execute(<<-SQL)
    SELECT
      name
    FROM
      actors a
    INNER JOIN
      castings c
    ON
      c.actor_id = a.id
    INNER JOIN
      movies b
    ON
      b.id = c.movie_id
    WHERE
      b.title = 'Top Gun'
    ORDER BY
      name
  SQL
end

# customer_id customer_first_name category_id category_name number_purchased
