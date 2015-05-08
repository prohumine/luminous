require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  def setup
  	@customer = Customer.new(name: 'example', email: 'ex@ex.com', 
  		                       phone: '8014981832', address: '321 fake str. nowher, UT 12345')
  end

  test "customer should be valid" do
  	assert @customer.valid? 
  end

  test "customer name should be present" do
  	@customer.name = ''
  	assert_not @customer.valid?
  end

  test "customer name should not be too long" do
  	@customer.name = 'a' * 256
  	assert_not @customer.valid?
  end

  test "phone should be present" do
  	@customer.phone = ""
  	assert_not @customer.valid?
  end

  test "address should be present" do
  	@customer.address = ''
  	assert_not @customer.valid?
  end

  test "email should be present" do
    @customer.email = " "
    assert_not @customer.valid?
  end

  test "email should not be too long" do
  	@customer.email = 'a' * 256
  	assert_not @customer.valid?
  end

  test "email should be unique" do
  	dup_user = @customer.dup
  	dup_user.email.upcase
  	@customer.save
  	assert_not dup_user.valid?
  end

  test "email should save in lowercase" do
    mixed_case = 'FoOeXample@example.com'
    @customer.email = mixed_case
    @customer.save
    assert_equal mixed_case.downcase, @customer.reload.email
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @customer.email = valid_address
      assert @customer.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @customer.email = invalid_address
      assert_not @customer.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
