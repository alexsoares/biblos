require 'test_helper'

class PeriodicosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodico" do
    assert_difference('Periodico.count') do
      post :create, :periodico => { }
    end

    assert_redirected_to periodico_path(assigns(:periodico))
  end

  test "should show periodico" do
    get :show, :id => periodicos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => periodicos(:one).to_param
    assert_response :success
  end

  test "should update periodico" do
    put :update, :id => periodicos(:one).to_param, :periodico => { }
    assert_redirected_to periodico_path(assigns(:periodico))
  end

  test "should destroy periodico" do
    assert_difference('Periodico.count', -1) do
      delete :destroy, :id => periodicos(:one).to_param
    end

    assert_redirected_to periodicos_path
  end
end
