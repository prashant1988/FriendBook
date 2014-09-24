require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a users should enter there first name" do
    user=User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  test "a users should enter there last name" do
    user=User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  test "a users should enter there profile name" do
    user=User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  test "a user should have unique profile name" do 
    user=User.new
    user.profile_name=users(:a).profile_name
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  test "a user profile name should be without sapce" do 
     user =User.new(first_name:'a',last_name: 'm',email:'a@gmail.com')
     user.password = user.password_confirmation = 'qweqweqwewq'
     user.profile_name="My name with sapce"
     assert !user.save
     assert !user.errors[:profile_name].empty?
     assert user.errors[:profile_name].include?("Must be correct format")
  end 

  test "user profile name should be in correct format" do 
   user =User.new(first_name:'a',last_name: 'm',email:'a@gmail.com')
   user.password = user.password_confirmation = 'qweqweqwewq'

   user.profile_name = "am_1"
   assert !user.valid?
  end
end
