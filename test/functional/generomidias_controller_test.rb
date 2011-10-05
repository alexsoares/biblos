require 'test_helper'

class GeneromidiasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generomidias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generomidia" do
    assert_difference('Generomidia.count') do
      post :create, :generomidia => { }
    end

    assert_redirected_to generomidia_path(assigns(:generomidia))
  end

  test "should show generomidia" do
    get :show, :id => generomidias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => generomidias(:one).to_param
    assert_response :success
  end

  test "should update generomidia" do
    put :update, :id => generomidias(:one).to_param, :generomidia => { }
    assert_redirected_to generomidia_path(assigns(:generomidia))
  end

  test "should destroy generomidia" do
    assert_difference('Generomidia.count', -1) do
      delete :destroy, :id => generomidias(:one).to_param
    end

    assert_redirected_to generomidias_path
  end
end
