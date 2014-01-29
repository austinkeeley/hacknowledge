require 'test_helper'

class SwagsControllerTest < ActionController::TestCase
  setup do
    @swag = swags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:swags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create swag" do
    assert_difference('Swag.count') do
      post :create, swag: {  }
    end

    assert_redirected_to swag_path(assigns(:swag))
  end

  test "should show swag" do
    get :show, id: @swag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @swag
    assert_response :success
  end

  test "should update swag" do
    patch :update, id: @swag, swag: {  }
    assert_redirected_to swag_path(assigns(:swag))
  end

  test "should destroy swag" do
    assert_difference('Swag.count', -1) do
      delete :destroy, id: @swag
    end

    assert_redirected_to swags_path
  end
end
