class Pub
  attr_reader :name, :till, :drinks, :foods, :stock

  def initialize(input_name, input_till, input_drinks, input_foods)
    @name = input_name
    @till = input_till
    @drinks = input_drinks
    @foods = input_foods
    @drink_types = [:beer, :wine, :cider, :vodka, :martini]
    @food_types = [:kebab, :chips, :salad, :pizza]
    @stock = {drinks: {}, food: {}}

    @drink_types.each {|dt| @stock[:drinks][dt] = {count: 0, price: 0}}

     for drink in @drinks
       @stock[:drinks][drink.name][:count] += 1
       @stock[:drinks][drink.name][:price] = drink.price
     end

    @food_types.each {|ft| @stock[:food][ft] = {count: 0, price: 0}}

    for food in @foods
      @stock[:food][food.name][:count] += 1
      @stock[:food][food.name][:price] = food.price
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
      sum += @stock[:drinks][dt][:price] * @stock[:drinks][dt][:count]
    end
    return sum
  end

  def foods_stock_value()
    sum =   0
    @food_types.each do |ft|
      sum += @stock[:food][ft][:price] * @stock[:food][ft][:count]
    end
    return sum
  end
end
