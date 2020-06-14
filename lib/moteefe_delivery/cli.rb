require "thor"

module MoteefeDelivery
  class Cli < Thor
    def self.exit_on_failure?
      true
    end

    desc "plan_delivery FILENAME", "Loads a csv database and queries by region and items"
    method_option :region, type: :string, aliases: "-r", default: "eu", required: true, desc: "Desired region, eg. eu, us, uk"
    method_option :items, type: :array, aliases: "-i", required: true, desc: "List of items"
    def plan_delivery(filename)
      region = options[:region]
      items = options[:items]

      puts "You supplied the file: #{filename}, and desired region: #{region}, with items #{items}"
    end
  end
end
