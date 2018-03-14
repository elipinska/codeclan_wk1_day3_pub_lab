class Pub
  attr_reader :name, :till, :drinks, :foods

  def initialize(input_name, input_till, input_drinks, input_foods)
    @name = input_name
    @till = input_till
    @drinks = input_drinks
    @foods = input_foods
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
end
