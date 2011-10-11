require 'test_helper'

class IdentificacaosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identificacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create identificacao" do
    assert_difference('Identificacao.count') do
      post :create, :identificacao => { }
    end

    assert_redirected_to identificacao_path(assigns(:identificacao))
  end

  test "should show identificacao" do
    get :show, :id => identificacaos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => identificacaos(:one).to_param
    assert_response :success
  end

  test "should update identificacao" do
    put :update, :id => identificacaos(:one).to_param, :identificacao => { }
    assert_redirected_to identificacao_path(assigns(:identificacao))
  end

  test "should destroy identificacao" do
    assert_difference('Identificacao.count', -1) do
      delete :destroy, :id => identificacaos(:one).to_param
    end

    assert_redirected_to identificacaos_path
  end
end
