require 'test_helper'

class TiposmapasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiposmapas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiposmapa" do
    assert_difference('Tiposmapa.count') do
      post :create, :tiposmapa => { }
    end

    assert_redirected_to tiposmapa_path(assigns(:tiposmapa))
  end

  test "should show tiposmapa" do
    get :show, :id => tiposmapas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tiposmapas(:one).to_param
    assert_response :success
  end

  test "should update tiposmapa" do
    put :update, :id => tiposmapas(:one).to_param, :tiposmapa => { }
    assert_redirected_to tiposmapa_path(assigns(:tiposmapa))
  end

  test "should destroy tiposmapa" do
    assert_difference('Tiposmapa.count', -1) do
      delete :destroy, :id => tiposmapas(:one).to_param
    end

    assert_redirected_to tiposmapas_path
  end
end
