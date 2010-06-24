require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  # Não esquecer de deletar o Fixture : /test/fixtures/nomeDaTabela
  
  %w{name price}.each do |col|
    test "#{col} should be required" do
      address = Product.create
      assert address.errors.on(col)
    end
  end
  
  test "should filter front products" do
=begin
    p1 = Product.create :name => 'p1', :price => 1, :stock => 1, :front => true, :description => 'no'*25
    p2 = Product.create :name => 'p2', :price => 1, :stock => 1, :front => true, :description => 'no'*25
    p3 = Product.create :name => 'p3', :price => 1, :stock => 1, :front => true, :description => 'no'*25
    p4 = Product.create :name => 'p4', :price => 1, :stock => 1, :front => true, :description => 'no'*25
    p5 = Product.create :name => 'p5', :price => 1, :stock => 1, :front => true, :description => 'no'*25
    p6 = Product.create :name => 'p6', :price => 1, :stock => 1, :front => true, :description => 'no'*25
    assert_equal 3, Product.front.count 
=end  # Refatorado

    #front = Array.new(5) do |i|
    #  Product.create :name => "front #{i}", :price => 1, :stock => 1, :front => true, :description => 'no'*25
    #end
    #    OU
    front = Array.new(5){|i| Product.create :name => "front #{i}", :price => 1, :stock => 1, :front => true, :description => 'no'*25}
    
    5.times {|i| Product.create :name => "not front #{i}", :price => 1, :stock => 1, :front => false, :description => 'no'*25 }
    assert_equal 10, Product.count
    assert_equal 5, Product.front.coun
    assert_equal front.sort_by(&:id), Product.front.sort_by(&:id)
  end
  
  test "should have to param" do
    product = Product.create :name => "Foo Bar Baz", :price => 1, :stock => 1, :front => false, :description => 'no'*25
    assert_equal "#{product.id}-foo-bar-baz", product.to_param
  end
  
end
