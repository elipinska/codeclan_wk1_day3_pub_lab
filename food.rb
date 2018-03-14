class Food
  attr_reader :name, :price, :rejuvenation_level

  def initialize(input_name, input_price)
    @name = input_name
    @price = input_price
    rejuvenation_levels = {chips: 10, kebab: 15, salad: 5, pizza: 12}
    @rejuvenation_level = rejuvenation_levels[@name]
  end
end
