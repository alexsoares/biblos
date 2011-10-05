require 'test_helper'

class AssuntosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assuntos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assunto" do
    assert_difference('Assunto.count') do
      post :create, :assunto => { }
    end

    assert_redirected_to assunto_path(assigns(:assunto))
  end

  test "should show assunto" do
    get :show, :id => assuntos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => assuntos(:one).to_param
    assert_response :success
  end

  test "should update assunto" do
    put :update, :id => assuntos(:one).to_param, :assunto => { }
    assert_redirected_to assunto_path(assigns(:assunto))
  end

  test "should destroy assunto" do
    assert_difference('Assunto.count', -1) do
      delete :destroy, :id => assuntos(:one).to_param
    end

    assert_redirected_to assuntos_path
  end
end
