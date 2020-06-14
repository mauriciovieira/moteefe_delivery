# MoteefeDelivery

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/moteefe_delivery`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'moteefe_delivery'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install moteefe_delivery

## Usage

Basic usage is

`moteefe_delivery plan_delivery "filename.csv" --region="eu" --items="sku1 sku2 sku3"`

All parameters are required

## Development

After checking out the repo, run `bin/setup` to install dependencies.

1. Then, run `rake spec` to run the tests.
2. Run `rake standard` to check Ruby Standard Style
3. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/moteefe_delivery.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Coding Challenge

We have various products e.g shirts, hoodies, mugs, cushions etc. Our suppliers are spread around the world, therefore the delivery of products depends on the region where they are shipped.

Your task is to implement a solution which gives us a number of days for delivery and the amounts of shipments
and their details based on list of items in the basket and the region where those items are supposed to be delivered.
There might be more shipments as not all suppliers provide all products.

Please, consider that this solution must receive parameters such as shipping region and items which are supposed to be ordered.

Use this pattern as "database" for your project, it's in a csv format.

```
product_name,supplier,delivery_times,in_stock
black_mug,Shirts4U,'{ "eu": 1, "us": 6, "uk": 2}',3
blue_t-shirt,Best Tshirts,'{ "eu": 1, "us": 5, "uk": 2}',10
white_mug,Shirts Unlimited,'{ "eu": 1, "us": 8, "uk": 2}',3
black_mug,Shirts Unlimited,'{ "eu": 1, "us": 7, "uk": 2}',4
pink_t-shirt,Shirts4U,'{ "eu": 1, "us": 6, "uk": 2}',8
pink_t-shirt,Best Tshirts,'{ "eu": 1, "us": 3, "uk": 2}',2
```

The outcome should be an object which should look like this:

```
{
    delivery_date: '2020-03-10',
    shipments: [
        {
            suplier: "Shirts4U",
            delivery_date: '2020-03-09'
            items: [
                {
                    title: "tshirt",
                    count: 10
                },
                {
                    title: "hoodie",
                    count: 5
                },
            ]
        },
        {
            suplier: "BesT-Shirts",
            delivery_date: '2020-03-10'
            items: [
                {
                    title: "mug",
                    count: 2
                }
            ]
        }
    ]
}
```

Where

- `delivery_date` is date of delivery relative to current date (if today date is 2020-02-01 and days for delivery is 2, then `delivery_date` is 2020-02-03)
- `shipments` is list of items that will be shipped by suppliers base on the availability in stock. Each shipment should contain name of the `supplier`,
- `delivery_date` relative to the current date and list of items with their `title` and `count`.

## Acceptance criteria

The following are the rules upon which our system works.

The number of delivery days is the **biggest** number of delivery days from all items in basket

**Scenario 1**

Having a list of items containing product A with deliver time 3 days and product B with delivery time 1 day

Then the deliver time is 3

**Scenario 2**

Having a product A from two suppliers A and B.

When supplier A deliver in product A in 3 days and supplier B deliver product A in 2 days

Then delivery time for that product is 2 days

**Scenario 3**

Having a t-shirt and hoodie in the basket

When t-shirt can be shipped from supplier A and B

And hoodie can be shipped from supplier B na C

Then deliver the t-shirt and hoodie from supplier B

edge case: It's faster to deliver it separately

**Scenario 4**

Having a 10 T-shirt in the basket and two suppliers A and B

When there is only 6 T-shirts from supplier A and 7 T-shirts of supplier B on stock

Then there would be a two shipments one from supplier A with 6 T-shirts and second from supplier B

edge case: split it into 3


Use all your coding skills and practices to provide readable, object oriented and reusable solution.
ps: don't forget the tests!

Happy hacking :-)
