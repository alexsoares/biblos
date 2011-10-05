require 'test_helper'

class EditorasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editoras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editora" do
    assert_difference('Editora.count') do
      post :create, :editora => { }
    end

    assert_redirected_to editora_path(assigns(:editora))
  end

  test "should show editora" do
    get :show, :id => editoras(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => editoras(:one).to_param
    assert_response :success
  end

  test "should update editora" do
    put :update, :id => editoras(:one).to_param, :editora => { }
    assert_redirected_to editora_path(assigns(:editora))
  end

  test "should destroy editora" do
    assert_difference('Editora.count', -1) do
      delete :destroy, :id => editoras(:one).to_param
    end

    assert_redirected_to editoras_path
  end
end
