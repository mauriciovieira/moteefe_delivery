module MoteefeDelivery
  class Planner
    def initialize(filename)
      puts "initialized with #{filename}"
    end

    def plan(options)
      puts "planning with #{options}"
    end

    def output
      puts "Outputs calculated plan"
    end
  end
end
