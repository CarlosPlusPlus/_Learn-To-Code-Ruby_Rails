require 'test_helper'

class ZoosControllerTest < ActionController::TestCase
  setup do
    @zoo = zoos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zoos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zoo" do
    assert_difference('Zoo.count') do
      post :create, zoo: { name: @zoo.name }
    end

    assert_redirected_to zoo_path(assigns(:zoo))
  end

  test "should show zoo" do
    get :show, id: @zoo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zoo
    assert_response :success
  end

  test "should update zoo" do
    put :update, id: @zoo, zoo: { name: @zoo.name }
    assert_redirected_to zoo_path(assigns(:zoo))
  end

  test "should destroy zoo" do
    assert_difference('Zoo.count', -1) do
      delete :destroy, id: @zoo
    end

    assert_redirected_to zoos_path
  end
end
