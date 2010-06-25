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
    assert assigns(:product)
    assert_select 'h2', "front"
  end
  
  test "should get login" do
     get :login
     assert_response :success
     assert_select 'form' do
       assert_select 'input[name=login]'
       assert_select 'input[name=password]'
     end
  end
  
  test "should not login" do
    post :login, :login => 'wrong', :password => 'error'
    assert_response :redirect
    assert_redirected_to :action => :login
  end
  
  test "should login" do
    user = User.create! :name => 'Abcd', :password => '12346', :email => 'foo@bar.com.br', :cep => '12345-123', :login => 'abcd', :address => 'street', :terms => true
    post :login, :login => 'abcd', :password => '12346'
    assert_response :redirect
    assert_redirected_to :controller => :home, :action => :index
    assert_equal user.id, session[:user_id]
  end
  
end
