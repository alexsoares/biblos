require 'test_helper'

class DicEncsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dic_encs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dic_enc" do
    assert_difference('DicEnc.count') do
      post :create, :dic_enc => { }
    end

    assert_redirected_to dic_enc_path(assigns(:dic_enc))
  end

  test "should show dic_enc" do
    get :show, :id => dic_encs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dic_encs(:one).to_param
    assert_response :success
  end

  test "should update dic_enc" do
    put :update, :id => dic_encs(:one).to_param, :dic_enc => { }
    assert_redirected_to dic_enc_path(assigns(:dic_enc))
  end

  test "should destroy dic_enc" do
    assert_difference('DicEnc.count', -1) do
      delete :destroy, :id => dic_encs(:one).to_param
    end

    assert_redirected_to dic_encs_path
  end
end
