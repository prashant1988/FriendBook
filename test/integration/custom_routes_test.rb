require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
	test "that /login routes opens the login page"  do
	  get '/login'
	  assert_response :success 
	end
	test " that /logout routes open the logout page" do
	  get "/logout"
	  assert_response :redirect
	  assert_redirected_to '/' 
	end
	test " that /register routes open the sign up  page" do
	  get "/register"
	  assert_response :success
	end
	test " that a profile page works " do
	  get "/bobjasos"
	  assert_response :success 
	end
end
