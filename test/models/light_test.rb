require 'test_helper'

class LightTest < ActiveSupport::TestCase

  def setup
  	@light = Light.new(amount: 100, light_type: 'C7', colors: 'White and Red',
  	                   amount_replaced: 1, our_stringer: true, comments: "Start from bottom right")
  end

  test "Light should be valid" do
  	assert @light.valid?
  end

  test "amount should be a number" do
  	@light.amount = 'abcd'
  	assert_not @light.valid?
  end

  test "light_type should be present" do
  	@light.light_type = ''
  	assert_not @light.valid?
  end

  test "colors should be present" do
  	@light.colors = ''
  	assert_not @light.valid?
  end

  test "amount_replaced should between 0-100" do
  	@light.amount_replaced = ''
  	assert_not @light.valid?
  end

  test "our_stringer should be boolean" do
  	@light.our_stringer == true || false
  	assert @light.valid?
  end

  test "light_type can't be too long" do
  	@light.light_type = 'a' * 256
  	assert_not @light.valid?
  end

  test "colors can't be too long" do
  	@light.colors = 'a' * 256
  	assert_not @light.valid?
  end
end
