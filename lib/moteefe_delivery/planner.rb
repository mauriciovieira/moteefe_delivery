require "csv"

module MoteefeDelivery
  class Planner
    attr_reader :database, :csv_table

    def initialize(filename)
      @csv_table = CSV.read(filename, headers: true)
      @database = process_csv
    end

    def plan(options)
      puts "planning with #{options}"
    end

    def output
      puts "Outputs calculated plan"
    end

    private

    def process_csv
      database = {}
      @csv_table.each do |row|
        product_name, supplier, delivery_times, in_stock = row.values_at("product_name", "supplier", "delivery_times", "in_stock")
        database[product_name] ||= {}
        database[product_name][supplier] = {
            "delivery_times": eval(delivery_times),
            "in_stock": in_stock.to_i
          }
      end
      database
    end
  end
end
