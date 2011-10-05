require 'test_helper'

class AudiovisuaisControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audiovisuais)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audiovisuai" do
    assert_difference('Audiovisuai.count') do
      post :create, :audiovisuai => { }
    end

    assert_redirected_to audiovisuai_path(assigns(:audiovisuai))
  end

  test "should show audiovisuai" do
    get :show, :id => audiovisuais(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => audiovisuais(:one).to_param
    assert_response :success
  end

  test "should update audiovisuai" do
    put :update, :id => audiovisuais(:one).to_param, :audiovisuai => { }
    assert_redirected_to audiovisuai_path(assigns(:audiovisuai))
  end

  test "should destroy audiovisuai" do
    assert_difference('Audiovisuai.count', -1) do
      delete :destroy, :id => audiovisuais(:one).to_param
    end

    assert_redirected_to audiovisuais_path
  end
end
