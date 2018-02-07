require 'csv'

class ToCSV
  def self.to_csv(list, column_names)
    CSV.generate do |csv|
      csv << column_names
      list.each do |list_item|
        csv << list_item.values_at(*column_names)
      end
    end
  end
end