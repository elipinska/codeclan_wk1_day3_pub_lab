class Drink
  attr_reader :name, :price, :alcohol_level

  def initialize(input_name)
    @name = input_name
    drinks_info = {beer: {alcohol_level: 6, price: 5}, martini: {alcohol_level: 10, price: 8}, cider: {alcohol_level: 4, price: 4}, vodka: {alcohol_level: 15, price: 3}, wine: {alcohol_level: 8, price: 6}}
    @price = drinks_info[@name][:price]
    @alcohol_level = drinks_info[@name][:alcohol_level] 
  end

end
