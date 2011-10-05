require 'test_helper'

class LivrosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:livros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create livro" do
    assert_difference('Livro.count') do
      post :create, :livro => { }
    end

    assert_redirected_to livro_path(assigns(:livro))
  end

  test "should show livro" do
    get :show, :id => livros(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => livros(:one).to_param
    assert_response :success
  end

  test "should update livro" do
    put :update, :id => livros(:one).to_param, :livro => { }
    assert_redirected_to livro_path(assigns(:livro))
  end

  test "should destroy livro" do
    assert_difference('Livro.count', -1) do
      delete :destroy, :id => livros(:one).to_param
    end

    assert_redirected_to livros_path
  end
end
