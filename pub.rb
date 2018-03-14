class Pub
  attr_reader :name, :till, :drinks, :foods, :drinks_stock

  def initialize(input_name, input_till, input_drinks, input_foods)
    @name = input_name
    @till = input_till
    @drinks = input_drinks
    @foods = input_foods
    @drink_types = [:beer, :wine, :cider, :vodka, :martini]
    @drinks_stock = {}

    @drink_types.each {|dt| @drinks_stock[dt] = {count: 0, price: 0}}

     for drink in @drinks
       @drinks_stock[drink.name][:count] += 1
       @drinks_stock[drink.name][:price] = drink.price
     end
  end


  def receive_money(amount)
    @till += amount
  end

  def find_drink_for_customer(drink_type, age, drunkenness)
    if age >= 18 && drunkenness <= 40
      for drink in @drinks
        return drink if drink.name == drink_type
      end
    end
    return "Drink unavailable"
  end

  def find_food_for_customer(food_type)
    for food in @foods
      return food if food.name == food_type
    end
    return "Food unavailable"
  end

  def drinks_stock_value()
    sum =   0
    @drink_types.each do |dt|
      sum += @drinks_stock[dt][:price] * @drinks_stock[dt][:count]
    end
    return sum
  end
end
