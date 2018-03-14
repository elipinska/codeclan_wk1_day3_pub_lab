class Customer
  attr_reader :name, :wallet, :age, :drunkenness

    def initialize(input_name, input_wallet, input_age)
      @name = input_name
      @wallet = input_wallet
      @age = input_age
      @drunkenness = 0
    end


    def buy_a_drink(drink_type, pub)
        drink_served = pub.find_drink_for_customer(drink_type, @age, @drunkenness)
        return if drink_served == nil
        if @wallet >= drink_served.price
          @wallet -= drink_served.price
          pub.receive_money(drink_served.price)
          pub.drinks.delete(drink_served)
          @drunkenness += drink_served.alcohol_level
      end
    end

    def buy_food(food_type, pub)
      food_served = pub.find_food_for_customer(food_type)
      if @wallet >= food_served.price
        pub.foods.delete(food_served)
        @wallet -= food_served.price
        pub.receive_money(food_served.price)
        @drunkenness -= food_served.rejuvenation_level
      end
    end


end
