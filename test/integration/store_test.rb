require 'test_helper'

class StoreTest < ActionController::IntegrationTest

  test "should buy some products" do  
    p1 = Product.create :name => "p1", :price => 5, :stock => 1, :front => true, :description => 'no'*25
    p2 = Product.create :name => "p2", :price => 20, :stock => 1, :front => true, :description => 'no'*25
    p3 = Product.create :name => "p3", :price => 60, :stock => 1, :front => true, :description => 'no'*25
    
    get "/"
    assert_response :success
    assert_select "a[href=?]","/cart/add/#{p1.to_param}"
    assert_select "a[href=?]","/cart/add/#{p2.to_param}"
    assert_select "a[href=?]","/cart/add/#{p3.to_param}"
  
    3.times do 
      get "/cart/add/#{p1.to_param}"
      assert_response :redirect
      assert_redirected_to '/cart'
    end
    
    2.times do
      get "/cart/add/#{p2.to_param}"
      assert_response :redirect
      assert_redirected_to '/cart'
    end
    
    get "/cart/add/#{p3.to_param}"
    assert_response :redirect
    assert_redirected_to '/cart'
    
    get '/cart'
    assert_response :success
    assert_select "span#cart-quantity", "6"
    assert_select "span#cart-total", "115.0"
    assert_select "table" do
      assert_select "tr" do
        assert_select "td", p1.name  
        assert_select "td", "15.0"  
        assert_select "td input[value=?]", "3"
        assert_select "td", p2.name  
        assert_select "td", "40.0"  
        assert_select "td input[value=?]", "2"
        assert_select "td", p3.name  
        assert_select "td", "60.0"  
        assert_select "td input[value=?]", "1"
      end 
    end
  end
end
