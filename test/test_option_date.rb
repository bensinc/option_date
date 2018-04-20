require 'minitest/autorun'
require 'option_date'

class OptionDateTest < Minitest::Test
  def test_full_date
    assert_equal "April 20, 2018", OptionDate.new("2018-04-20").formatted[:formatted]
  end

  def test_no_day
    assert_equal "April, 2018", OptionDate.new("2018-04").formatted[:formatted]
  end

  def test_no_month_or_day
    assert_equal "2018", OptionDate.new("2018").formatted[:formatted]
  end

  def test_bad_date
    assert_equal "2000", OptionDate.new("sdffdsfsdsfdf").formatted[:formatted]
  end

end
