class Food
  attr_reader :name, :price, :rejuvenation_level

  def initialize(input_name)
    @name = input_name
    foods_info = {chips: {price: 3, rejuvenation_level:10}, kebab: {price: 7, rejuvenation_level: 15}, salad: {price: 5, rejuvenation_level: 5}, pizza: {price: 8, rejuvenation_level: 12}}
    @price = foods_info[@name][:price]
    @rejuvenation_level = foods_info[@name][:rejuvenation_level]
  end
end
