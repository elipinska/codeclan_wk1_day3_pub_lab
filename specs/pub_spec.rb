require('minitest/autorun')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')
require_relative('../food')

class PubTest < MiniTest::Test

  def setup
    @food = [Food.new(:chips), Food.new(:kebab), Food.new(:salad), Food.new(:pizza)]

    @drinks = [Drink.new(:beer), Drink.new(:martini), Drink.new(:cider), Drink.new(:vodka), Drink.new(:wine)]

    @pub1 = Pub.new("Hanging Bat", 100, @drinks, @food)
    @customer1 = Customer.new("Ewa", 30, 27)
  end

  def test_pub_has_name
    assert_equal("Hanging Bat", @pub1.name)
  end

  def test_pub_has_100_in_till
    assert_equal(100, @pub1.till)
  end

  def test_pub_has_5_drinks
    assert_equal(5, @pub1.drinks.length)
  end

  def test_pub_has_martini
    check_for_martini = ""
    for drink in @pub1.drinks
      if drink.name == :martini
      check_for_martini = "Martini in stock"
      end
    end
    assert_equal("Martini in stock", check_for_martini)
  end

  def test_receive_money
    assert_equal(110, @pub1.receive_money(10))
  end

  def test_find_drink_for_customer__success
    assert_equal(@drinks[1], @pub1.find_drink_for_customer(:martini, 22, 10))
  end

  def test_find_drink_for_customer__fail
    assert_equal("Drink unavailable", @pub1.find_drink_for_customer(:beer, 12, 70))
  end

  def test_find_food_for_customer__success
    assert_equal(@food[2], @pub1.find_food_for_customer(:salad))
  end

  def test_find_food_for_customer__fail
    assert_equal("Food unavailable", @pub1.find_food_for_customer(:noodles))
  end

  def test_stock
    food = [Food.new(:chips), Food.new(:kebab), Food.new(:salad), Food.new(:pizza)]

    drinks = [Drink.new(:beer), Drink.new(:martini), Drink.new(:cider), Drink.new(:vodka), Drink.new(:wine), Drink.new(:beer), Drink.new(:vodka), Drink.new(:vodka)]

    pub2 = Pub.new("Hanging Bat", 100, drinks, food)

    assert_equal(3, pub2.stock[:drinks][:vodka][:count])
  end

  def test_drinks_stock_value
    assert_equal(26, @pub1.drinks_stock_value)
  end

  def test_food_stock_value
    assert_equal(23, @pub1.foods_stock_value)
  end

  def test_drinks_stock_value__after_purchase
    @customer1.buy_a_drink(:wine, @pub1)
    assert_equal(20, @pub1.drinks_stock_value)
  end

  def test_food_stock_value__after_purchase
    @customer1.buy_food(:pizza, @pub1)
    assert_equal(15, @pub1.foods_stock_value)
  end
end
