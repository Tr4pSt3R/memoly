require 'test_helper'

class AlphaUsersControllerTest < ActionController::TestCase
  setup do
    @alpha_user = alpha_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alpha_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alpha_user" do
    assert_difference('AlphaUser.count') do
      post :create, alpha_user: { email: @alpha_user.email }
    end

    assert_redirected_to alpha_user_path(assigns(:alpha_user))
  end

  test "should show alpha_user" do
    get :show, id: @alpha_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alpha_user
    assert_response :success
  end

  test "should update alpha_user" do
    put :update, id: @alpha_user, alpha_user: { email: @alpha_user.email }
    assert_redirected_to alpha_user_path(assigns(:alpha_user))
  end

  test "should destroy alpha_user" do
    assert_difference('AlphaUser.count', -1) do
      delete :destroy, id: @alpha_user
    end

    assert_redirected_to alpha_users_path
  end
end
