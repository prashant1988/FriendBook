require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should be redirected if not login" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path 
  end
  test " should a new page when user logged in" do
    sign_in users(:a) 
    get :new
    assert_response :success
  end

  test "should be logged in for post a status" do 
    post :create, status: { content: "Hello"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end  
  test "should create status when user logged in" do
    sign_in users(:a)
    assert_difference('Status.count') do
      post :create, status: { content: @status.content }
    end

    assert_redirected_to status_path(assigns(:status))
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should  edit status is redirected when user not logged in " do
    get :edit, id: @status
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end


  test "should get edit when logged in " do
    sign_in users(:a)
    get :edit, id: @status
    assert_response :success
  end
  
  test "should not be update status when not logged in " do
    put :update, id: @status, status: { content: @status.content}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update status when logged in " do
    sign_in users(:a)
    put :update, id: @status, status: { content: @status.content}
    assert_redirected_to status_path(assigns(:status))
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_redirected_to statuses_path
  end
end
