require('minitest/autorun')
require_relative('../food')

class FoodTest < MiniTest::Test
  def setup
    @food1 = Food.new(:kebab)
  end

  def test_food_has_name_price_and_rejuvenation_level
    assert_equal(:kebab, @food1.name)
    assert_equal(7, @food1.price)
    assert_equal(15, @food1.rejuvenation_level)
  end

end
