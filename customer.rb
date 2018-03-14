class Customer
  attr_reader :name, :wallet, :age, :drunkenness

    def initialize(input_name, input_wallet, input_age)
      @name = input_name
      @wallet = input_wallet
      @age = input_age
      @drunkenness = 0
    end

    def old_enough?()
      @age >= 18
    end

    def sober_enough?()
      @drunkenness <= 40
    end

    def buy_a_drink(drink_type, pub)
      if old_enough?() && sober_enough?
        drink_served = pub.find_drink_for_customer(drink_type)
        if @wallet >= drink_served.price
          pub.drinks.delete(drink_served)
          @wallet -= drink_served.price
          pub.receive_money(drink_served.price)
          @drunkenness += drink_served.alcohol_level
        else
          puts "Sorry, I don't have enough cash"
        end
      end
    end

    # def buy_a_drink(drink_type, pub)
    #     drink_served = pub.find_drink_for_customer(drink_type)
    #     @wallet -= drink_served.price
    #     @drunkenness += drink_served.alcohol_level
    # end

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
