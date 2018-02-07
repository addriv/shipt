class ToCSV
  def self.to_csv(list, column_names)
    CSV.generate do |csv|
      csv << column_names
      list.each do |list_item|
        csv << [
          list_item['date_start'],
          list_item['product_id'],
          list_item['name'],
          list_item['quantity_sold']
        ]
    end
  end
end