require 'test_helper'

class MapasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mapas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mapa" do
    assert_difference('Mapa.count') do
      post :create, :mapa => { }
    end

    assert_redirected_to mapa_path(assigns(:mapa))
  end

  test "should show mapa" do
    get :show, :id => mapas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mapas(:one).to_param
    assert_response :success
  end

  test "should update mapa" do
    put :update, :id => mapas(:one).to_param, :mapa => { }
    assert_redirected_to mapa_path(assigns(:mapa))
  end

  test "should destroy mapa" do
    assert_difference('Mapa.count', -1) do
      delete :destroy, :id => mapas(:one).to_param
    end

    assert_redirected_to mapas_path
  end
end
