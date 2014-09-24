require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "that status required contect" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "that's status contect should have 2 letters" do
    status= Status.new
    status.content= "H"
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test "thats a status has a user_id " do 
  	status = Status.new
  	status.content = "Hello"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end
end
