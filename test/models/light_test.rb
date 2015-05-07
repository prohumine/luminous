require 'test_helper'

class LightTest < ActiveSupport::TestCase

  def setup
  	@light = Light.new(amount: 100, type: 'C7', colors: 'White and Red', amount_replaced: 1, our_stringer: true, comments: "Start from bottom right")
  end

  test "Light should be valid" do
  	assert @light.valid?
  end
end
