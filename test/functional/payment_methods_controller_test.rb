require 'test_helper'

class PaymentMethodsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_methods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_method" do
    assert_difference('PaymentMethod.count') do
      post :create, :payment_method => { }
    end

    assert_redirected_to payment_method_path(assigns(:payment_method))
  end

  test "should show payment_method" do
    get :show, :id => payment_methods(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => payment_methods(:one).id
    assert_response :success
  end

  test "should update payment_method" do
    put :update, :id => payment_methods(:one).id, :payment_method => { }
    assert_redirected_to payment_method_path(assigns(:payment_method))
  end

  test "should destroy payment_method" do
    assert_difference('PaymentMethod.count', -1) do
      delete :destroy, :id => payment_methods(:one).id
    end

    assert_redirected_to payment_methods_path
  end
end
