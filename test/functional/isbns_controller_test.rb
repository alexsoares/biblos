require 'test_helper'

class IsbnsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:isbns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create isbn" do
    assert_difference('Isbn.count') do
      post :create, :isbn => { }
    end

    assert_redirected_to isbn_path(assigns(:isbn))
  end

  test "should show isbn" do
    get :show, :id => isbns(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => isbns(:one).to_param
    assert_response :success
  end

  test "should update isbn" do
    put :update, :id => isbns(:one).to_param, :isbn => { }
    assert_redirected_to isbn_path(assigns(:isbn))
  end

  test "should destroy isbn" do
    assert_difference('Isbn.count', -1) do
      delete :destroy, :id => isbns(:one).to_param
    end

    assert_redirected_to isbns_path
  end
end
