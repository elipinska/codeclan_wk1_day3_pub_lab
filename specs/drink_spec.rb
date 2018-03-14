require('minitest/autorun')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup
    @drink1 = Drink.new(:wine)
  end

  def test_drink_has_name
    assert_equal(:wine, @drink1.name)
  end

  def test_drink_has_price
    assert_equal(6, @drink1.price)
  end

  def test_drink_has_alcohol_level
    assert_equal(8, @drink1.alcohol_level)
  end

end
