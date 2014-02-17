require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "A user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  test "A user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  test "A user should enter an e-mail address" do
    user = User.new
    assert !user.save
    assert !user.errors[:email].empty?
  end

end
