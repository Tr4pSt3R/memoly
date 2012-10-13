require 'test_helper'

class MemoidsControllerTest < ActionController::TestCase
  setup do
    @memoid = memoids(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memoids)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memoid" do
    assert_difference('Memoid.count') do
      post :create, memoid: { ISBN: @memoid.ISBN, author: @memoid.author, expires_on: @memoid.expires_on, note: @memoid.note, page: @memoid.page, rating: @memoid.rating, title: @memoid.title }
    end

    assert_redirected_to memoid_path(assigns(:memoid))
  end

  test "should show memoid" do
    get :show, id: @memoid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memoid
    assert_response :success
  end

  test "should update memoid" do
    put :update, id: @memoid, memoid: { ISBN: @memoid.ISBN, author: @memoid.author, expires_on: @memoid.expires_on, note: @memoid.note, page: @memoid.page, rating: @memoid.rating, title: @memoid.title }
    assert_redirected_to memoid_path(assigns(:memoid))
  end

  test "should destroy memoid" do
    assert_difference('Memoid.count', -1) do
      delete :destroy, id: @memoid
    end

    assert_redirected_to memoids_path
  end
end
