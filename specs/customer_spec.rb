require('minitest/autorun')
require_relative('../customer')
require_relative('../drink')
require_relative('../pub')
require_relative('../food')

class CustomerTest < MiniTest::Test

  def setup
    @customer1 = Customer.new("Ewa", 30, 27)
    @customer2 = Customer.new("Ben", 2, 35)
    @customer3 = Customer.new("Anna", 15, 16)

    @food = [Food.new(:chips), Food.new(:kebab), Food.new(:salad), Food.new(:pizza)]

    drinks = [Drink.new(:beer), Drink.new(:martini), Drink.new(:cider), Drink.new(:vodka), Drink.new(:wine)]

    @pub1 = Pub.new("Hanging Bat", 100, drinks, @food)
  end

  def test_customer_has_name
    assert_equal("Ewa", @customer1.name)
  end

  def test_customer_has_wallet
    assert_equal(30, @customer1.wallet)
  end

  def test_customer_has_age
    assert_equal(27, @customer1.age)
  end

  def test_customer_buy_a_drink
    @customer1.buy_a_drink(:martini, @pub1)
    assert_equal(22, @customer1.wallet)
    assert_equal(108, @pub1.till)
    assert_equal(4, @pub1.drinks.length)
  end

  def test_customer_buy_a_drink__not_enough_cash
    @customer2.buy_a_drink(:cider, @pub1)
    assert_equal(2, @customer2.wallet)
    assert_equal(100, @pub1.till)
    assert_equal(5, @pub1.drinks.length)
  end

  def test_customer_buy_a_drink__under_age
    @customer3.buy_a_drink(:cider, @pub1)
    assert_equal(15, @customer3.wallet)
    assert_equal(100, @pub1.till)
    assert_equal(5, @pub1.drinks.length)
  end

  def test_customer_buy_a_drink__drunkenness_20
    @customer1.buy_a_drink(:martini, @pub1)
    @customer1.buy_a_drink(:beer, @pub1)
    @customer1.buy_a_drink(:cider, @pub1)
    assert_equal(20, @customer1.drunkenness)
  end

  def test_customer_buy_a_drink__too_drunk
    drinks = [Drink.new(:vodka), Drink.new(:vodka), Drink.new(:vodka), Drink.new(:beer), Drink.new(:martini), Drink.new(:cider), Drink.new(:vodka)]

    @pub2 = Pub.new("Brass Monkey", 80, drinks, @food)
    @customer1.buy_a_drink(:vodka, @pub2)
    @customer1.buy_a_drink(:vodka, @pub2)
    @customer1.buy_a_drink(:vodka, @pub2)
    @customer1.buy_a_drink(:martini, @pub2)
    assert_equal(45, @customer1.drunkenness)
    assert_equal(21, @customer1.wallet)
    check_for_martini = ""
    for drink in @pub2.drinks
      if drink.name == :martini
      check_for_martini = "Martini in stock"
      end
    end
    assert_equal("Martini in stock", check_for_martini)
  end

  def test_buy_food_and_drink
    @customer1.buy_a_drink(:vodka, @pub1)
    @customer1.buy_a_drink(:martini, @pub1)
    @customer1.buy_food(:kebab, @pub1)

    assert_equal(12, @customer1.wallet)
    assert_equal(118, @pub1.till)
    assert_equal(10, @customer1.drunkenness)
    assert_equal(3, @pub1.drinks.count)
    assert_equal(3, @pub1.foods.count)
  end

  def test_buy_food__not_in_stock
    @customer1.buy_food(:cheeseboard, @pub1)
    assert_equal(30, @customer1.wallet)
    assert_equal(0, @customer1.drunkenness)
  end

  def test_buy_food__insufficient_funds
    @customer2.buy_food(:kebab, @pub1)
    assert_equal(2, @customer2.wallet)
    assert_equal(0, @customer2.drunkenness)
  end

end
