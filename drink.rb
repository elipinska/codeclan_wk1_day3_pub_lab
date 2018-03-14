class Drink
  attr_reader :name, :price, :alcohol_level

  def initialize(input_name, input_price)
    @name = input_name
    @price = input_price
    alcohol_levels = {beer: 6, martini: 10, cider: 4, vodka: 15, wine: 8}
    @alcohol_level = alcohol_levels[@name]
  end

end
