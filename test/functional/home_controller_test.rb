require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  test "should get empty index" do
    get :index
    assert_response :success # 200
    assert_equal [], assigns(:products)
    assert assigns(:payment_methods)
  end  
  
  test "should get index with products" do
    front = Array.new(5){|i| Product.create :name => "front #{i}", :price => 1, :stock => 1, :front => true, :description => 'no'*25}
    get :index
    assert_response :success
    assert_equal front, assigns(:products)
    5.times{|i| assert_select 'h4', "front #{i}"}
  end
  
  test "should get product" do  
    product = Product.create :name => "front", :price => 1, :stock => 1, :front => true, :description => 'no'*25
    get :product, :id => product.id
    assert_response :success
    assert_assigns(:product)
    assert_select 'h2', "front"}
  end
  
end
