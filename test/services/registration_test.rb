require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase

  test "register should save success with valid attributes" do
    registration = Registration.new(business_name: 'Foo Bar', email: 'foo@bar.com', password: '123123')
    assert registration.save
  end

  test "register should not save with invalid attributes" do
    registration = Registration.new(business_name: '', email: '', password: '')
    assert_not registration.save
  end

  test "register should not save if user failed to create" do
    registration = Registration.new(business_name: 'Foo Bar', email: 'foo@bar.com', password: '123123')
    registration.user.stubs(:save!).raises(Exception)
    assert_not registration.save
  end

  test "register should not save if tenant failed to create" do
    registration = Registration.new(business_name: 'Foo Bar', email: 'foo@bar.com', password: '123123')
    registration.tenant.stubs(:save!).raises(Exception)
    assert_not registration.save
  end

end
