require 'test_helper'

class AssuntoitensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assuntoitens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assuntoiten" do
    assert_difference('Assuntoiten.count') do
      post :create, :assuntoiten => { }
    end

    assert_redirected_to assuntoiten_path(assigns(:assuntoiten))
  end

  test "should show assuntoiten" do
    get :show, :id => assuntoitens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => assuntoitens(:one).to_param
    assert_response :success
  end

  test "should update assuntoiten" do
    put :update, :id => assuntoitens(:one).to_param, :assuntoiten => { }
    assert_redirected_to assuntoiten_path(assigns(:assuntoiten))
  end

  test "should destroy assuntoiten" do
    assert_difference('Assuntoiten.count', -1) do
      delete :destroy, :id => assuntoitens(:one).to_param
    end

    assert_redirected_to assuntoitens_path
  end
end
