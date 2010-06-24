require 'test_helper'

class CartControllerTest < ActionController::TestCase

  test "should add product" do  
    product = Product.create :name => "front", :price => 1, :stock => 1, :front => true, :description => 'no'*25
    assert_difference 'Order.count',1 do
      post :add, :id => product.id
    end
    assert_response :redirect
    assert_redirected_to :action => :index
    order = assigns(:order)
    order.reload
    assert order
    assert_equal 1, order.order_items.count
    assert_equal 1, order.order_items.first.quantity
    assert_equal 1, order.order_items.first.total
    assert_equal product, order.order_items.first.product
    assert_equal 1, order.total
    
  end

end
